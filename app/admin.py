from django.contrib import admin
from app.models import Paper, Attempt, Profile

class PaperAdmin(admin.ModelAdmin):
    pass
admin.site.register(Paper, PaperAdmin)

class AttemptAdmin(admin.ModelAdmin):
    pass
admin.site.register(Attempt, AttemptAdmin)


class ProfileAdmin(admin.ModelAdmin):
    pass
admin.site.register(Profile, ProfileAdmin)
