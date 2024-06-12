# заголовок
## Воскресенье 
1. сделать авторизацию 
    1. ~~сделать бэкаб бд~~
    1. ~~накатить миграции для создания нужных таблиц~~
    1. ~~создать суперпользователя~~
    1...

    разбираемся с авторизацией:

    1. ~~запретить всем видеть страницы~~
    1. ~~разрешить определенной группе видеть интерфейс директора~~ 
    1. ~~увидеть этот интерфейс из-под логина директора~~

1. кнопки редактирования
1. верстка подправить 
1. валидация 

1. схему классов UML СДЕЛАТЬ

1. причесать данные в базе: имена, названия и т.д.

верстка 

1. иконка корзины
1. иконка активности
1. футер
1. хедер
1. формы поправить чтобы работали заверстаные
1. ...




## gists

```js
// код для переключения радиобатона
$(window).keyup(function(e){
	var target = $('.checkbox-ios input:focus');
	if (e.keyCode == 9 && $(target).length){
		$(target).parent().addClass('focused');
	}
});
 
$('.checkbox-ios input').focusout(function(){
	$(this).parent().removeClass('focused');
});

```

## openssl

openssl enc -aes-256-cbc -in ./diplom/diplom.docx -out ./diplom/diplom.docx.enc -iter 10000000

openssl enc -aes-256-cbc -d -in ./diplom/diplom.docx.enc -out ./diplom/diplom.docx -iter 10000000
