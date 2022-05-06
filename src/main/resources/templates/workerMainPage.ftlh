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
    <h4>Список заявок подходящих под вашу квалификацию:</h4>
    показать таблицу
</div>
<hr>
</body>
</html>