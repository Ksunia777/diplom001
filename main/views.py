from django.shortcuts import render

from main.models import Menu, Deserts, User, Additives, Stock, Task

from django.http import HttpResponse
import json


def drinks_list_json(request):

    # Получаем все объекты из таблицы menu, где position_name равно 'Drinks'
    drinks = Menu.objects.all()
    # Преобразуем объекты в список словарей
    drinks_list = list(drinks.values())
    # Преобразуем список словарей в формат JSON
    drinks_json = json.dumps(drinks_list)
    # Возвращаем ответ HTTP с данными в формате JSON
    return HttpResponse(drinks_json, content_type='application/json')

def deserts_list_json(request):

    # Получаем все объекты из таблицы menu, где position_name равно 'deserts'
    deserts = Menu.objects.all()
    # Преобразуем объекты в список словарей
    deserts_list = list(deserts.values())
    # Преобразуем список словарей в формат JSON
    deserts_json = json.dumps(deserts_list)
    # Возвращаем ответ HTTP с данными в формате JSON
    return HttpResponse(deserts_json, content_type='application/json')

def task_list_json(request):

    # Получаем все объекты из таблицы menu, где position_name равно 'Drinks'
    task = Task.objects.all()
    # Преобразуем объекты в список словарей
    task_list = list(task.values())
    # Преобразуем список словарей в формат JSON
    task_json = json.dumps(task_list)
    # Возвращаем ответ HTTP с данными в формате JSON
    return HttpResponse(task_json, content_type='application/json')


def user_list_json(request):

    # Получаем все объекты из таблицы menu, где position_name равно 'Drinks'
    user = User.objects.all()
    # Преобразуем объекты в список словарей
    user_list = list(user.values())
    # Преобразуем список словарей в формат JSON
    user_json = json.dumps(user_list)
    # Возвращаем ответ HTTP с данными в формате JSON
    return HttpResponse(user_json, content_type='application/json')

def additives_list_json(request):

    # Получаем все объекты из таблицы menu, где position_name равно 'Drinks'
    additives = Additives.objects.all()
    # Преобразуем объекты в список словарей
    additives_list = list(additives.values())
    # Преобразуем список словарей в формат JSON
    additives_json = json.dumps(additives_list)
    # Возвращаем ответ HTTP с данными в формате JSON
    return HttpResponse(additives_json, content_type='application/json')


def add_stock(request):
    stock = Stock.objects.all()
    context = {
        "stock_list": stock,
        }
    if request.method == 'POST':
        # Получаем данные из формы
        name = request.POST.get('name')
        price = request.POST.get('price')
        description = request.POST.get('description')
        #idstock = 1000
        # Создаем новую запись в таблице stock
        new_stock = Stock(stockc_name=name, price=price, description=description)
        new_stock.save()
        # Возвращаем ответ HTTP с подтверждением добавления записи
        # return render(request, 'Stock.html')
        return render(request, 'Stock.html',context)
        return HttpResponse('Stock added successfully')
    else:
        # Возвращаем форму HTML для добавления новой записи
        return render(request, 'Stock.html',context)
    
def add_task(request):
    task = Task.objects.all()
    context = {
        "task_list": task,
        }
    if request.method == 'POST':
        # Получаем данные из формы
        description = request.POST.get('description')
        
        new_task = Task( description=description)
        new_task.save()
        return render(request, 'CheckList.html',context)
    else:
        return render(request, 'CheckList.html',context) 
    
def add_desert(request):
    desert = Deserts.objects.all()
    context = {
        "desert_list": desert,
        }
    if request.method == 'POST':
        # Получаем данные из формы
        name = request.POST.get('name')
        description = request.POST.get('description')
        price = request.POST.get('price')
      
        new_desert = Deserts( name=name, description=description, price=price)
        new_desert.save()
        return render(request, 'Menu.html',context)
    else:
        return render(request, 'Menu.html',context) 
    
