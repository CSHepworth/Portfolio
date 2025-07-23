from django.db import models
from django.contrib.auth.models import User
from address_manager.models import Address

class Customer(models.Model):
    id = models.AutoField(primary_key = True)
    first_name = models.CharField(max_length = 100)
    last_name = models.CharField(max_length = 100)
    address = models.ForeignKey(Address, on_delete = models.CASCADE)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    author = models.ForeignKey(User, on_delete = models.SET_DEFAULT, default = "")

