from django.urls import path
from . import views

urlpatterns = [
    path ('', views.index),
    path ('avto', views.avt),
    path ('set', views.set),
    path ('menu',views.menu),
    path ('barista', views.barista),
    path ('cheklist', views.cheklist),
    path ('doc', views.doc),
    path ('inv',views.inv),
    path ('stock', views.stock),
    path ('one', views.one),
    path ('two', views.two),
    path ('three', views.three),
    path ('four',views.four),
    path ('five', views.five),
    path ('six', views.six),
    path ('sev', views.sev),
    path ('eight',views.eight),
    path ('nine', views.nine),
    path ('ten', views.ten),
    path ('el', views.el),
    path ('inv2', views.inv2),
    path ('mor',views.mor),
    path ('evn', views.evn)
]