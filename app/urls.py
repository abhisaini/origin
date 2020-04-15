from django.urls import path, include
from app import views
from django.contrib.auth import views as auth_views
from django.views.generic import TemplateView
from app import decos
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
        path('', views.homepage),
        path('home', views.homepage),
        path('create-test', views.create_test),
        path('add-section/<test_id>', views.add_sections),
        path('add-answer-key/<test_id>', views.add_answerkey),
        path('attempt-test/<test_id>', views.attempt_test),
        path('analyze-test/<attempt_id>', views.attempt_analyze),
        path('test-profile/<test_id>', views.test_profile),
        path('test-info/<test_id>', views.test_info),
        path('test-list/', views.test_list),
        path('test-history/', views.test_history),
        path('my-created/', views.my_created),
        path('signup', views.signup),
        path('login', decos.logout_required(auth_views.LoginView.as_view(template_name = 'register/login.html')),name = 'login'),
        # path('gall', views.getAll),
        path('logout', auth_views.LogoutView.as_view(next_page = '/'), name = 'logout' ),
        # path('activate/<uidb64>/<token>/',views.activate, name='activate'),
        # path('account_activation_sent',views.account_activation_sent, name='account_activation_sent'),
        # path('loginu', views.loginUser),
        # path('create-teacher', views.create_teacher),
        # path('teacher-profile/<teacher_id>/', views.teacher_profile),
        # path('rate-teacher/<teacher_id>/', views.do_rate),
        # path('teachers', views.get_teachers),
        # path('base', TemplateView.as_view(template_name='base.html'))

    ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)+  static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

#
# from django.conf import settings
# if settings.DEBUG:
#     urlpatterns += [ path(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
#             'document_root': settings.MEDIA_ROOT,
#         }), ]
