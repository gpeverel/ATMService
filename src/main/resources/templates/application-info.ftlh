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
<h4>Подробная информация о заявке</h4>
<b>Тип: </b>${app.type}<br>
<b>Описание: </b>${app.description}<br>
<b>Статус: </b>${app.status}<br>
<b>Сотрудник: </b><#if app.worker??>${app.worker.fullName}<#else>Отсутствует</#if><br>
<b>Квалификация: </b>${app.qualification}<br>
<b>Дата появления:</b>${app.dateAppearance}<br>
<b>Дата взятия заявки сотрудником:</b><#if app.dateBegin??>${app.dateBegin}<#else>Отсутствует</#if><br>
<b>Дата окончания работы:</b><#if app.dateEnd??>${app.dateEnd}<#else>Отсутствует</#if><br>
<a href="/machine/${app.machine.id}">Подробнее о банкомате</a><br>
<hr>
<#if worker.id??>
    <#if app.worker??>
        <#if app.worker.id == worker.id>
            <form action="/application/done" method="post">
                <input type="hidden" name="appId" value="${app.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Завершить заявку">
            </form>
        <#else>
            <h4>Заявка в работе у другого специалиста</h4>
        </#if>
    <#else>
        <#if app.qualification == worker.qualification>
            <form action="/application/busy" method="post">
                <input type="hidden" name="appId" value="${app.id}">
                <input type="hidden" name="workerId" value="${worker.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Взять заявку">
            </form>
        <#else>
            <h4>Заявка не совпадает с вашей квалификацией</h4>
        </#if>
    </#if>
</#if>

</body>
</html>