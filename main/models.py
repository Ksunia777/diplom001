from django.db import models

# Create your models here.

class Menu(models.Model):
    idmenu = models.AutoField(primary_key=True)
    description = models.TextField()
    position_name = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    prise = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'menu'

class Deserts(models.Model):
    iddeserts = models.AutoField(primary_key=True)
    description = models.TextField()
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'deserts'

class User(models.Model):
    iduser = models.AutoField(primary_key=True)
    userc_name = models.CharField(max_length=100)
    userc_sername = models.CharField(max_length=100)
    login = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'user'

class Additives(models.Model):
    idadditives = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'additives'