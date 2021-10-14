<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="${sessionScope.locale}">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
</div>
<main>
    <div class="container-fluid container-color px-0" id="requestForm">
        <div class="mask flex-center rgba-teal-strong">
            <div class="row py-5">
                <div class="col mt-5">
                    <div class="card bg-light m-5 px-5 pt-5 offset-md-2" style="width: 45rem;">
                        <form class="form-horizontal">
                            <h3 class="text-center font-weight-bold">Заявка на выполнение работы</h2>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="theme">Тема или № варианта</label>
                                            <input type="text" class="form-control" id="theme">
                                        </div>
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="type">Вид работы</label>
                                            <select class="form-control" id="type">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="disciple">Диcциплина</label>
                                            <input type="text" class="form-control" id="disciple" required>
                                        </div>
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="inputDate">Срок сдачи</label>
                                            <input type="date" class="form-control" id="inputDate" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="institution">ВУЗ</label>
                                            <input type="text" class="form-control" id="institution">
                                        </div>
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="name">Имя</label>
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="emailInput">Почта</label>
                                            <input type="email" class="form-control" id="emailInput" required>
                                        </div>
                                        <div class="col">
                                            <label class=" pt-2 my-0" for="phoneInput">Телефон</label>
                                            <input type="tel" class="form-control" id="phoneInput" required>
                                        </div>
                                    </div>
                                    <label class=" pt-2 my-0" for="inputFile">Файлы</label>
                                    <input type="file" id="inputFile" name="upload_file[]" class="form-control display-7" min="1" max="10" multiple="true">
                                    <label class=" pt-2 my-0" for="comments">Комментарии к заказу</label>
                                    <textarea class="form-control" id="comments" rows="4"></textarea>
                                    <br>
                                    <div class="col text-center">
                                        <input class="btn btn-rounded mb-4 purple-gradient" type="submit" onclick="message('Ваше заявка отправлена, наш менеджер свяжется с Вами')" value="Отправить">
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>
                <div class="col mt-5 pt-5">
                    <table class="table-sm mt-5 p-5 ml-5">
                        <tbody>
                        <tr>
                            <td><img src="<c:url value="/static/img/number/1y.png"/>" width="40" alt="1"></td>
                            <td>
                                <h5 class="mb-1 text-white">Заявка</h5>
                                <p class="mb-0 text-white">
                                    Оставьте
                                    <a class="text-white font-italic" href="#" data-toggle="modal" data-target="#modalOrder">заяку на сайте</a>
                                    или
                                    <a class="text-white font-italic" href="#" data-toggle="modal" data-target="#modalContacts">позвоните нам</a>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value="/static/img/number/2y.png"/>" width="40"  alt="2"> </td>
                            <td>
                                <h5 class="mb-1 text-white">Расчёт стоимости</h5>
                                <p class="mb-0 text-white">На основании заявки мы производим расчет стоимости работы</p>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value="/static/img/number/3y.png"/>" width="40" alt="3"> </td>
                            <td>
                                <h5 class="mb-1 text-white">Предоплата</h5>
                                <p class="mb-0 text-white">Предоплата составляет 50% от стоимости работ</p>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value="/static/img/number/4y.png"/>" width="40" alt="4"> </td>
                            <td>
                                <h5 class="mb-1 text-white">Выполнение</h5>
                                <p class="mb-0 text-white">Наш специалист максимально качественно и в определенные сроки выполнит Ваше задание</p>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value="/static/img/number/5y.png"/>" width="40" alt="5"> </td>
                            <td>
                                <h5 class="mb-1 text-white">Работа готова</h5>
                                <p class="mb-0 text-white">Ваше задание выполнено</p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/jsp/fragment/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>
<jsp:include page="/WEB-INF/jsp/fragment/scriptSourceLink.jsp"/>
<jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>

