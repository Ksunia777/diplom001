from django.shortcuts import render

from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from main.models import Menu, Deserts, Additives, Stock, Task

from django.http import HttpResponse, HttpResponseForbidden, HttpResponseRedirect
import json
from django.contrib.auth import login, logout, authenticate
from django.shortcuts import redirect, render


from django.contrib.auth.models import Group, User

from functools import wraps

def group_required(*group_names):
    def decorator(view_func):
        @wraps(view_func)
        def wrapper(request, *args, **kwargs):
            if not request.user.groups.filter(name__in=group_names).exists():
                return HttpResponseRedirect(f'/accounts/login?next={request.path}')
            return view_func(request, *args, **kwargs)
        return wraps(wrapper)(user_passes_test(lambda u: u.is_authenticated))(wrapper)
    return decorator




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

@login_required
@group_required('director')
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
    
@login_required
@group_required('director')    
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

@login_required
@group_required('director')    
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

@login_required
@group_required('director')    
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

        new_drink = Menu(position_name=name, description=description, category=category,price=price)
        new_drink.save()
        return render(request, 'Menu.html',context)
    else:
        return render(request, 'Meru.html',context)  

@login_required
@group_required('director')    
def add_user(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        sername = request.POST.get('sername')
        login = request.POST.get('login')
        password = request.POST.get('password')
        group = Group.objects.get(name='barista')
        

        new_user = User.objects.create_user(first_name=name,last_name=sername,username=login,password=password)
        new_user.groups.add(group)
        # new_user = User
        new_user.save()
        return render(request, 'AddBarista.html')
    else:
        # Возвращаем форму HTML для добавления новой записи
        return render(request, 'AddBarista.html')

@login_required
@group_required('director')    
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

@login_required
@group_required('director')
def del_stock(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idstock = request.POST.get('id')
        row = Stock.objects.get(idstock=idstock)
        row.delete()
    return HttpResponse('Stock added successfully')

@login_required
@group_required('director')
def del_task(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idtask = request.POST.get('id')
        row = Task.objects.get(idtask=idtask)
        row.delete()
    return HttpResponse('Task added successfully')

@login_required
@group_required('director')
def del_user(request):
    if request.method == 'POST':
        # Получаем данные из формы
        id = request.POST.get('id')
        row = User.objects.get(id=id)
        row.delete()
    return HttpResponse('Barista added successfully')

@login_required
@group_required('director')
def del_deserts(request):
    if request.method == 'POST':
        # Получаем данные из формы
        iddeserts = request.POST.get('iddeserts')
        row = Deserts.objects.get(iddeserts=iddeserts)
        row.delete()
    return HttpResponse('Deserts added successfully')

@login_required
@group_required('director')
def del_additives(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idadditives = request.POST.get('idadditives')
        row = Additives.objects.get(idadditives=idadditives)
        row.delete()
    return HttpResponse('additives added successfully')

@login_required
@group_required('director')
def del_drink(request):
    if request.method == 'POST':
        # Получаем данные из формы
        idmenu = request.POST.get('idmenu')
        row = Menu.objects.get(idmenu=idmenu)
        row.delete()
    return HttpResponse('additives added successfully')

def index(request) :
    return  HttpResponse("<h4>help</h4>")

@login_required
@group_required('director')
def editBarista(request):

    baristaId = request.POST.get('id_user') if request.POST.get('id_user') else request.GET.get('user_id')
    user = User.objects.get(id=baristaId)
    context = {
        'barista_data' : user
    }

    # получить из бд данные бариста
    # передать их в контекст
    # вывести как значения в форме редактирования

    # написать для редактирования
    if request.method == 'POST':

        user.first_name = request.POST.get('name')
        user.last_name = request.POST.get('sername')
        user.username = request.POST.get('login')
        user.password = request.POST.get('password')

        user.save()
        return render(request, 'editBarista.html', context)
    else:
        # Возвращаем форму HTML для добавления новой записи

        return render(request, 'editBarista.html', context)

@login_required
@group_required('director')   
def editMenu(request):
    menuId = request.POST.get('id_menu') if request.POST.get('id_menu') else request.GET.get('menu_id')
    menu = Menu.objects.get(idmenu=menuId)

    menu.price = format(menu.price, '.2f')

    context = {
        'menu_data' : menu
    }

    if request.method == 'POST':

        menu.position_name = request.POST.get('name')
        menu.description = request.POST.get('description')
        menu.category = request.POST.get('category')
        menu.price = request.POST.get('price')

        menu.save()
        return render(request, 'editMenu.html', context)
    else:
        # Возвращаем форму HTML для добавления новой записи

        return render(request, 'editMenu.html', context)

@login_required
@group_required('director')    
def editDesert(request):
    desertId = request.POST.get('id_desert') if request.POST.get('id_desert') else request.GET.get('desert_id')
    desert = Deserts.objects.get(iddeserts=desertId)

    desert.price = format(desert.price, '.2f')
    
    context = {
        'desert_data' : desert
    }

    if request.method == 'POST':

        desert.name = request.POST.get('name')
        desert.description = request.POST.get('description')
        desert.price = request.POST.get('price')

        desert.save()
        return render(request, 'editDeserts.html', context)
    else:
        # Возвращаем форму HTML для добавления новой записи

        return render(request, 'editDeserts.html', context)
    
@login_required
@group_required('director')    
def editAdditives(request):
    additivesId = request.POST.get('id_additives') if request.POST.get('id_additives') else request.GET.get('additives_id')
    additives = Additives.objects.get(idadditives=additivesId)

    additives.price = format(additives.price, '.2f')
    
    context = {
        'additives_data' : additives
    }

    if request.method == 'POST':

        additives.name = request.POST.get('name')
        additives.category = request.POST.get('category')
        additives.price = request.POST.get('price')

        additives.save()
        return render(request, 'editAdditives.html', context)
    else:
        # Возвращаем форму HTML для добавления новой записи

        return render(request, 'editAdditives.html', context)

def avt(request):
    return render(request, 'Avtorisation.html')

@login_required
@group_required('director')
def add(request):
    return render(request, 'Additives.html')

@login_required
@group_required('director')
def set(request):
    return render(request, 'Settings.html')

@login_required
@group_required('director')
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

@login_required
@group_required('director')
def menu2(request):
    return render(request, 'Menu2.html')

@login_required
@group_required('director')
def des(request):
    return render(request, 'Deserts.html')

@login_required
@group_required('director')
def barista(request):
# Получение группы по имени
    group = Group.objects.get(name='barista')
# Получение пользователей, которые принадлежат к группе
    users = User.objects.filter(groups__in=[group])
    context = {
        "user_list": users
    }
    return render(request, 'Barista.html', context)

@login_required
@group_required('director')
def add_barista(request):
    return render(request, 'AddBarista.html')

@login_required
@group_required('director')
def cheklist(request):
    task = Task.objects.all()
    context = {
        "task_list": task
    }
    return render(request, 'CheckList.html', context)

@login_required
@group_required('director')
def doc(request):
    return render(request, 'Documentation.html')

@login_required
@group_required('director')
def inv(request):
    return render(request, 'Inventorisation.html')

@login_required
@group_required('director')
def stock(request):
     stock = Stock.objects.all()
     context = {
        "stock_list": stock,
        }
     return render(request, 'Stock.html',context)

@login_required
@group_required('barista')
def one(request) :
    return render(request, '1.html')

@login_required
@group_required('barista')
def two(request):
    return render(request, '2.html')

@login_required
@group_required('barista')
def three(request):
  
    drinks = Menu.objects.all()
    context = {
        "drinks_list": drinks
    
        }
    return render(request, '3.html', context)

@login_required
@group_required('barista')
def four(request):
    return render(request, '4.html')

@login_required
@group_required('barista')
def five(request):
    return render(request, '5.html')

@login_required
@group_required('barista')
def six(request):
    return render(request, '6.html')

@login_required
@group_required('barista')
def sev(request):
  return render(request, '7.html')

@login_required
@group_required('barista')
def eight(request):
    return render(request, '8.html')

@login_required
@group_required('barista')
def nine(request):
    return render(request, '9.html')

@login_required
@group_required('barista')
def ten(request):
    return render(request, '10.html')

@login_required
@group_required('barista')
def el(request):
    return render(request, '11.html')

@login_required
@group_required('barista')
def inv2(request):
    return render(request, 'Inv2.html')

@login_required
@group_required('barista')
def mor(request):
    return render(request, 'Morning.html')

@login_required
@group_required('barista')
def evn(request):
    return render(request, 'Evening.html')

@login_required
@group_required('barista')
def task(request):
    task = Task.objects.all()
    context = {
        "task_list": task
    
        }
    return render(request, 'Task.html', context)


def custom_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)

            if user.groups.filter(name='barista').exists():
                return redirect('/one')
            elif user.groups.filter(name='director').exists():
                return redirect('/menu')

            # Проверяем роль пользователя и перенаправляем его на соответствующую страницу
            if user.is_superuser:
                return redirect('admin:index')
            else:
                return redirect('dashboard')
        else:
            # Отображаем сообщение об ошибке входа
            error_message = 'Invalid username or password'
            return render(request, 'login.html', {'error_message': error_message})
    else:
        return render(request, 'login.html')


def custom_logout(request):
    logout(request)
    # Перенаправление на страницу входа
    return redirect('login')
