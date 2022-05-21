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
    <link rel="stylesheet" type="text/css" href="/css/adminStyles.css"/>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="h-100 header_content d-flex justify-content-between">
                <a class="h-100 d-flex align-items-center" href="">
                    <img class="logo" src="/images/logo.png">
                </a>
                <div class="logout_box d-flex justify-content-between align-items-center">
                    <div class="fs-5 fw-bold">Панель администратора</div>

                    <form class="pl-3" action="/logout" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="btn btn-primary" type="submit" value="Выйти">
                    </form>
                </div>
            </div>
        </div>
    </header>

    <section class="first_section">
        <div class="container">
            <div class="pt-4 pb-3 text-white sections_title">
                Таблица организаций-клиентов
            </div>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th>Логин</th>
                            <th>Организация</th>
                            <th>Активность</th>
                            <th>Активация</th>
                            <th>Подробная информация</th>
                        </tr>
                    </table>
                </div>

                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#list clients as client>
                            <tr class="align-middle">
                                <td>${client.user.login}</td>
                                <td>${client.title}</td>
                                <td>
                                    <#if client.user.active>
                                        true
                                    <#else>
                                        false
                                    </#if>
                                </td>
                                <td>
                                    <form action="/admin/user/activate/${client.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <#if client.user.active>
                                            <input class="btn btn-primary" type="submit" value="Забанить">
                                        <#else>
                                            <input class="btn btn-primary" type="submit" value="Активировать">
                                        </#if>
                                    </form>
                                </td>
                                <td>Добавить ссылку</td>
                            </tr>
                        <#else>
                            <h3 class="text-center">Клиентов нет</h3>
                        </#list>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <section class="workers_section">
        <div class="container">
            <div class="pt-4 pb-3 text-white sections_title">
                Таблица сотрудников
            </div>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th >Логин</th>
                            <th>ФИО</th>
                            <th>Квалификация</th>
                            <th>Активность</th>
                            <th>Активация</th>
                            <th>Подробная информация</th>
                        </tr>
                    </table>
                </div>

                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#list workers as worker>
                            <tr class="align-middle">
                                <td>${worker.user.login}</td>
                                <td>${worker.fullName}</td>
                                <td>${worker.qualification}</td>
                                <td>
                                    <#if worker.user.active>
                                        true
                                    <#else>
                                        false
                                    </#if>
                                </td>
                                <td>
                                    <form action="/admin/user/activate/${worker.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <#if worker.user.active>
                                            <input type="submit" value="Забанить">
                                        <#else>
                                            <input type="submit" value="Активировать">
                                        </#if>
                                    </form>
                                </td>
                                <td>Добавить ссылку</td>
                            </tr>
                        <#else>
                            <h3 class="text-center">Сотрудников нет</h3>
                        </#list>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <section class="application_section">
        <div class="container">
            <div class="pt-4 pb-3 text-white sections_title">
                Таблица новых заявок
            </div>
            <div class="pb-2 text-white">
                Требуется выбрать квалификацию для каждой
            </div>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th class="description">Описание</th>
                            <th class="date">Дата появления</th>
                            <th class="submit_form">Квалификация</th>
                        </tr>
                    </table>
                </div>
                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#list newApps as app>
                            <tr class="align-middle">
                                <td class="description">${app.description}</td>
                                <td class="date">${app.dateAppearance}</td>
                                <td class="submit_form">
                                    <form class="d-flex justify-content-between" action="/application/update/qualification" method="post">
                                        <select class="form-select" name="qualification">
                                            <#list qualifications as qualification>
                                                <option value="${qualification}">${qualification}</option>
                                            </#list>
                                        </select>
                                        <input type="hidden" name="appId" value="${app.id}">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input class="btn btn-primary" type="submit" value="Подтвердить обработку">
                                    </form>
                                </td>
                            </tr>
                        <#else>
                            <h3 class="text-center">Новых заявок нет</h3>
                        </#list>
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



