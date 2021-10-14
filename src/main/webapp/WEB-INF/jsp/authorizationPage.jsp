<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="${sessionScope.locale}">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Authorization</title>
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
</div>
<main>
    <div class="jumbotron container-color align-items-center min-vh-100 mb-0 pb-0 px-0">
        <br>
        <br>
        <br>
        <div class="card bg-light mx-auto mt-5 px-5 pt-5" style="width: 30rem;">
            <form class="form-horizontal pb-1">
                <h3 class="text-center font-weight-bold">Вход в личный кабинет</h3>
                <label class="pt-2 my-0" for="login">ФИО</label>
                <input type="text" class="form-control" id="login" required>
                <label class="pt-2 my-0" for="password">Почта</label>
                <input type="text" class="form-control" id="password" required>
                <br>
                <div class="col text-center">
                    <input class="btn btn-rounded mb-4 purple-gradient" type="submit" value="Войти в личный кабинет">
                </div>
            </form>
        </div>
        <jsp:include page="/WEB-INF/jsp/fragment/footer.jsp"/>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
<jsp:include page="/WEB-INF/jsp/fragment/scriptSourceLink.jsp"/>
<jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>
