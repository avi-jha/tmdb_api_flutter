# Generated by Django 4.0.1 on 2022-02-04 11:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movieapp', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='save',
        ),
        migrations.AddField(
            model_name='user',
            name='key',
            field=models.IntegerField(default=0),
        ),
    ]
