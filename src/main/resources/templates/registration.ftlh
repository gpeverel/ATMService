<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
<h2>ATM SERVICE</h2>
<h3>Регистрация</h3>
<h4>Вы можете зарегистрироваться по направлениям: </h4>

<form action="/registration/client" method="get">
    <input type="submit" value="Зарегистрироваться как клиент">
</form><br>
<form action="/registration/worker" method="get">
    <input type="submit" value="Зарегистрироваться как сотрудник">
</form><br>
<#if thereIsAdmin == false>
    <form action="/registration/admin" method="get">
        <input type="submit" value="Зарегистрироваться как администратор">
    </form>
</#if>
<#-- добавить формы для других -->
</body>
</html>