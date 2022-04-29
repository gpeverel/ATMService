<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<h4>Подробная информация о банкомате</h4>
<b>Номер банкомата: </b>${machine.number}<br>
<b>Модель банкомата: </b>${machine.model}<br>
<b>Местоположение: </b>${machine.location}<br>
<hr>
<h3>Удалить банкомат</h3>
<form action="/machine/delete/${machine.id}" method="post">
    <input type="submit" value="Удалить">
</form>

</body>
</html>