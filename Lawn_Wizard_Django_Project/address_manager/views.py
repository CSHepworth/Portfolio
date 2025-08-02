from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def testing(request):
    return HttpResponse("Testing...")

def test_field(request, field):
    return render(request, "test_field.html", {"field": field})