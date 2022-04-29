<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<h4>Ваши банкоматы</h4>
<#list machines as machine>
    <div>
        <p><b>${machine.number}</b> ${machine.model} | <a href="/machine/${machine.id}">Подробнее</a></p>
    </div>
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