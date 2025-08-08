from django.shortcuts import render, HttpResponseRedirect
from django.http import HttpResponse, JsonResponse

from address_manager.models import Address

# Create your views here.
def testing(request):
    return HttpResponse("Testing...")

def test_field(request, field):
    return render(request, "test_field.html", {"field": field})