# Generated by Django 4.0.1 on 2022-02-09 08:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('movieapp', '0003_mycsvmodel'),
    ]

    operations = [
        migrations.DeleteModel(
            name='MyCSvModel',
        ),
    ]