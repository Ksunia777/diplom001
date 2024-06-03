from django.shortcuts import render
from django.http import HttpResponse

from main.models import Menu,Deserts,User,Additives

# import models.menu


def index(request) :
    return  HttpResponse("<h4>help</h4>")


def avt(request):
    return render(request, 'Avtorisation.html')

def add(request):
    return render(request, 'Additives.html')


def set(request):
    return render(request, 'Settings.html')

def menu(request):

    drinks = Menu.objects.all()
    deserts = Deserts.objects.all()
    additives = Additives.objects.all()
    context = {
        "drinks_list": drinks,
        "deserts_list": deserts,
        "additives_list": additives
        #        [
        # {"name":context2[0].position_name, "description": "some desc1", "cost":123.00},
        # {"name":"name2", "description": "some desc2", "cost":23.00},
        # {}
        # ]
        }
    return render(request, 'Menu.html', context)

def menu2(request):
    return render(request, 'Menu2.html')

def des(request):
    return render(request, 'Deserts.html')

def barista(request):
    user = User.objects.all()
    context = {
        "user_list": user
    }
    return render(request, 'Barista.html', context)

def barista2(request):
    return render(request, 'Barista2.html')


def cheklist(request):
    return render(request, 'CheckList.html')


def doc(request):
    return render(request, 'Documentation.html')


def inv(request):
    return render(request, 'Inventorisation.html')


def stock(request):
    return render(request, 'Stock.html')

def one(request) :
    return render(request, '1.html')


def two(request):
    return render(request, '2.html')


def three(request):
  
    drinks = Menu.objects.all()
    context = {
        "drinks_list": drinks
    
        }
    return render(request, '3.html', context)

def four(request):
    return render(request, '4.html')

def five(request):
    return render(request, '5.html')


def six(request):
    return render(request, '6.html')


def sev(request):
  return render(request, '7.html')


def eight(request):
    return render(request, '8.html')


def nine(request):
    return render(request, '9.html')


def ten(request):
    return render(request, '10.html')


def el(request):
    return render(request, '11.html')

def inv2(request):
    return render(request, 'Inv2.html')

def mor(request):
    return render(request, 'Morning.html')


def evn(request):
    return render(request, 'Evening.html')


