from django import forms
from django.contrib.auth.models import User
from app.models import Paper
# from backend.models import Teacher, Ratings, Comment
class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())
    class Meta:
        model = User
        fields = ('first_name', 'last_name' , 'email', 'username', 'password')




class LoginForm(forms.Form):
    username = forms.CharField(max_length = 250, widget=forms.TextInput(attrs={'placeholder': 'Username'}))
    password = forms.CharField(widget=forms.PasswordInput())

class PaperForm(forms.ModelForm):
    qpaper_file = forms.FileField()
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    class Meta:
        model = Paper
        fields = ('name', 'q_count', 'subject', 'duration', 'max_marks', 'syllabus', 'description')
