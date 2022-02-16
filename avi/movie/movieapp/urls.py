from django.urls import path
from .views import usergetcreate ,userupdatedelete
from .views import usergetcreate1 ,userupdatedelete1

urlpatterns = [
    path('',usergetcreate.as_view()),
    path('movie',usergetcreate1.as_view())
]