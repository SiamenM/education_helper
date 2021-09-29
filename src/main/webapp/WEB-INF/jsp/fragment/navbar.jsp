<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top scrolling-navbar py-0">
    <a href="#" class="navbar-brand">
        <img src="<c:url value="/static/img/logo.png"/>" width="130" height="50" alt="logo"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicNav" aria-controls="basicNav" aria-expanded="false" aria-label="Toggle Navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="basicNav">
        <ul class="navbar-nav mr-auto smooth-scroll">
            <li class="nav-item">
                <a href="#intro" class="nav-link waves-effect waves-light">Главная</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropDownMenuClients" role="button" data-bs-toggle="dropdown" aria-expanded="false">Клиентам</a>
                <ul class="dropdown-menu pb-0" aria-labelledby="navbarDropDownMenuClients">
                    <li><a class="dropdown-item" href="#">Войти в личный кабинет</a></li>
                    <li><a class="dropdown-item" href="#">Инструкция для клиента</a></li>
                    <li><a class="dropdown-item" href="#">Услуги</a></li>
                    <li><a class="dropdown-item " href="#">Наши преимущества</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropDownMenuAuthors" role="button" data-bs-toggle="dropdown" aria-expanded="false">Авторам</a>
                <ul class="dropdown-menu pb-0" aria-labelledby="navbarDropDownMenuAuthors">
                    <li><a class="dropdown-item" href="#">Стать автором</a></li>
                    <li><a class="dropdown-item" href="#">Войти в личный кабинет</a></li>
                    <li><a class="dropdown-item" href="#">Часто задаваемые вопросы</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="#intro2" class="nav-link waves-effect waves-light">Готовые работы</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropDownMenuAboutUs" role="button" data-bs-toggle="dropdown" aria-expanded="false">О нас</a>
                <ul class="dropdown-menu pb-0" aria-labelledby="navbarDropDownMenuAboutUs">
                    <li><a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalContacts">Контакты</a></li>
                    <li><a class="dropdown-item" href="#">Наши премущества</a></li>
                    <li><a class="dropdown-item" href="#">Наши гарантии</a></li>
                </ul>
            </li>
        </ul>
        <ul class="navbar-nav mr-3 smooth-scroll">
            <li class="nav-item justify-content-right">
                <a href="#intro4" class="nav-link waves-effect waves-light btn-outline-white">
                    <img src="<c:url value="/static/img/united-kingdom.svg"/>" width="40" class="img-responsive" alt="En">
                </a>
            </li>
            <li class="nav-item justify-content-right">
                <a href="#intro5" class="nav-link waves-effect waves-light">
                    <img src="<c:url value="/static/img/russia.svg"/>" width="40" class="img-responsive" alt="Ru">
                </a>
            </li>
        </ul>
    </div>
</nav>