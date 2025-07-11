from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Customer(models.Model):
    id = models.AutoField(primary_key = True)
    first_name = models.CharField(max_length = 100)
    last_name = models.CharField(max_length = 100)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    author = models.ForeignKey(User)

class Address(models.Model):
    id = models.AutoField(primary_key = True)
    address_line_1 = models.CharField(max_length = 100)
    address_line_2 = models.CharField(max_length = 100)
    city = models.ForeignKey(models.City)
    zip = models.IntegerField(max_length = 5)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    author = models.ForeignKey(User)

class City(models.Model):
    id = models.AutoField(primary_key = True)
    name = models.CharField(max_length = 100)
    state = models.ForeignKey(models.State)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    author = models.ForeignKey(User)

class State(models.Model):
    id = models.AutoField(primary_key = True)
    name = models.CharField(max_length = 2, unique = True)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    author = models.ForeignKey(User)