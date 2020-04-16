from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required, user_passes_test
from app.forms import UserForm, LoginForm, PaperForm
from django.contrib.auth.models import User
from django.conf import settings
from django.core.mail import send_mail
from django.http import HttpResponse
from django.db.models import Q
from django.views.decorators.csrf import csrf_exempt
# from backend.models import Teacher, Ratings, Comment
from app.models import Paper, Attempt
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.db.models.functions import TruncDate
# from FMS.tokens import account_activation_token
from django.utils.encoding import force_text, force_bytes
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
import json

from app import decos

Q_TYPE = {
    "M": "MCQ",
    "I": "INTEGER"
}

@decos.logout_required
def signup(request):
    if request.method == "POST":
        user_form = UserForm(request.POST)
        if user_form.is_valid():
            # user_form.save()
            print("aaaa")
            user = User.objects.create_user(username = user_form.cleaned_data.get('username'),
                    password = user_form.cleaned_data.get('password'),
                    first_name = user_form.cleaned_data.get('first_name'),
                    last_name = user_form.cleaned_data.get('last_name'))
            # user.is_active = False
            user.save()
            user.profile.u_type = request.POST["u_type"]
            login(request, user)
            print("ppppp")

            return redirect('/')

    else :
        user_form = UserForm()
    return render(request, 'register/signup.html',{'form' : user_form} )

@login_required(login_url = '/login')
def homepage(request):
    if request.user.profile.u_type == "T":
        return redirect("/my-created")
    if request.user.profile.u_type == "S":
        return redirect("/test-list")
    user = User.objects.get(username = request.user.username)
    return render(request, 'register/home.html', {'user': user})

@login_required(login_url = '/login')
def create_test(request):
    user = User.objects.get(username = request.user.username)
    if request.method == 'POST':
        paper_form = PaperForm(request.POST, request.FILES)
        print()
        if paper_form.is_valid():
            # file is saved
            m = paper_form.save(commit=False)
            m.author = user
            m.qpaper_file = request.FILES['qpaper_file']
            if request.FILES['soln_file']:
                m.soln_file = request.FILES['soln_file']
            m.save()
            print("M:", m.qpaper_file)
            print()
            return redirect("add-section/{0}".format(m.id))
        print(paper_form.errors)
    else:

        paper_form = PaperForm()
        # print(paper_form)
        params = {'user': user, "paper_form": "paper_form"}
        params["nav_active"] = "nav_createtest"
    return render(request, 'tests/create.html', params)

@login_required(login_url = '/login')
@csrf_exempt
def add_sections(request, test_id):
    user = User.objects.get(username = request.user.username)
    qpaper = Paper.objects.get(id=test_id)
    if request.method == 'POST':
        print("POST:", request.POST['data'])
        print(request.POST['data'].strip())
        section_data = json.loads(request.POST['data'].strip())
        pos_marks = (1+qpaper.q_count) * ["4"] # 1 for offset, start index from 1
        neg_marks = (1+qpaper.q_count) * ["1"]
        types = (1+qpaper.q_count) * ["MCQ"]
        print(section_data)
        for x in section_data:
            for i in range(int(x["begin"]), int(x["end"])+1):
                types[i] = x["q_type"]
                pos_marks[i] = str(int(x["pos"]))
                neg_marks[i] = str(int(x["neg"]))
        qpaper.marking_scheme = "".join(pos_marks)
        qpaper.q_type = "|".join(types)
        qpaper.negative_marking_scheme = "".join(neg_marks)
        qpaper.save()
        # anskeys
        return redirect("/add-answer-key/{0}".format(qpaper.id))
    else:
        params = {'user': user, 'qpaper': qpaper}
        params["nav_active"] = "nav_createtest"
        return render(request, 'tests/add_section.html', params)

@login_required(login_url = '/login')
@csrf_exempt
def add_answerkey(request, test_id):
    user = User.objects.get(username = request.user.username)
    qpaper = Paper.objects.get(id=test_id)
    if request.method == 'POST':
        answer_key = json.loads(request.POST['data'].strip())
        qpaper.answer_key = "|".join(answer_key)
        qpaper.save()
        return redirect("/test-profile/{0}".format(qpaper.id))

    else:
        qc = qpaper.q_count
        qc4 = int(qc/4)
        r1 = 0
        r2 = qc-qc4*4
        if r2 > 1:
            r1 = 1
            r2 -= 1
        val1 = 1+qc4 + r1
        val2 = val1 + qc4
        val3 = val2 + qc4
        val4 = val3 + qc4 + r2
        print(val1, val2, val3, val4)
        qarr = [range(1,val1 ), range(val1, val2), range(val2, val3), range(val3, val4)]
        l = list(range(100))
        params = {'user': user, 'qpaper': qpaper, 'qarr': qarr, 'l':l}
        params["nav_active"] = "nav_createtest"
        params['q_type'] = qpaper.q_type.split("|")
        return render(request, 'tests/add_answerkey.html', params)

