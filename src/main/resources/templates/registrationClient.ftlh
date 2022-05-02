<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<h4>Регистрация</h4>
<form action="/registration/client" method="post">
    Название организации: <input type="text" name="title"><br><br>
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