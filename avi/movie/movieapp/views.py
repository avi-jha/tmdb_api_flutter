from xml.dom.minidom import ReadOnlySequentialNamedNodeMap
from rest_framework import generics
from .models import user,moviep
from .serializers import userserializer,movieserializer

# Create your views here.
class usergetcreate(generics.ListCreateAPIView):
    queryset = user.objects.all()
    serializer_class=userserializer

class userupdatedelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = user.objects.all()
    serializer_class=userserializer
class usergetcreate1(generics.ListCreateAPIView):
    queryset = moviep.objects.all()
    serializer_class=movieserializer

class userupdatedelete1(generics.RetrieveUpdateDestroyAPIView):
    queryset = moviep.objects.all()
    serializer_class=movieserializer     