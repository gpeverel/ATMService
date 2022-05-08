<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<h4>Подробная информация о заявке</h4>
<b>Тип: </b>${app.type}<br>
<b>Описание: </b>${app.description}<br>
<b>Статус: </b>${app.status}<br>
<b>Сотрудник: </b><#if app.worker??>${app.worker.fullName}<#else>Отсутствует</#if><br>
<b>Квалификация: </b>${app.qualification}<br>
<b>Дата появления:</b>${app.dateAppearance}<br>
<b>Дата взятия заявки сотрудником:</b><#if app.dateBegin??>${app.dateBegin}<#else>Отсутствует</#if><br>
<b>Дата окончания работы:</b><#if app.dateEnd??>${app.dateEnd}<#else>Отсутствует</#if><br>
<hr>
<#--<h3>Удалить банкомат</h3>-->
<#--<form action="/app/delete/${app.id}" method="post">-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Удалить">-->
<#--</form>-->

</body>
</html>