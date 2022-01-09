<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</div>

    <main class="container-color pb-3">
        <div class="container mt-5 pt-3 ">
            <h2><fmt:message key="guaranteesPage.head.weGuarantees"/></h2>
            <ul>
                <li><fmt:message key="guaranteesPage.text.guaranteesQuality"/></li>
                <li><fmt:message key="guaranteesPage.text.guaranteesApproach"/></li>
                <li><fmt:message key="guaranteesPage.text.guaranteesConfidentiality"/></li>
                <li><fmt:message key="guaranteesPage.text.guaranteesSupport"/></li>
                <li><fmt:message key="guaranteesPage.text.guaranteesRequirements"/></li>
                <li><fmt:message key="guaranteesPage.text.guaranteesTiming"/></li>
            </ul>
            <hr>
        </div>
        <div class="container">
            <h2><fmt:message key="guaranteesPage.head.weProvides"/></h2>
            <p><fmt:message key="guaranteesPage.text.provides"/></p>
            <hr>
        </div>
        <div class="container">
            <h2><fmt:message key="guaranteesPage.head.weFinalize"/></h2>
            <p><fmt:message key="guaranteesPage.text.finalize"/></p>
            <hr>
        </div>
        <div class="container">
            <h2><fmt:message key="guaranteesPage.head.freeCorrection"/></h2>
            <p><fmt:message key="guaranteesPage.text.correction"/></p>
            <hr>
        </div>
        <div class="container">
            <h2><fmt:message key="guaranteesPage.head.admittance"/></h2>
            <p><fmt:message key="guaranteesPage.text.admittance"/></p>
            <hr>
        </div>
        <div class="container">
            <h2><fmt:message key="guaranteesPage.head.plagiaryCheck"/></h2>
            <p><fmt:message key="guaranteesPage.text.plagiary"/></p>
            <hr>
        </div>
        <div class="container">
            <h2><fmt:message key="guaranteesPage.head.guaranteePeriod"/></h2>
            <p><fmt:message key="guaranteesPage.text.guaranteePeriod"/></p>
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

