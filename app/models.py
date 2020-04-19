from django.db import models

from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.translation import gettext as _
from django.utils.timezone import now

# from oauth2client.client import GoogleCredentials
# from google.cloud import storage
# client = storage.Client()
# bucket = client.get_bucket('quicky-14a17.appspot.com')


from gdstorage.storage import GoogleDriveStorage
gd_storage = GoogleDriveStorage()


SPLITTER = "|"
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    U_CHOICES = (
        ("S", _("Student")),
        ("T", _("Teacher"))
    )
    u_type = models.CharField(choices = U_CHOICES, default = "S", max_length=1)
    @property
    def full_name(self):
        return "%s %s" % (self.user.first_name, self.user.last_name)
    @property
    def initial(self):
        try:
            return "%s%s" % (self.user.first_name[0], self.user.last_name[0])
        except:
            return "AB"


class Paper(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE, null=True)

    name = models.CharField(max_length = 200, default = "")
    qpaper_file = models.FileField(upload_to='papers/', storage = gd_storage)
    soln_file = models.FileField(upload_to='papers/', blank = True, storage = gd_storage)
    q_count = models.IntegerField(null = True)
    q_type = models.CharField(max_length = 2000, default = "")
    answer_key = models.CharField(max_length = 2000, default = "")
    marking_scheme = models.CharField(max_length = 200, default = "")
    negative_marking_scheme = models.CharField(max_length = 200, default = "")
    syllabus = models.CharField(max_length = 500, default = "")
    SUB_CHOICES = (
        ("PCM", _("Physics-Chemistry-Maths")),
        ("P", _("Physics")),
        ("C", _("Chemistry")),
        ("M", _("Maths")),

    )
    subject = models.CharField(choices = SUB_CHOICES, default = "PCM", max_length=3)
    description = models.CharField(max_length = 2000, default = "")
    duration = models.IntegerField(null = True)
    max_marks = models.IntegerField(null = True)
    created_at = models.DateTimeField(default=now)
    # positive_marking = models.CharField(max_length = 200, default = "")
    def save(self, *args, **kwargs):
        self.max_marks = 0
        for i in self.marking_scheme.strip()[1:]:
            self.max_marks += int(i)
        super(Paper, self).save(*args, **kwargs)

class Attempt(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    paper = models.ForeignKey(Paper, on_delete=models.CASCADE)
    response = models.CharField(max_length = 2000, default = "")
    q_result = models.CharField(max_length = 200, default = "")
    marks = models.IntegerField( default = 0)
    created_at = models.DateTimeField(default=now)


@receiver(post_save, sender=User)
def update_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()


    # def save(self, request, objects):
    #     print("PPPP : ", request.user)
    #     super().save(self, request, obj)
