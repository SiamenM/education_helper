<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="page_content"/>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top scrolling-navbar py-0">
    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_HOME_PAGE}" class="navbar-brand">
        <img src="<c:url value="/static/img/logo.png"/>" width="130" height="50" alt="logo"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicNav" aria-controls="basicNav"
            aria-expanded="false" aria-label="Toggle Navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="basicNav">
        <ul class="navbar-nav mr-auto smooth-scroll">
            <li class="nav-item">
                <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_HOME_PAGE}"
                   class="nav-link waves-effect waves-light"><fmt:message key="navbar.button.home"/></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropDownMenuClients" role="button"
                   data-bs-toggle="dropdown" aria-expanded="false"><fmt:message key="navbar.button.clients"/></a>
                <ul class="dropdown-menu pb-0" aria-labelledby="navbarDropDownMenuClients">
                    <li><a class="dropdown-item"
                           href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_AUTHORIZATION_PAGE}">Войти
                        в личный кабинет</a></li>
                    <li><a class="dropdown-item"
                           href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_CLIENT_INSTRUCTION_PAGE}">Инструкция
                        для клиента</a></li>
                    <li><a class="dropdown-item"
                           href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_SERVICES_PAGE}">Услуги</a>
                    </li>
                    <li><a class="dropdown-item"
                           href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_GUARANTEES_PAGE}">Наши
                        гарантии</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropDownMenuAuthors" role="button"
                   data-bs-toggle="dropdown" aria-expanded="false"><fmt:message key="navbar.button.authors"/></a>
                <ul class="dropdown-menu pb-0" aria-labelledby="navbarDropDownMenuAuthors">
                    <c:if test="${not empty ApplicationConstants.USER_PARAMETER}">
                        <li><a class="dropdown-item"
                               href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_AUTHOR_REGISTRATION_PAGE}">Стать
                            автором</a></li>
                        <li><a class="dropdown-item"
                               href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_AUTHORIZATION_PAGE}">Войти
                            в личный кабинет</a></li>
                    </c:if>
                    <li><a class="dropdown-item"
                           href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_AUTHOR_QUESTIONS_PAGE}">Часто
                        задаваемые вопросы</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="#intro2" class="nav-link waves-effect waves-light"><fmt:message key="navbar.button.finished"/></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropDownMenuAboutUs" role="button"
                   data-bs-toggle="dropdown" aria-expanded="false"><fmt:message key="navbar.button.aboutUs"/></a>
                <ul class="dropdown-menu pb-0" aria-labelledby="navbarDropDownMenuAboutUs">
                    <li><a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalContacts">Контакты</a>
                    </li>
                </ul>
            </li>
        </ul>
        <ul class="navbar-nav mr-3 smooth-scroll">
            <li class="nav-item justify-content-right">
                <a href="?${ApplicationConstants.LOCALE_PARAMETER}=${ApplicationConstants.ENGLISH_LOCALE}&${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_HOME_PAGE}"
                   class="nav-link waves-effect waves-light <c:if test="${sessionScope.locale.equals(ApplicationConstants.ENGLISH_LOCALE)}">btn-outline-white</c:if>">
                    <img src="<c:url value="/static/img/united-kingdom.svg"/>" width="40" class="img-responsive"
                         alt="En">
                </a>
            </li>
            <li class="nav-item justify-content-right">
                <a href="?${ApplicationConstants.LOCALE_PARAMETER}=${ApplicationConstants.RUSSIAN_LOCALE}&${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_HOME_PAGE}"
                   class="nav-link waves-effect waves-light <c:if test="${sessionScope.locale.equals(ApplicationConstants.RUSSIAN_LOCALE)}">btn-outline-white</c:if>">
                    <img src="<c:url value="/static/img/russia.svg"/>" width="40" class="img-responsive" alt="Ru">
                </a>
            </li>
        </ul>
    </div>
</nav>