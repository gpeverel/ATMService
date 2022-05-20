<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ATM SERVICE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/loginStyles.css"/>
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
        <div class="first_section_content">
            <div class="first_section_title d-flex align-items-center">
                <div class="first_section_title_inner">
                    АТМсервис — ведущая компания на рынке технологий
                    банковского самообслуживания
                </div>
            </div>
            <div class="sign_in text-white d-flex align-items-center">
                <div>
                    <div class="fs-2">
                        ATM SERVICE
                    </div>
                    <div class="fs-4">
                        Авторизация
                    </div>
                    <form action="/login" method="post">
                        <label class="form-label">Логин</label>
                        <input class="form-control" type="text" name="username"><br>
                        <label class="form-label">Пароль</label>
                        <input class="form-control" type="password" name="password"><br>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="btn btn-light" type="submit" value="Войти">
                    </form>
                    <#if error == true>
                    Ваш аккаунт заблокирован или еще не подтвержден администратором<br>
                    </#if>
                    <a class="text-white" href="/registration">Зарегистрироваться</a>
                    <div>
                        Если вы зарегистрировались, ожидайте подтверждения вашего аккаунта от администратора.<br>
                        С ним можно связаться по телефону +7(999)-123-45-67
                    </div>
                </div>
            </div>
        </div>
    </div>

</section >

<section class="services">
    <div class="container">
        <div class="services_title fs-1 pt-5 pb-5">Профессиональный сервис 24/7</div>
        <div class="cards d-flex justify-content-between">
            <div class="card shadow-sm" style="width: 25rem;">
                <img src="/images/card1.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">Мониторинг устройств самообслуживания</h5>
                    <p class="card-text fs-5 pt-3 pb-3">Полный контроль над системой банкоматов и терминалов.
                        Вы знаете все о техническом состоянии, количестве денег и операциях всей
                        сети и каждого аппарата в отдельности.</p>
                    <a href="#" class="btn btn-primary pb-1">Перейти</a>
                </div>
            </div>
            <div class="card shadow-sm" style="width: 25rem;">
                <img src="/images/card2.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">Техническое обслуживание</h5>
                    <p class="card-text fs-5 pt-3 pb-3">Полное обслуживание 1‑го и 2‑го уровней: от заботы
                        о внешнем виде банкомата до полного восстановления после
                        актов вандализма или грабежа.</p>
                    <a href="#" class="btn btn-primary">Перейти</a>
                </div>
            </div>
            <div class="card shadow-sm" style="width: 25rem;">
                <img src="/images/card3.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title fs-3">Обслуживаемое оборудование</h5>
                    <p class="card-text fs-5 pt-3 pb-3">Мы официальный сервисный партнер компаний NCR
                        и других производителей оборудования. Наши специалисты,
                        отвечающие за ремонт банковских терминалов, прошли курсы
                        обучения в центре NCR и имеют соответствующие сертификаты.</p>
                    <a href="#" class="btn btn-primary">Перейти</a>
                </div>
            </div>
        </div>
    </div>
</section>

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
                            bankomat@lanit.ru
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



