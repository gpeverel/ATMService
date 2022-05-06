<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
    <#--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"-->
    <#--          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">-->
</head>
<body>
<h2>ATM SERVICE</h2>
<h4>Панель администратора</h4>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Выйти">
</form>
<p>Таблица организаций-клиентов</p>
<table border="1">
    <tr>
        <th>Логин</th>
        <th>Организация</th>
        <th>Активность</th>
        <th>Активация</th>
        <th>Подробная информация</th>
    </tr>
    <#list clients as client>
        <tr>
            <th>${client.user.login}</th>
            <th>${client.title}</th>
            <th><#if client.user.active>true<#else>false</#if></th>
            <th><form action="/admin/user/activate/${client.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <#if client.user.active>
                        <input type="submit" value="Забанить">
                    <#else>
                        <input type="submit" value="Активировать">
                    </#if>
                </form></th>
            <th>Добавить ссылку</th>
        </tr>
    <#else>
        <h3>Клиентов нет</h3>
    </#list>
</table>
<p>Таблица сотрудников</p>
<table border="1">
    <tr>
        <th>Логин</th>
        <th>ФИО</th>
        <th>Квалификация</th>
        <th>Активность</th>
        <th>Активация</th>
        <th>Подробная информация</th>
    </tr>
    <#list workers as worker>
        <tr>
            <th>${worker.user.login}</th>
            <th>${worker.fullName}</th>
            <th>${worker.qualification}</th>
            <th><#if worker.user.active>true<#else>false</#if></th>
            <th><form action="/admin/user/activate/${worker.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <#if worker.user.active>
                        <input type="submit" value="Забанить">
                    <#else>
                        <input type="submit" value="Активировать">
                    </#if>
                </form></th>
            <th>Добавить ссылку</th>
        </tr>
    <#else>
        <h3>Сотрудников нет</h3>
    </#list>
</table>
</body>
</html>