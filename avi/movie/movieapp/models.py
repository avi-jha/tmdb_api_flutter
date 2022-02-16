from turtle import title
from django.db import models
import json
from movieapp import controller



class MyCSvModel(models.Model):
     Title = models.CharField(max_length = 300, default='#')
     RatingTomatometer = models.CharField(max_length = 300, default='#')
     Genres = models.CharField(max_length = 300, default='#')

     class Meta:
         db_table='csvmodel'

# csvmodel=MyCSvModel()
# title1=controller.title
# ratt1=controller.ratt
# genres1=controller.genres
# for i in range(len(title1)):
#     csvmodel.Title=str(title1[i])
#     csvmodel.RatingTomatometer=int(ratt1[i])
#     csvmodel.Genres=str(genres1[i])
#     csvmodel.save()

class moviep(models.Model):
    preference= models.CharField(max_length = 300, default='#')

class user(models.Model):
    username=models.CharField(max_length = 50)
    key = models.CharField(max_length = 50)
    date=models.DateTimeField(auto_now_add= True)
    
    def __str__(self):
        return self.username


