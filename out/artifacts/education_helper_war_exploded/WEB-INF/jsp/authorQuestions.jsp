<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="page_content"/>

<!doctype html>
<html lang="${sessionScope.locale}">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Author question</title>
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
    <main class="container-color pb-3">
        <div class="container my-5 py-5">
            <div class="accordion" id="accordionQuestion">
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question1">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer1" aria-expanded="true" aria-controls="answer1">
                                <p class="text-left my-0">1. Как я могу стать автором в вашей компании?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer1" class="collapse" aria-labelledby="question1" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text my-0">Необходимо заполнить форму (Авторам -> Стать автором).</p>

                            <p class="text my-0">После рассмотрения заявки с Вами свяжутся для собеседования, по
                                результатам которого будет принято решение о сотрудничестве.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question2">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer2" aria-expanded="false" aria-controls="answer2">
                                <p class="text-left my-0">2. Где я могу ознакомиться с Правилами работы авторов?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer2" class="collapse" aria-labelledby="questionTwo" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">С текстом Правил можно ознакомиться в личном кабинете автора.</p>

                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question3">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer3" aria-expanded="false" aria-controls="answer3">
                                <p class="text-left my-0">3. Как мне войти в личный кабинет?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer3" class="collapse" aria-labelledby="question3" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">1. В главном меню нашего сайта выбрать "Авторам" --> "Войти в личный
                                кабинет".</p>
                            <p class="text mb-0">2. В соответствующие поля ввести логин и пароль, которые были высланы
                                на вашу почту при регистрации.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question4">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer4" aria-expanded="false" aria-controls="answer4">
                                <p class="text-left my-0">4. В какой валюте мне необходимо оценивать заказы?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer4" class="collapse" aria-labelledby="question4" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">Заказы оцениваются в белорусских рублях.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question5">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer5" aria-expanded="false" aria-controls="answer5">
                                <p class="text-left my-0">5. Почему заказы, оцененные мною, со временем исчезают из
                                    личного кабинета?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer5" class="collapse" aria-labelledby="question5" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">Причины, по которым оцененный вами заказ пропадает из личного кабинета,
                                могут быть следующими:</p>
                            <p class="text mb-0">1. Заказчик не согласился со стоимостью заказа и отказался от наших
                                услуг.</p>
                            <p class="text mb-0">2. Исполнителем заказа был выбран другой автор.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question6">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer6" aria-expanded="false" aria-controls="answer6">
                                <p class="text-left my-0">6. По какому принципу выбирают автора в качестве исполнителя
                                    по заказу?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer6" class="collapse" aria-labelledby="question6" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">При выборе автора в качестве исполнителя по заказу учитываются
                                следующие факторы: </p>
                            <p class="text mb-0">1. Цена заказа - при прочих равных условиях будет отдано предпочтение
                                тому автору, у которого цена оценки ниже.</p>
                            <p class="text mb-0"> Рейтинг автора - авторы, которые за время сотрудничества с нами
                                заработали рейтинг, имеют больший приоритет. На рейтинг влияют: длительность
                                сотрудничества, высокое качество выполненных работ, соблюдение сроков, количество
                                выполненных заказов.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question7">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer7" aria-expanded="false" aria-controls="answer7">
                                <p class="text-left my-0">7. Как я узнаю, что мне передали заказ в исполнение?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer7" class="collapse" aria-labelledby="question7" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">О передаче заказа в исполнение вас известит менеджер одним из следующих
                                способов: по телефону, с помощью социальных сетей, e-mail.</p>
                            <p class="text mb-0">Также в вашем личном кабинете заказ приобретёт статус "В исполнении" и
                                будет находиться в соответствующем разделе.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question8">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer8" aria-expanded="false" aria-controls="answer8">
                                <p class="text-left my-0">8. Что делать, если мне необходимо больше времени на
                                    выполнение заказа?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer8" class="collapse" aria-labelledby="question8" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">Необходимо связаться с менеджером нашей компании для согласования
                                возможности переноса сроков по заказу.</p>
                            <p class="text mb-0">Перенос сроков по заказу в день его сдачи невозможен.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question9">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer9" aria-expanded="false" aria-controls="answer9">
                                <p class="text-left my-0">9. Каким образом я могу передать выполненную работу
                                    менеджеру?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer9" class="collapse" aria-labelledby="question9" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">Выполненные автором работы необходимо отправлять электронной почтой на
                                адрес education-helper@gmail.com</p>
                            <p class="text mb-0">В теме письма необходимо обязательно указать номер заказа.</p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question10">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer10" aria-expanded="false" aria-controls="answer10">
                                <p class="text-left my-0">10. Все ли доработки я должен делать бесплатно?</p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer10" class="collapse" aria-labelledby="question10" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0">Нет. Бесплатно устраняются замечания по работе, если они не
                                противоречат первоначальным требованиям, которые были указаны в заказе при передаче его
                                автору в исполнение.</p>
                            <p class="text mb-0">В случае изменения темы исследования, плана работы, методических
                                рекомендаций, стандартов оформления, автор вправе требовать дополнительного
                                вознаграждения.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="/WEB-INF/jsp/fragment/footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

</body>
<jsp:include page="/WEB-INF/jsp/fragment/scriptSourceLink.jsp"/>
<jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>

