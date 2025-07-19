from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Employee(models.Model):
    id = models.AutoField(primary_key = True)
    first_name = models.CharField(max_length = 100)
    last_name = models.CharField(max_length = 100)
    dob = models.DateField(null = True)
    hire_date = models.DateField()
    employment_end_date = models.DateField(null = True)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    author = models.ForeignKey(User)