<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
<#--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"-->
<#--          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">-->
</head>
<body>
<h2>ATM SERVICE</h2>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Выйти">
</form>

<form action="/" method="get">
    Поиск по номеру банкомата: <input type="text" name="number"><br>
    <input type="submit" value="Поиск">
</form>

<h4 class="" >Ваши банкоматы</h4>
<#list machines as machine>
    <div class="btm btm-primary">
        <p><b>${machine.number}</b> ${machine.model} | <a href="/machine/${machine.id}">Подробнее</a></p>
    </div>
<#else>
    <h3>Банкоматов нет</h3>
</#list>
<hr>
<h3>Добавить банкомат</h3>
<form action="/machine/create" method="post">
    Номер: <input type="text" name="number"/><br><br>
    Модель: <input type="text" name="model"/><br><br>
    Местоположение: <input type="text" name="location"/><br><br>
    <input type="submit" value="Добавить">
</form>

</body>
</html>