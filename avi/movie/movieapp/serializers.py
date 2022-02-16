from dataclasses import fields
from rest_framework import serializers
from .models import moviep, user


class userserializer(serializers.ModelSerializer):
    class Meta:
        model=user
        fields = '__all__'

class movieserializer(serializers.ModelSerializer):
    class Meta:
        model=moviep
        fields = '__all__'