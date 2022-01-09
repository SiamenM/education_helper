<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="page_content"/>

<!doctype html>
<html lang="${sessionScope.locale}">

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
                <li><a href="#algorithm"><fmt:message key="clientInstruction.head.order"/></a></li>
                <li><a href="#request"><fmt:message key="clientInstruction.head.request"/></a></li>
                <li><a href="#cabinet"><fmt:message key="clientInstruction.head.account"/></a></li>
                <li><a href="#reworking"><fmt:message key="clientInstruction.head.return"/></a></li>
            </ul>
        </div>
        <div class="container">
            <a id="algorithm"></a>
            <h3><fmt:message key="clientInstruction.head.order"/></h3>
            <div class="container containerWithBorder">
                <p class="font-weight-bold mb-0"><fmt:message key="clientInstruction.head.step1"/><span class="border-left  border-warning"></span></p>
                <p><fmt:message key="clientInstruction.text.step1"/> <span class="border-left  border-warning"></span></p>
                <p class="font-weight-bold mb-0"><fmt:message key="clientInstruction.head.step2"/></p>
                <p><fmt:message key="clientInstruction.text.step2"/></p>
                <p class="font-weight-bold mb-0"><fmt:message key="clientInstruction.head.step3"/></p>
                <p><fmt:message key="clientInstruction.text.step3"/></p>
                <p class="font-weight-bold mb-0"><fmt:message key="clientInstruction.head.step4"/></p>
                <p><fmt:message key="clientInstruction.text.step4"/></p>
                <p class="font-weight-bold mb-0"><fmt:message key="clientInstruction.head.step5"/></p>
                <p><fmt:message key="clientInstruction.text.step5"/></p>
                <p class="font-weight-bold mb-0"><fmt:message key="clientInstruction.head.step6"/></p>
                <p><fmt:message key="clientInstruction.text.step6"/></p>
                <p class="font-weight-bold mb-0"><fmt:message key="clientInstruction.head.step7"/></p>
                <p><fmt:message key="clientInstruction.text.step7"/></p>
            </div>
        </div>
        <div class="container">
            <a id="request"></a>
            <h3><fmt:message key="clientInstruction.head.request"/></h3>
            <div class="container containerWithBorder">
                <p><fmt:message key="clientInstruction.text.registration1"/></p>
                <p><span style="font-weight:bold"><fmt:message key="clientInstruction.text.registration2"/></span> <fmt:message key="clientInstruction.text.registration3"/></p>
                <p><span style="font-weight:bold"><fmt:message key="clientInstruction.text.registration4"/></span> <fmt:message key="clientInstruction.text.registration5"/></p>
            </div>
        </div>
        <div class="container">
            <a id="cabinet"></a>
            <h3><fmt:message key="clientInstruction.head.account"/></h3>
            <div class="container containerWithBorder">
                <p> <fmt:message key="clientInstruction.text.enterCabinet"/></p>
                <p class="text mb-0"><fmt:message key="clientInstruction.text.cabinetOpportunitiesHead"/></p>
                <p class="text mb-0"><fmt:message key="clientInstruction.text.cabinetOpportunitiesFirst"/></p>
                <p class="text mb-0"><fmt:message key="clientInstruction.text.cabinetOpportunitiesSecond"/></p>
                <p class="text"><fmt:message key="clientInstruction.text.cabinetOpportunitiesThird"/></p>
            </div>
        </div>
        <div class="container">
            <a id="reworking"></a>
            <h3><fmt:message key="clientInstruction.head.return"/></h3>
            <div class="container containerWithBorder">
                <p> <fmt:message key="clientInstruction.text.returnInstruction1"/><span style="font-weight:bold">education-helper@gmail.com</span>
                    <fmt:message key="clientInstruction.text.returnInstruction2"/></p>
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


