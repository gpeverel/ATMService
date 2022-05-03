<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<h4>Регистрация администратора</h4>
<form action="/registration/admin" method="post">
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