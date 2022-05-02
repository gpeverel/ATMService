<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
    <h2>ATM SERVICE</h2>
    <h4>Авторизация</h4>
    <form action="/login" method="post">
        Логин: <input type="text" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Войти">
    </form>
    <a href="/registration">Зарегистрироваться</a>
    <div>
        Если вы зарегистрировались, ожидайте подтверждения вашего аккаунта от администратора.<br>
        С ним можно связаться по телефону +7(999)-123-45-67
    </div>
</body>
</html>



