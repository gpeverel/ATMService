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
    <link rel="stylesheet" type="text/css" href="/css/clientMainPageStyles.css"/>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="h-100 header_content d-flex justify-content-between">
                <a class="h-100 d-flex align-items-center" href="">
                    <img class="logo" src="/images/logo.png">
                </a>
                <div class="logout_box d-flex justify-content-between align-items-center">
                    <#if client.title??>
                        <div class="fs-5 fw-bold">Компания ${client.title}</div>
                    </#if>

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
                Добавить банкомат
            </div>

            <div class="atms_adding text-white">
                <form action="/machine/create" method="post">
                    <label class="form-label">Номер</label>
                    <input class="form-control" type="text" name="number"/><br>

                    <label class="form-label">Модель</label>
                    <input class="form-control" type="text" name="model"/><br>

                    <label class="form-label">Местоположение</label>
                    <input class="form-control" type="text" name="location"/><br>

                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input class="btn btn-light" type="submit" value="Добавить">
                </form>
            </div>
        </div>
    </section>


    <!--<form action="/client" method="get">
        Поиск по номеру банкомата: <input type="text" name="number"><br>
        <input type="submit" value="Поиск">
    </form>-->

    <section class="atms">
        <div class="container">
            <div class="pt-4 pb-3 text-white sections_title">
                Ваши банкоматы
            </div>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th>Номер</th>
                            <th>Модель</th>
                            <th>Подробная информация</th>
                        </tr>
                    </table>
                </div>

                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#list machines as machine>
                            <tr class="align-middle">
                                <td>${machine.number}</td>
                                <td>${machine.model}</td>
                                <td><a href="/machine/${machine.id}">Подробнее</a></td>
                            </tr>
                            <!--<div class="btm btm-primary">
                                <p><b>${machine.number}</b> ${machine.model} | <a href="/machine/${machine.id}">Подробнее</a></p>
                            </div>-->
                        <#else>
                            <h3 class="text-center">Банкоматов нет</h3>
                        </#list>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <section class="deleted_atms">
        <div class="container">
            <div class="pt-4 pb-3 text-white sections_title">
                Удаленные банкоматы
            </div>

            <div class="table_box bg-white">
                <div class="head_padding">
                    <table class="fixed_header table">
                        <tr class="align-middle">
                            <th>Номер</th>
                            <th>Модель</th>
                            <th>Подробная информация</th>
                        </tr>
                    </table>
                </div>

                <div class="body_box">
                    <table class="table_body bg-white table">
                        <#list deletedMachines as machine>
                            <tr class="align-middle">
                                <td>${machine.number}</td>
                                <td>${machine.model}</td>
                                <td><a href="/machine/${machine.id}">Подробнее</a></td>
                            </tr>
                            <!--<div class="btm btm-primary">
                                    <p><b>${machine.number}</b> ${machine.model} | <a href="/machine/${machine.id}">Подробнее</a></p>
                                </div>-->
                        <#else>
                            <h3 class="text-center">Удаленных банкоматов нет</h3>
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