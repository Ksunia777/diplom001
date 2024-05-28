from django.shortcuts import render
from django.http import HttpResponse

from main.models import Menu

# import models.menu


def index(request) :
    return  HttpResponse("<h4>help</h4>")


def avt(request):
    return render(request, 'Avtorisation.html')


def set(request):
    return render(request, 'Settings.html')

def menu(request):

    drinks = Menu.objects.all()

    context = {"drinks_list": drinks
        #        [
        # {"name":context2[0].position_name, "description": "some desc1", "cost":123.00},
        # {"name":"name2", "description": "some desc2", "cost":23.00},
        # {}
        # ]
        }
    return render(request, 'Menu.html', context)

def barista(request):
    return render(request, 'Barista.html')


def cheklist(request):
    return render(request, 'ChekList.html')


def doc(request):
    return render(request, 'Documentation.html')


def inv(request):
    return render(request, 'Inventarisation.html')


def stock(request):
    return render(request, 'Stock.html')

def one(request) :
    return render(request, '1.html')


def two(request):
    return render(request, '2.html')


def three(request):
    return render(request, '3.html')

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


