# Generated by Django 5.2.3 on 2025-07-23 14:30

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("address_manager", "0001_initial"),
    ]

    operations = [
        migrations.AlterField(
            model_name="address",
            name="zip",
            field=models.CharField(max_length=5),
        ),
    ]
