<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
</div>

    <main class="container-color pb-3">
        <div class="container mt-5 pt-3 ">
            <h2>1. Мы гарантируем:</h2>
            <ul>
                <li>высокое качество предоставляемых услуг;</li>
                <li>индивидуальный подход;</li>
                <li>конфиденциальность;</li>
                <li>полное сопровождение студенческой работы до защиты для достижения желаемого результата;</li>
                <li>полное соответствие оказываемых услуг требованиям клиента;</li>
                <li>точное соблюдение оговоренных сроков выполнения заказа.</li>
            </ul>
            <hr>
        </div>
        <div class="container">
            <h2>2. Мы обеспечим:</h2>
            <p>Бесплатный поиск и обработку дополнительного материала для доработки студенческой работы в случаях, если
                она была обусловлена нашей виной. В противном случае, если к студенческой работе со стороны
                преподавателя предъявляются новые требования, не оговоренные изначально при заказе, и при условии
                высокой трудоемкости их выполнения, они будут выполнены на платной основе.</p>
            <hr>
        </div>
        <div class="container">
            <h2>3. Доработаем в срок:</h2>
            <p>Сроки бесплатного устранения замечаний по работе зависят от их объема и сложности, но не могут составлять
                менее 3-х и более 9-ти рабочих дней</p>
            <hr>
        </div>
        <div class="container">
            <h2>4. Бесплатно исправим:</h2>
            <p>Бесплатный поиск и обработка дополнительного материала для доработки студенческой работы осуществляются в
                случаях, если на работе присутствуют отметки проверяющего (рецензента), его корректирующие пометки либо
                рецензия.</p>
            <hr>
        </div>
        <div class="container">
            <h2>Гарантируем 100% допуск:</h2>
            <p>Мы даем стопроцентную гарантию допуска к защите вашей работы, однако не гарантируем получение вами
                наивысшей оценки знаний по результатам защиты в силу влияния на итоговую оценку субъективных
                факторов.</p>
            <hr>
        </div>
        <div class="container">
            <h2>Проверяем на Антиплагиат:</h2>
            <p>При необходимости оригинальность работ оценивается по системе Антиплагиат (antiplagiat.ru) с подключенным
                модулем "Интернет" (бесплатная версия без подключения расширенных модулей). Процент оригинальности (если
                таковой требуется преподавателем) указывается заказчиком при оформлении заказа.</p>
            <hr>
        </div>
        <div class="container">
            <h2>Гарантийный срок:</h2>
            <p class="text mb-0">Срок гарантии на оказанные услуги составляет 30 дней с момента окончательного расчета
                за услуги. По истечении указанного срока удовлетворение претензий осуществляются на платной основе по
                согласованию сторон.</p>
            <hr>
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

