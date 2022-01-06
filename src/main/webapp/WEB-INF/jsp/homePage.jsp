<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>
    <c:when test="${not empty param.get(ApplicationConstants.LOCALE_PARAMETER)}">
        <c:set var="locale" scope="session" value="${param.get(ApplicationConstants.LOCALE_PARAMETER)}"/>
    </c:when>
</c:choose>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="page_content"/>
<!doctype html>
<html lang="${sessionScope.locale}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Education helper</title>
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
    <jsp:include page="/WEB-INF/jsp/fragment/homePageHeader.jsp"/>
</div>
<main>
    <div class="container-fluid container-color pt-3">
        <div class="row mb-3">
            <h2 class="text-center font-weight-bold"><fmt:message key="mainpage.label.service"/></h2>
        </div>
        <div class="row">
            <div class="btn-group" role="group" aria-label="services">
                <div class="col-6 col-sm-12 d-flex justify-content-center">
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/controlWork.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2"><fmt:message key="mainpage.button.control"/></p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/coursework.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2"><fmt:message key="mainpage.button.coursework"/></p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/practiceReport.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2"><fmt:message key="mainpage.button.practice"/></p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/blueprint.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-3"><fmt:message key="mainpage.button.blueprint"/></p>
                    </a>
                </div>
            </div>
            <div class="btn-group my-auto" role="group" aria-label="services">
                <div class="col-6 col-sm-12 pt-4 d-flex justify-content-center">
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 text-center purple-gradient"
                       role="button">
                        <img src="<c:url value="/static/img/icons/graduated.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2"><fmt:message key="mainpage.button.graduate"/></p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 text-nowrap purple-gradient"
                       role="button">
                        <img src="<c:url value="/static/img/icons/programming.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2"><fmt:message key="mainpage.button.programming"/></p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/report.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2"><fmt:message key="mainpage.button.essay"/></p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_SERVICES_PAGE}"
                       class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/list.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2"><fmt:message key="mainpage.button.services"/></p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid container-color">
        <div class="row mb-3">
            <h2 class="text-center font-weight-bold mt-3"><fmt:message key="mainpage.label.advantage"/></h2>
        </div>
        <div class="row  mx-5 px-5 justify-content-center">
            <table class="table">
                <tbody>
                <tr>
                    <td class="text-center"><img src="<c:url value="/static/img/icons/clock.svg"/>" width="40"
                                                 class="pt-4" alt="">
                        <p class="text">Экономите время на поиск необходимого для написания студенческой работы
                            материала.</p>
                    </td>
                    <td class="text-center"><img src="<c:url value="/static/img/icons/notesStack.svg"/>" width="40"
                                                 class="pt-4" alt="">
                        <p class="text">Получаете информацию для студенческой работы в удобном для использования
                            виде.</p>
                    </td>
                    <td class="text-center"><img src="<c:url value="/static/img/icons/listStructure.svg"/>" width="40"
                                                 class="pt-4" alt="">
                        <p class="text">Приобретаете навыки структурирования материала в студенческой работе.</p>
                    </td>
                </tr>
                <tr>
                    <td class="text-center"><img src="<c:url value="/static/img/icons/listStructure.svg"/>" width="40"
                                                 class="pt-4" alt="">
                        <p class="text">Приобретаете навыки структурирования материала в студенческой работе.</p>
                    </td>
                    <td class="text-center"><img src="<c:url value="/static/img/icons/graphProfit.svg"/>" width="40"
                                                 class="pt-4" alt="">
                        <p class="text">Получаете опыт расчетно-аналитической работы по теме исследования.</p>
                    </td>
                    <td class="text-center"><img src="<c:url value="/static/img/icons/protection.svg"/>" width="40"
                                                 class="pt-4" alt="">
                        <p class="text">Заручаетесь поддержкой закрепленного специалиста до факта защиты студенческой
                            работы.</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="container-fluid container-color">
        <div class="row justify-content-center">
            <h2 class="text-center font-weight-bold"><fmt:message key="mainpage.label.order"/></h2>
            <p class="text-center font-weight-normal">
                Процесс заказа дипломной или курсовой консультации довольно прост. Заполняете форму-заявку через наш
                сайт (кнопка "Оценить заказ"), после чего мы подбираем для вас персонального менеджера и рассчитываем
                стоимость работы. После внесения предоплаты работа передается специалисту на исполнение на срок,
                указанный в заявке. По факту выполнения услуг необходимо внести оставшуюся часть оплаты и получить
                материалы выполненной работы.
            </p>
            <div class="col-12 col-md-7 col-lg-6 pb-4 bg-info">
                <h3 class="text-center font-weight-bold my-3">Вопрос-ответ</h3>
                <div class="accordion" id="accordionQuestion">
                    <div class="card peach-gradient color-block">
                        <div class="card-header" id="questionOne">
                            <h2 class="mb-0">
                                <button class="btn btn-link collapsed px-1 py-0 my-0" type="button"
                                        data-toggle="collapse" data-target="#answerOne" aria-expanded="true"
                                        aria-controls="answerOne">
                                    <p class="text-left my-0">1. Если я отправил заказ на оценку, означает ли это то,
                                        что я обязан заказать у вас работу?</p>
                                </button>
                            </h2>
                        </div>
                        <div id="answerOne" class="collapse" aria-labelledby="questionOne"
                             data-parent="#accordionQuestion">
                            <div class="card-body">
                                <p class="text my-0">Оценка заказа нужна, чтобы рассчитать его точную стоимость. Это не
                                    означает, что вы обязаны заказывать работу.</p>
                            </div>
                        </div>
                    </div>
                    <div class="card peach-gradient color-block">
                        <div class="card-header" id="questionTwo">
                            <h2 class="mb-0">
                                <button class="btn btn-link collapsed px-1 py-0 my-0" type="button"
                                        data-toggle="collapse" data-target="#answerTwo" aria-expanded="false"
                                        aria-controls="answerTwo">
                                    <p class="text-left my-0">2. Как можно оформить заказ помимо формы-заявки на вашем
                                        сайте?</p>
                                </button>
                            </h2>
                        </div>
                        <div id="answerTwo" class="collapse" aria-labelledby="questionTwo"
                             data-parent="#accordionQuestion">
                            <div class="card-body">
                                <p class="text mb-0">Выслать свое задание и требования на нашу почту
                                    educationhelper@gmail.com.</p>
                                <p class="text mb-0">Позвонить по нашим контактному телефону: +375257167203.</p>
                                <p class="text mb-0">Посредством Viber: +375257167203.</p>
                                <p class="text mb-0">Посредством Telegram: +375257167203.</p>
                            </div>
                        </div>
                    </div>
                    <div class="card peach-gradient color-block">
                        <div class="card-header" id="questionThree">
                            <h2 class="mb-0">
                                <button class="btn btn-link collapsed px-1 py-0 my-0" type="button"
                                        data-toggle="collapse" data-target="#answerThree" aria-expanded="false"
                                        aria-controls="answerThree">
                                    <p class="text-left my-0">3. Как быстро я узнаю сколько стоит моя работа?</p>
                                </button>
                            </h2>
                        </div>
                        <div id="answerThree" class="collapse" aria-labelledby="questionThree"
                             data-parent="#accordionQuestion">
                            <div class="card-body">
                                <p class="text mb-0">Мы рассчитываем ТОЧНУЮ стоимость вашей работы, поэтому для изучения
                                    всех требований к заказу авторам необходимо некоторое время.</p>
                                <p class="text mb-0">В случае типовых работ оценка происходит в течение 10-15 минут.</p>
                                <p class="text mb-0">По сложным и нестандартным работам авторам требуется больше времени
                                    для анализа материалов, поэтому оценка таких заказов происходит в течение 2-3
                                    дней.</p>
                                <p class="text mb-0">Если с вами длительное время не связывается наш менеджер, значит
                                    ваша работа еще не оценена.</p>
                            </div>
                        </div>
                    </div>
                    <div class="card peach-gradient color-block">
                        <div class="card-header" id="questionFour">
                            <h2 class="mb-0">
                                <button class="btn btn-link collapsed px-1 py-0 my-0" type="button"
                                        data-toggle="collapse" data-target="#answerFour" aria-expanded="false"
                                        aria-controls="answerFour">
                                    <p class="text-left my-0">4. Кто будет выполнять мой заказ?</p>
                                </button>
                            </h2>
                        </div>
                        <div id="answerFour" class="collapse" aria-labelledby="questionFour"
                             data-parent="#accordionQuestion">
                            <div class="card-body">
                                <p class="text mb-0">Мы очень тщательно подбираем исполнителей студенческих работ и
                                    предъявляем к ним высокие требования.</p>
                                <p class="text mb-0">С вашим заказом будет работать проверенный автор, обладающий
                                    значительным опытом работы в нашей компании.</p>
                                <p class="text mb-0">К заказу подбираются специалисты, имеющие профильное высшее
                                    образование по специализации, схожей с темой исследования.</p>
                            </div>
                        </div>
                    </div>
                    <div class="card peach-gradient color-block">
                        <div class="card-header" id="questionFive">
                            <h2 class="mb-0">
                                <button class="btn btn-link collapsed px-1 py-0 my-0" type="button"
                                        data-toggle="collapse" data-target="#answerFive" aria-expanded="false"
                                        aria-controls="answerFive">
                                    <p class="text-left my-0">5. Преподаватель вернул работу на доработку. Могу ли я
                                        рассчитывать на устранение замечаний?</p>
                                </button>
                            </h2>
                        </div>
                        <div id="answerFive" class="collapse" aria-labelledby="questionFive"
                             data-parent="#accordionQuestion">
                            <div class="card-body">
                                <p class="text mb-0">Мы всегда доводим заказ до факта защиты и при необходимости
                                    бесплатно внесем коррективы в вашу работу при условии, если доработка не
                                    противоречит первоначальным требованиям (т.е. не изменились: тема исследования, план
                                    работы, методические рекомендации, стандарты оформления).</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-7 col-lg-6">
                <table class="table-sm mt-4">
                    <tbody>
                    <tr>
                        <td><img src="<c:url value="/static/img/number/number1.svg"/>" width="40" alt="1"></td>
                        <td>
                            <h5 class="mb-1">Заявка</h5>
                            <p class="mb-0">
                                Оставьте
                                <a class="text" href="#" data-toggle="modal" data-target="#modalOrder">заяку на
                                    сайте</a>
                                или
                                <a class="text" href="#" data-toggle="modal" data-target="#modalContacts">позвоните
                                    нам</a>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/static/img/number/number2.svg"/>" width="40" alt="2"></td>
                        <td>
                            <h5 class="mb-1">Расчёт стоимости</h5>
                            <p class="mb-0">На основании заявки мы производим расчет стоимости работы</p>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/static/img/number/number3.svg"/>" width="40" alt="3"></td>
                        <td>
                            <h5 class="mb-1">Предоплата</h5>
                            <p class="mb-0">Предоплата составляет 50% от стоимости работ</p>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/static/img/number/number4.svg"/>" width="40" alt="4"></td>
                        <td>
                            <h5 class="mb-1">Выполнение</h5>
                            <p class="mb-0">Наш специалист максимально качественно и в определенные сроки выполнит Ваше
                                задание</p>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value="/static/img/number/number5.svg"/>" width="40" alt="5"></td>
                        <td>
                            <h5 class="mb-1">Работа готова</h5>
                            <p class="mb-0">Ваше задание выполнено</p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="mask flex-center container-color">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <h3 class="text-center font-weight-bold my-3">Причины, почему следует заказать услуги у нас?</h3>
                <div class="mbr-text mbr-fonts-style display-7">
                    <ol class="list-counter-square">
                        <li>
                            <p class="font-weight-bold">Высокая квалификация.</p>
                        </li>
                        <p class="font-weight-normal"> Мы – высококвалифицированные специалисты в сфере образовательной
                            деятельности, имеющие высшее образование ведущих ВУЗов Беларуси. Все виды оказываемых нами
                            услуг выполняются на самом высоком уровне.</p>
                        <li>
                            <p class="font-weight-bold">Многолетний опыт</p>
                        </li>
                        <p class="font-weight-normal">Многолетний опыт работы позволил выработать слаженный процесс
                            обучения, определить критерии студенческих работ высокого уровня качества. Поэтому заказать
                            консультацию по дипломной, курсовой или контрольной работе в нашем центре – гарантия
                            качества Вашего образования.</p>
                        <li>
                            <p class="font-weight-bold">Доступ к актуальной информации.</p>
                        </li>
                        <p class="font-weight-normal">Наличие постоянно расширяющейся собственной библиотеки, а также
                            открытый доступ к информационной базе библиотек республиканского и регионального уровня
                            позволяют нам оперативно отобрать нужный актуальный рабочий материал для подготовки
                            студенческих работ.</p>
                        <li>
                            <p class="font-weight-bold">Предоставление гарантий</p>
                        </li>
                        <p class="font-weight-normal">Предоставление гарантий высокого качества оказываемых услуг;
                            индивидуального подхода к каждому клиенту; использования новейших источников;
                            конфиденциальности; полного сопровождения работы до защиты; точного соблюдения оговоренных
                            сроков; бесплатного устранения замечаний.</p>
                        <li>
                            <p class="font-weight-bold">Разумные цены</p>
                        </li>
                        <p class="font-weight-normal">Стоимость наших услуг определяется трудоемкостью заданий и сроками
                            их выполнения. Мы стремимся обеспечить наилучшее соотношение цены и качества выполняемых
                            услуг.</p>
                    </ol>
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
</html>
<jsp:include page="/WEB-INF/jsp/fragment/scriptSourceLink.jsp"/>
<jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>
