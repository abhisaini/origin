# Generated by Django 2.1.7 on 2020-04-17 06:40

from django.db import migrations, models
import gdstorage.storage


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0009_auto_20200416_1040'),
    ]

    operations = [
        migrations.AlterField(
            model_name='paper',
            name='qpaper_file',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to='papers/'),
        ),
        migrations.AlterField(
            model_name='paper',
            name='soln_file',
            field=models.FileField(blank=True, storage=gdstorage.storage.GoogleDriveStorage(), upload_to='papers/'),
        ),
    ]