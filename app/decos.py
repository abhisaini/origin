from django.shortcuts import redirect
from functools import wraps
from django.contrib.auth.models import User

def logout_required(f):
    @wraps(f)
    def wrap(request, *args, **kwargs):
        # if User.objects.filter(username = request.user):
        if request.user.is_anonymous or request.user is None:
            return f(request, *args, **kwargs)
        return redirect("/")

    return wrap



    # @user_passes_test(tests.logo , login_url = '/api/account_activation_sent')
