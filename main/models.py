from django.db import models

# Create your models here.

class Menu(models.Model):
    idmenu = models.AutoField(primary_key=True)
    description = models.TextField()
    position_name = models.CharField(max_length=100)
    prise = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'menu'
