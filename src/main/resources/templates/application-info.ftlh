<!DOCTYPE html>
<html lang="">
<head>
    <title>ATM SERVICE</title>
</head>
<body>
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
    <link rel="stylesheet" type="text/css" href="/css/applicationInfoStyles.css"/>
</head>
<body>
<header class="header">
    <div class="container">
        <div class="h-100 header_content d-flex justify-content-between">
            <a class="h-100 d-flex align-items-center" href="">
                <img class="logo" src="/images/logo.png">
            </a>
            <div class="logout_box d-flex align-items-center">

                <form class="pl-3 float-end" action="/" method="get">
                    <input class="btn btn-primary" type="submit" value="Назад на главную">
                </form>
            </div>
        </div>
    </div>
</header>

    <section class="first_section">
        <div class="container">
            <div class="pt-4 pb-3 text-white sections_title">
                Подробная информация о заявке
            </div>
            <div class="appl_info text-white fs-5 fw-bolder">
                <div>Тип: ${app.type}</div>
                <div>Описание: ${app.description}</div>
                <div>Статус: ${app.status}</div>
                <div>Сотрудник: <#if app.worker??>${app.worker.fullName}<#else>Отсутствует</#if></div>
                <div>Квалификация: <#if app.qualification??>${app.qualification}<#else>Отсутствует</#if></div>
                <div>Дата появления: ${app.dateAppearance}</div>
                <div>Дата взятия заявки сотрудником: <#if app.dateBegin??>${app.dateBegin}<#else>Отсутствует</#if></div>
                <div>Дата окончания работы: <#if app.dateEnd??>${app.dateEnd}<#else>Отсутствует</#if></div>
                <div><a class="text-white" href="/machine/${app.machine.id}">Подробнее о банкомате</a></div>
            </div>

            <div class="pt-4">
                <#if worker.id??>
                    <#if app.worker??>
                        <#if app.worker.id == worker.id>
                            <form action="/application/done" method="post">
                                <input type="hidden" name="appId" value="${app.id}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input class="btn btn-light" type="submit" value="Завершить заявку">
                            </form>
                        <#else>
                            <div class="text-white fs-3">
                                Заявка в работе у другого специалиста
                            </div>
                        </#if>
                    <#else>
                        <#if app.qualification == worker.qualification>
                            <form action="/application/busy" method="post">
                                <input type="hidden" name="appId" value="${app.id}">
                                <input type="hidden" name="workerId" value="${worker.id}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input class="btn btn-light" type="submit" value="Взять заявку">
                            </form>
                        <#else>
                            <div class="text-white fs-3">
                                Заявка не совпадает с вашей квалификацие
                            </div>
                        </#if>
                    </#if>
                </#if>
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