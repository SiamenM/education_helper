<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Author registration</title>
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
</div>
<main>
    <div class="container-fluid container-color pr-0 pl-0" id="registrationForm">
        <div class="mask flex-center rgba-teal-strong">
            <div class="row align-items-center py-0">
                <div class="col-12 col-md-7 col-lg-6 pb-4 my-5 justify-content-center">
                    <div class="card bg-light mt-5 p-5 offset-md-2" style="width: 30rem;">
                        <form class="form-horizontal">
                            <h3 class="text-center font-weight-bold">Регистрация автора</h3>
                            <label class="pt-2 my-0" for="nameAuthor">ФИО</label>
                            <input type="text" class="form-control" id="nameAuthor" required>
                            <label class="pt-2 my-0" for="emailAuthor">Почта</label>
                            <input type="email" class="form-control" id="emailAuthor" required>
                            <label class="pt-2 my-0" for="phoneAuthor">Телефон</label>
                            <input type="tel" class="form-control" id="phoneAuthor" required>
                            <label class="pt-2 my-0" for="specializationAuthor">Специализация</label>
                            <select class="form-control" id="specializationAuthor">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                                <option>4</option>
                            </select>
                            <label class="pt-2 my-0" for="documentsAuthor">Копии документов об образовании</label>
                            <input type="file" id="inputFile" name="upload_file[]" class="form-control display-7" min="1" max="10" multiple="true">
                            <label class="pt-2 my-0" for="documentsAuthor">Дополнительная информация</label>
                            <textarea class="form-control" id="documentsAuthor" rows="4"></textarea>
                            <br>
                            <div class="col text-center">
                                <input class="btn btn-rounded mb-4 purple-gradient" type="submit" onclick="message('Ваше заявка отправлена, наш менеджер свяжется с Вами')" value="Отправить">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-12 col-md-7 col-lg-6">
                    <div class="col">
                        <h3 class="text-center font-weight-bold text-white">Автор студенческих работ</h3>
                        <p class="text-center text-white">Требуются авторы студенческих работ для сотрудничества</p>
                        <p class="text-center text-white">Заполните представленную форму, после чего мы свяжемся с Вами, и позвоните нам</p>
                        <div class="row text-center">
                            <div class="col">
                                <a href="#" class="btn btn-info btn-rounded mb-4 purple-gradient" data-toggle="modal" data-target="#modalContacts">Позвонить</a>
                            </div>
                        </div>
                    </div>
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
