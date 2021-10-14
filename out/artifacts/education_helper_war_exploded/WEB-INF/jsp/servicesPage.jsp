<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>

<!doctype html>
<html lang="${sessionScope.locale}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Services</title>
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
    >
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
</div>
<main>
    <div class="container-fluid container-color mt-5 py-5">
        <div class="row">
            <div class="btn-group" role="group" aria-label="services">
                <div class="col-6 col-sm-12 d-flex justify-content-center">
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/controlWork.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Контрольные работы</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/coursework.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Курсовые работы</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/practiceReport.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Отчёты по практике</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/blueprint.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-3">Чертежи</p>
                    </a>
                </div>
            </div>
            <div class="btn-group my-auto" role="group" aria-label="services">
                <div class="col-6 col-sm-12 pt-4 d-flex justify-content-center">
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 text-center purple-gradient"
                       role="button">
                        <img src="<c:url value="/static/img/icons/graduated.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Дипломные работы</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 text-nowrap purple-gradient"
                       role="button">
                        <img src="<c:url value="/static/img/icons/programming.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Программирование</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/report.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Рефераты</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/cheatSheet.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Шпаргалки</p>
                    </a>
                </div>
            </div>
            <div class="btn-group my-auto" role="group" aria-label="services">
                <div class="col-6 col-sm-12 pt-4 d-flex justify-content-center">
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 text-center purple-gradient"
                       role="button">
                        <img src="<c:url value="/static/img/icons/answers.png"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Ответы на вопросы</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 text-nowrap purple-gradient"
                       role="button">
                        <img src="<c:url value="/static/img/icons/rework.svg"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Доработка работы</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/tasks.png"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Задачи</p>
                    </a>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}" class="btn btn-info btn-second btn-service mx-3 my-1 purple-gradient" role="button">
                        <img src="<c:url value="/static/img/icons/abc.png"/>" width="40" class="pt-4" alt="">
                        <p class="text pt-2">Поднятие уникальности</p>
                    </a>
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