# Generated by Django 2.1.7 on 2020-04-16 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0008_auto_20200415_0845'),
    ]

    operations = [
        migrations.AlterField(
            model_name='paper',
            name='q_type',
            field=models.CharField(default='', max_length=2000),
        ),
    ]