def add_drink(request):
    drink = Menu.objects.all()
    context = {
        "drink_list": drink,
        }
    if request.method == 'POST':
        # Получаем данные из формы
        name = request.POST.get('name')
        description = request.POST.get('description')
        category = request.POST.get('category')
        price = request.POST.get('price')

        new_drink = Menu(position_name=name, description=description, category=category,priсe=price)
        new_drink.save()
        return render(request, 'Menu.html',context)
    else:
        return render(request, 'Meru.html',context)  
    
def add_user(request):
    user = User.objects.all()
    context = {
        "user_list": user 
    } 
    if request.method == 'POST':
        name = request.POST.get('name')
        sername = request.POST.get('sername')
        login = request.POST.get('login')
        password = request.POST.get('password')

        new_user = User(name=name,sername=sername,login=login,password=password)
        new_user.save()
        return render(request, 'Barista.html', context)
    else:
        # Возвращаем форму HTML для добавления новой записи
        return render(request, 'Barista.html',context)
    
def add_addit(request):
    additives = Additives.objects.all()
    context = {
        "additives_list": additives,
        }
    if request.method == 'POST':
        # Получаем данные из формы
        name = request.POST.get('name')
        category = request.POST.get('category')
        price = request.POST.get('price')
      
        new_additives = Additives( name=name, category=category, price=price)
        new_additives.save()
        return render(request, 'Menu.html',context)
    else:
        return render(request, 'Menu.html',context) 


def del_stock(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idstock = request.POST.get('id')
        row = Stock.objects.get(idstock=idstock)
        row.delete()
    return HttpResponse('Stock added successfully')

def del_task(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idtask = request.POST.get('id')
        row = Task.objects.get(idtask=idtask)
        row.delete()
    return HttpResponse('Task added successfully')


def del_user(request):
    if request.method == 'POST':
        # Получаем данные из формы
        iduser = request.POST.get('iduser')
        row = User.objects.get(iduser=iduser)
        row.delete()
    return HttpResponse('Barista added successfully')

def del_deserts(request):
    if request.method == 'POST':
        # Получаем данные из формы
        iddeserts = request.POST.get('iddeserts')
        row = Deserts.objects.get(iddeserts=iddeserts)
        row.delete()
    return HttpResponse('Deserts added successfully')

def del_additives(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idadditives = request.POST.get('idadditives')
        row = Additives.objects.get(idadditives=idadditives)
        row.delete()
    return HttpResponse('additives added successfully')

def del_drink(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idmenu = request.POST.get('idmenu')
        row = Menu.objects.get(idmenu=idmenu)
        row.delete()
    return HttpResponse('additives added successfully')

def index(request) :
    return  HttpResponse("<h4>help</h4>")

def editBarista(request):

    baristaId = request.POST.get('id_user') if request.POST.get('id_user') else request.GET.get('user_id')
    user = User.objects.get(iduser=baristaId)
    context = {
        'barista_data' : user
    }

    # получить из бд данные бариста
    # передать их в контекст
    # вывести как значения в форме редактирования

    # написать для редактирования
    if request.method == 'POST':

        user.name = request.POST.get('name')
        user.sername = request.POST.get('sername')
        user.login = request.POST.get('login')
        user.password = request.POST.get('password')

        user.save()
        return render(request, 'editBarista.html', context)
    else:
        # Возвращаем форму HTML для добавления новой записи

        return render(request, 'editBarista.html', context)

def avt(request):
    return render(request, 'Avtorisation.html')

def add(request):
    return render(request, 'Additives.html')


def set(request):
    return render(request, 'Settings.html')

def menu(request):

    drink = Menu.objects.all()
    deserts = Deserts.objects.all()
    additives = Additives.objects.all()
    context = {
        "drink_list": drink,
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
    task = Task.objects.all()
    context = {
        "task_list": task
    }
    return render(request, 'CheckList.html', context)


def doc(request):
    return render(request, 'Documentation.html')


def inv(request):
    return render(request, 'Inventorisation.html')


def stock(request):
     stock = Stock.objects.all()
     context = {
        "stock_list": stock,
        }
     return render(request, 'Stock.html',context)

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

def task(request):
    task = Task.objects.all()
    context = {
        "task_list": task
    
        }
    return render(request, 'Task.html', context)


