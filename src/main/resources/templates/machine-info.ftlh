<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<form action="/" method="get">
    <input type="submit" value="Назад на главную">
</form>
<h4>Подробная информация о банкомате</h4>
<b>Номер банкомата: </b>${machine.number}<br>
<b>Модель банкомата: </b>${machine.model}<br>
<b>Местоположение: </b>${machine.location}<br>
<b>Организация: </b>${machine.client.title}<br>
<hr>
<#if machine.client.id == user.id>
    <h3>Удалить банкомат</h3>
    <form action="/machine/delete/${machine.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Удалить">
    </form>
    <h3>Оставить заявку на обслуживание</h3>
    <form action="/application/create" method="post">
        Описание заявки: <input type="text" name="description"><br><br>
        <input type="hidden" name="machineId" value="${machine.id}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Подтвердить обработку">
    </form>
</#if>

<h3>Заявки по данному банкомату</h3>
<#if apps?has_content>
    <table border="1">
        <tr>
            <th>Тип</th>
            <th>Описание</th>
            <th>Статус</th>
            <th>Сотрудник</th>
            <th>Квалификация</th>
            <th>Подробная информация</th>
        </tr>
        <#list apps as app>
            <tr>
                <th>${app.type}</th>
                <th>${app.description}</th>
                <th>${app.status}</th>
                <th><#if app.worker??>${app.worker.fullName}<#else>Отсутствует</#if></th>
                <th><#if app.qualification??>${app.qualification}<#else>Отсутствует</#if></th>
                <th><a href="/application/${app.id}">Подробнее</a></th>
            </tr>
        </#list>
    </table>
<#else>
    <h3>Заявок нет</h3>
</#if>
</body>
</html>