# Generated by Django 2.1.7 on 2020-04-15 08:45

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0007_profile_u_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='attempt',
            name='created_at',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AddField(
            model_name='paper',
            name='created_at',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
