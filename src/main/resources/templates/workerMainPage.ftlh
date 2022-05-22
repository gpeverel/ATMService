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
    <link rel="stylesheet" type="text/css" href="/css/workerMainPageStyles.css"/>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="h-100 header_content d-flex justify-content-between">
                <a class="h-100 d-flex align-items-center" href="">
                    <img class="logo" src="/images/logo.png">
                </a>

                <div class="logout_box d-flex justify-content-between align-items-center">
                    <div class="fs-5 fw-bold">
                        Главная страница
                        сотрудника обслуживающего персонала
                    </div>

                    <div class="exit_btn">
                        <form class="float-end" action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input class="btn btn-primary" type="submit" value="Выйти">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <section class="first_section">
        <div class="container">
            <div class="worker_info pt-5 pb-5 text-white fw-bolder">
                <div>Ваше ФИО: ${worker.fullName}</div>
                <div>Ваша квалификация: ${worker.qualification}</div>
            </div>
        </div>
    </section>

    <section class="available_appls">
        <div class="container">
            <div class="pt-4 pb-3 text-black sections_title">
                Список свободных заявок подходящих под вашу квалификацию
            </div>
            <form action="/worker" method="get">

                <input type="hidden" name="search" value=true>
                <input class="btn btn-primary" type="submit" value="Искать актуальные заявки">
            </form><br>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th class="type">Тип</th>
                            <th class="description">Описание</th>
                            <th class="appear_date">Дата появления</th>
                            <th class="more_info">Подробная информация</th>
                        </tr>
                    </table>
                </div>

                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#if freeApps??>
                            <#if freeApps?has_content>
                                <#list freeApps as app>
                                    <tr>
                                        <td class="type">${app.type}</td>
                                        <td class="description">${app.description}</td>
                                        <td class="appear_date">${app.dateAppearance}</td>
                                        <td class="more_info"><a href="/application/${app.id}">Подробнее</a></td>
                                    </tr>

                                </#list>
                            </#if>
                        <#else>
                            <h3 class="text-center">Свободных заявок нет</h3>
                        </#if>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <section class="executing_appls">
        <div class="container">
            <div class="pt-4 pb-3 text-black sections_title">
                Список заявок, которые вы сейчас выполняете
            </div>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th class="type">Тип</th>
                            <th class="description">Описание</th>
                            <th class="appear_date">Дата появления</th>
                            <th class="take_date">Дата взятия</th>
                            <th class="more_info">Подробная информация</th>
                        </tr>
                    </table>
                </div>

                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#if busyApps??>
                            <#if busyApps?has_content>

                                <#list busyApps as app>
                                    <tr>
                                        <td class="type">${app.type}</td>
                                        <td class="description">${app.description}</td>
                                        <td class="appear_date">${app.dateAppearance}</td>
                                        <td class="take_date">${app.dateBegin}</td>
                                        <td class="more_info"><a href="/application/${app.id}">Подробнее</a></td>
                                    </tr>
<#--                                <#else>-->
<#--                                    <h3 class="text-center">Заявок нет</h3>-->
                                </#list>
                            <#else>
                                <h3 class="text-center">Заявок нет</h3>
                            </#if>
                        </#if>
                    </table>
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