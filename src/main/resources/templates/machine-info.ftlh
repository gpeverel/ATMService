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
    <link rel="stylesheet" type="text/css" href="/css/machineInfoStyles.css"/>
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
                        Подробная информация о банкомате
                    </div>

                    <div class="exit_btn">
                        <form class="float-end" action="/" method="get">
                            <input class="btn btn-primary" type="submit" value="Назад на главную">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <section class="first_section">
        <div class="container">
            <div class="pt-5 pb-5 text-white fs-5 fw-bolder">
                <div>Номер банкомата: ${machine.number}</div>
                <div>Модель банкомата: ${machine.model}</div>
                <div>Местоположение: ${machine.location}</div>
                <div>Организация: ${machine.client.title}</div>
            </div>
        </div>
    </section>

    <section class="delete_atm">
        <div class="container">
            <#if machine.client.id == user.id>
                <#if machine.visible == true>
                    <div class="pt-4 pb-3 text-black sections_title">
                        Удалить банкомат
                    </div>

                    <form action="/machine/delete/${machine.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="btn btn-primary" type="submit" value="Удалить">
                    </form>

                    <div class="pt-4 pb-3 text-black sections_title">
                        Оставить заявку на обслуживание
                    </div>

                    <form class="pb-5" action="/application/create" method="post">
                        <label class="form-label">Описание заявки</label>
                        <textarea class="desc_field form-control" type="text" name="description"></textarea><br>

                        <input type="hidden" name="machineId" value="${machine.id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="btn btn-primary" type="submit" value="Оставить заявку">
                    </form>
                <#else>
                    <h3 class="pt-5 pb-5">Банкомат больше не находится под обслуживанием</h3>
                </#if>
            </#if>
        </div>
    </section>

    <section class="atms_appls">
        <div class="container">
            <div class="pt-4 pb-3 text-black sections_title">
                Заявки по данному банкомату
            </div>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th class="type">Тип</th>
                            <th class="description">Описание</th>
                            <th class="status">Статус</th>
                            <th class="worker">Сотрудник</th>
                            <th class="qualification">Квалификация</th>
                            <th class="more_info">Подробная информация</th>
                        </tr>
                    </table>
                </div>

                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#if apps?has_content>
                            <#list apps as app>
                                <tr>
                                    <td class="type">${app.type}</td>
                                    <td class="description">${app.description}</td>
                                    <td class="status">${app.status}</td>
                                    <td class="worker"><#if app.worker??>${app.worker.fullName}<#else>Отсутствует</#if></td>
                                    <td class="qualification"><#if app.qualification??>${app.qualification}<#else>Отсутствует</#if></td>
                                    <td class="more_info"><a href="/application/${app.id}">Подробнее</a></td>
                                </tr>
                            </#list>
                        <#else>
                            <h3 class="text-center">Заявок нет</h3>
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



