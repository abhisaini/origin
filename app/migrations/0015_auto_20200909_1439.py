# Generated by Django 3.1.1 on 2020-09-09 14:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0014_auto_20200419_0927'),
    ]

    operations = [
        migrations.AddField(
            model_name='attempt',
            name='ip_address',
            field=models.CharField(default='', max_length=15),
        ),
        migrations.AddField(
            model_name='attempt',
            name='time_taken',
            field=models.IntegerField(default=0),
        ),
    ]