@login_required(login_url = '/login')
@csrf_exempt
def attempt_test(request, test_id):
    user = User.objects.get(username = request.user.username)
    qpaper = Paper.objects.get(id=test_id)
    if request.method == 'POST':
        exam_response = json.loads(request.POST["exam_response"])
        answer_key = qpaper.answer_key.split("|")
        marking_scheme = qpaper.marking_scheme
        negative_marking_scheme = qpaper.negative_marking_scheme
        marks = 0
        q_result = "0"
        for i in range(1, qpaper.q_count + 1):
            print("XIXIXI", i, len(answer_key))
            if exam_response[i] == "_":
                q_result += "_"
            elif exam_response[i] == answer_key[i]:
                q_result += "1"
                marks += int(marking_scheme[i])
            else:
                print(exam_response[i], answer_key[i])
                marks -= int(negative_marking_scheme[i])
                q_result += "0"
        attempt_new = Attempt(user = request.user,
                paper = qpaper,
                response = "|".join(exam_response),
                q_result = q_result,
                marks = marks)
        attempt_new.save()
        return redirect('/analyze-test/{0}'.format(attempt_new.id))



    else:
        qc = qpaper.q_count
        if qc <= 20:
            qarr = [0, range(1,qc)]
            idx_arr = [1]
            sec_arr = [0, '{0} - {1}'.format(1, qc)]
        elif qc <= 40:
            qarr = [0, range(1,int(qc/2) + 1), range(int(qc/2) + 1, qc+1)]
            idx_arr = [1,2]
            sec_arr = [0, '{0} - {1}'.format(1, int(qc/2)),
            '{0} - {1}'.format(int(qc/2) +1, qc)]
        else:
            qarr = [0, range(1,int(qc/3) + 1), range(int(qc/3) + 1, 2*int(qc/3) + 1), range(2*int(qc/3) + 1, qc+1)]
            idx_arr = [1, 2, 3]
            sec_arr = [0, '{0} - {1}'.format(1, int(qc/3)),
            '{0} - {1}'.format(int(qc/3) +1, 2*int(qc/3)),
            '{0} - {1}'.format(2*int(qc/3) +1, qc)]

        params = {'user': user, 'qpaper': qpaper}
        params['idx_arr'] = idx_arr
        params['qarr'] = qarr
        params['sec_arr'] = sec_arr
        params['q_type'] = qpaper.q_type.split("|")
        params['marking_scheme'] = [int(i) for i in qpaper.marking_scheme]
        params['negative_marking_scheme'] = [-1*int(i) for i in qpaper.negative_marking_scheme]
        return render(request, 'attempt/attempt_content.html', params)

@login_required(login_url = '/login')
@csrf_exempt
def attempt_analyze(request, attempt_id):
    attempt = Attempt.objects.get(id =attempt_id)
    params = {}
    params["nav_active"] = "nav_testhistory"
    params["response"] = attempt.response.split("|")
    params["user"] = User.objects.get(username =request.user.username)
    params["qpaper"] = attempt.paper
    params["q_result"] = attempt.q_result
    params["marks"] = attempt.marks
    params["answer_key"] = attempt.paper.answer_key.split("|")
    params["qarr"] = range(1, attempt.paper.q_count + 1)
    params['marking_scheme'] = [int(i) for i in attempt.paper.marking_scheme]
    params['negative_marking_scheme'] = [-1*int(i) for i in attempt.paper.negative_marking_scheme]
    print("PP:", attempt.paper.soln_file)
    return render(request, 'attempt/analyze.html', params)

@login_required(login_url = '/login')
def test_profile(request, test_id):
    params = {}
    qpaper = Paper.objects.get(id = test_id)
    params["nav_active"] = "nav_mycreated"
    params["qpaper"] = qpaper
    params["attempts"] = Attempt.objects.filter(paper = qpaper).order_by('-marks')
    return render(request, 'tests/test_profile.html', params)

@login_required(login_url = '/login')
def test_info(request, test_id):
    paper = Paper.objects.get(id = test_id)
    att = Attempt.objects.filter(user=request.user, paper = paper)
    if(att):
        return redirect('/analyze-test/{0}'.format(att[0].id))
    params = {}
    params["nav_active"] = "nav_testlist"
    qpaper = Paper.objects.get(id = test_id)
    params["qpaper"] = qpaper
    params["attempts"] = Attempt.objects.filter(paper = qpaper).order_by('-marks')
    return render(request, 'tests/test_info.html', params)



@login_required(login_url = '/login')
def my_created(request):
    user = request.user
    params = {}
    params["nav_active"] = "nav_mycreated"
    params["my_tests"] = Paper.objects.filter(author = user).order_by("name")
    return render(request, 'lists/my_created.html', params)


@login_required(login_url = '/login')
def test_list(request):
    user = request.user
    params = {}
    params["nav_active"] = "nav_testlist"
    params["my_tests"] = Paper.objects.all().order_by("name")
    return render(request, 'lists/all_list.html', params)

@login_required(login_url = '/login')
def test_history(request):
    user = request.user
    attempts = Attempt.objects.filter(user = user)
    params = {}
    params["nav_active"] = "nav_testhistory"
    params["attempts"] = attempts
    # print
    return render(request, 'lists/history.html', params)


# @login_required(login_url = '/login')
# def teacher_dashoard(request):
#     created_tests = Paper.objects.filter(user = user)
# def form_initiated(request):
