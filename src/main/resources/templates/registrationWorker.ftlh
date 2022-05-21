<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ATM SERVICE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/generalStyles.css"/>
    <link rel="stylesheet" type="text/css" href="/css/registrationWorkerStyles.css"/>
</head>
<body>
<header class="header">
    <div class="container">
        <div class="h-100 header_content d-flex">
            <a class="h-100 d-flex justify-content-between align-items-center" href="">
                <img class="logo" src="/images/logo.png">
            </a>
        </div>
    </div>
</header>

<section class="first_section">
    <div class="container">
        <div class="text-white">
            <div class="fs-2 text-center pt-2">Регистрация</div>

            <form action="/registration/worker" method="post">
                <label class="form-label">Логин</label>
                <input class="form-control" type="text" name="login"><br>

                <label class="form-label">Пароль</label>
                <input class="form-control" type="password" name="password"><br>

                <label class="form-label">Ваш ФИО</label>
                <input class="form-control" type="text" name="fullName"><br>

                <#--TODO Добавить сюда выбор квалификаций из всплывающего меню   -->

                <label class="form-label">Квалификация</label>
                <select class="form-select" name="qualification">
                    <#list qualifications as qualification>
                        <option value="${qualification}">${qualification}</option>
                    </#list>
                </select><br>

                <label class="form-label">Паспортные данные</label>
                <input class="form-control" type="text" name="passport"><br>

                <label class="form-label">ИНН</label>
                <input class="form-control" type="text" name="inn"><br>

                <label class="form-label">СНИЛС</label>
                <input class="form-control" type="text" name="snils"><br>

                <label class="form-label">Телефон</label>
                <input class="form-control" type="text" name="phone"><br>

                <label class="form-label">Эл. почта</label>
                <input class="form-control" type="text" name="email"><br>

                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input class="btn btn-light" type="submit" value="Зарегистрироваться">
            </form>
            <#if errorMessage??>
                <h2>${errorMessage}</h2>
            </#if>
        </div>
    </div>
</section >

<footer class="footer">
    <div class="container">
        <div class="footer_content d-flex justify-content-between align-items-center">
            <div class="w-100 d-flex justify-content-between">
                <a class="d-flex justify-content-between align-items-center" href="">
                    <img class="logo" src="/images/logo.png">
                </a>
                <div class="write_us">
                    <div class="write_us_title">
                        Напишите нам
                    </div>
                    <div class="email d-flex">
                        <div class="email_email">
                            atmservice@atm.ru
                        </div>
                        <div class="email_text">
                            Общие вопросы
                        </div>
                    </div>
                </div>
                <div class="contacts">
                    <div class="contacts_title">
                        Наши контакты
                    </div>
                    <div class="contacts_content d-flex">
                        <div class="contacts_content_contacts">
                            +5555-123-45-56
                        </div>
                        <div class="contacts_content_text">
                            Телефон
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>



