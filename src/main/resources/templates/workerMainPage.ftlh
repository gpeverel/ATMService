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
<h3>Главная страница сотрудника обслуживающего персонала</h3>
<div>
    <p>Ваше ФИО: ${worker.fullName}</p>
    <p>Ваша квалификация: ${worker.qualification}</p>
</div>
<h4>Список свободных заявок подходящих под вашу квалификацию:</h4>
<form action="/worker" method="get">

    <input type="hidden" name="search" value=true>
    <input type="submit" value="Искать актуальные заявки">
</form><br>
<#if freeApps??>
    <#if freeApps?has_content>
        <table border="1">
            <tr>
                <th>Тип</th>
                <th>Описание</th>
                <th>Дата появления</th>
                <th>Подробная информация</th>
            </tr>
            <#list freeApps as app>
                <tr>
                    <th>${app.type}</th>
                    <th>${app.description}</th>
                    <th>${app.dateAppearance}</th>
                    <th><a href="/application/${app.id}">Подробнее</a></th>
                </tr>
            </#list>
        </table>
    <#else>
        <h3>Свободных заявок нет</h3>
    </#if>
</#if>
<h4>Список заявок, которые вы сейчас выполняете:</h4>
<#if busyApps??>
    <#if busyApps?has_content>
        <table border="1">
            <tr>
                <th>Тип</th>
                <th>Описание</th>
                <th>Дата появления</th>
                <th>Дата взятия</th>
                <th>Подробная информация</th>
            </tr>
            <#list busyApps as app>
                <tr>
                    <th>${app.type}</th>
                    <th>${app.description}</th>
                    <th>${app.dateAppearance}</th>
                    <th>${app.dateBegin}</th>
                    <th><a href="/application/${app.id}">Подробнее</a></th>
                </tr>
            </#list>
        </table>
    <#else>
        <h3>Заявок нет</h3>
    </#if>
</#if>
<hr>
</body>
</html>