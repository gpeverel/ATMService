<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<h4>Регистрация</h4>
<form action="/registration/worker" method="post">
    Ваш ФИО: <input type="text" name="fullName"><br><br>
<#--TODO Добавить сюда выбор квалификаций из всплывающего меню   -->
    Квалификация:
    <select name="qualification">
        <#list qualifications as qualification>
            <option value="${qualification}">${qualification}</option>
        </#list>
    </select><br><br>
    Логин: <input type="text" name="login"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Зарегистрироваться">
</form>
<#if errorMessage??>
    <h2>${errorMessage}</h2>
</#if>

</body>
</html>