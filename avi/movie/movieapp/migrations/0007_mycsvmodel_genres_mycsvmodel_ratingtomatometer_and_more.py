# Generated by Django 4.0.1 on 2022-02-09 12:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movieapp', '0006_remove_mycsvmodel_genres_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='mycsvmodel',
            name='Genres',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='mycsvmodel',
            name='RatingTomatometer',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='mycsvmodel',
            name='Title',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
