<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

<head>
    <title>Client instruction</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
    <main class="container-color pb-3 textBlock">
        <div class="container pt-5 mt-5">
            <h3>Содержание</h3>
            <ul>
                <li><a href="#algorithm">Алгоритм обработки заказа</a></li>
                <li><a href="#request">Оформление заявки на оценку заказа</a></li>
                <li><a href="#cabinet">Работа с личным кабинетом</a></li>
                <li><a href="#reworking">Возврат работы на доработку</a></li>
            </ul>
        </div>
        <div class="container">
            <a id="algorithm"></a>
            <h3>Алгоритм обработки заказа</h3>
            <div class="container containerWithBorder">
                <p class="font-weight-bold mb-0">1. Оформление <span class="border-left  border-warning"></span></p>
                <p>Вам необходимо оформить заявку на оценку заказа. При этом для вас будет создан личный кабинет с
                    персональными данными для входа в него. <span class="border-left  border-warning"></span></p>
                <p class="font-weight-bold mb-0">2. Оценка</p>
                <p>После оценки заказа мы проинформируем вас о его стоимости.</p>
                <p class="font-weight-bold mb-0">3. Предоплата </p>
                <p>В случае согласия с нашей ценой, вам необходимо будет внести предоплату за заказ, как правило, в
                    размере 50%</p>
                <p class="font-weight-bold mb-0">4. Выполнение </p>
                <p>После внесения предоплаты мы передадим ваш заказ специалисту на исполнение.</p>
                <p class="font-weight-bold mb-0">5. Уведомление</p>
                <p>По завершению работ мы уведомим вас о готовности заказа.</p>
                <p class="font-weight-bold mb-0">6. Окончательный расчёт</p>
                <p>Вам необходимо будет оплатить оставшуюся сумму за заказ.</p>
                <p class="font-weight-bold mb-0">7. Передача результатов работы</p>
                <p>После окончательного расчета мы передадим вам подготовленные материалы любым удобным способом (при
                    личной встрече в офисе, через е-mail или социальные сети).</p>
            </div>
        </div>
        <div class="container">
            <a id="request"></a>
            <h3>Оформление заявки на оценку заказа</h3>
            <div class="container containerWithBorder">
                <p>Оформить заявку на оценку заказа вы можете двумя способами:</p>
                <p><span style="font-weight:bold">1. Через форму заказа,</span> нажав на кнопку "Оценить заказ", для вас
                    откроется специальная форма, поля которой необходимо заполнить.
                    Этот способ для заказа работы в большей степени подходит для тех клиентов, которые хорошо знают, что
                    им нужно. При этом в предложенной форме рекомендуем указывать подробную информацию об условиях
                    задания с тем, чтобы выполненная нами работа наиболее точно соответствовала вашим ожиданиям. Стоит
                    отметить, что оформленная заявка на оценку заказа является абсолютно бесплатной и не обязывает вас
                    заказывать услугу.</p>
                <p><span style="font-weight:bold">2. Через контактные данные,</span> используя удобные для вас способы
                    (e-mail, телефоны, социальные сети).
                    Данный способ будет самым правильным для тех, кто еще не определился с тематикой, не до конца
                    понимает суть и содержание выданного научным руководителем задания на научную работу, затрудняется
                    сформулировать требования по ее оформлению. В этом случае с вами побеседует наш менеджер, который
                    обсудит с вами все детали заказа.</p>
            </div>
        </div>
        <div class="container">
            <a id="cabinet"></a>
            <h3>Работа с личным кабинетом</h3>
            <div class="container containerWithBorder">
                <p> Для входа в личный кабинет клиента вам необходимо в главном меню нашего сайта выбрать "Клиентам" -->
                    "Войти в личный кабинет" и в соответствующие поля ввести логин и пароль, которые были высланы на
                    вашу почту или мобильный телефон при оформлении оценки заказа.</p>
                <p class="text mb-0"> В личном кабинете вы можете:</p>
                <p class="text mb-0"> - редактировать заказ (только при статусе заказа "в обработке");</p>
                <p class="text mb-0"> - оплачивать заказ с помощью банковской платежной карты;</p>
                <p class="text"> - следить за ходом выполнения заказа.</p>
            </div>
        </div>
        <div class="container">
            <a id="reworking"></a>
            <h3>Возврат работы на доработку</h3>
            <div class="container containerWithBorder">
                <p> Если возникла необходимость доработать ранее выполненный нами заказ, вам следует написать письмо на
                    наш электронный адрес <span style="font-weight:bold">education-helper@gmail.com</span> с подробным
                    указанием замечаний, которые необходимо устранить. Как правило, научный руководитель (преподаватель)
                    при проверке студенческой работы составляет рецензию, в которой подробно описывает эти замечания.

                    Мы всегда доводим заказ до факта защиты и при необходимости бесплатно внесём коррективы в вашу
                    работу при условии, если доработка не противоречит первоначальным требованиям (т.е. не изменились:
                    тема исследования, план работы, методические рекомендации, стандарты оформления).</p>
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


