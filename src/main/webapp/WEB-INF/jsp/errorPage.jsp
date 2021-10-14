<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="${sessionScope.locale}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Error</title>
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
    <link rel="stylesheet" href="<c:url value="/static/css/errorPageCss.css"/>">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"/>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
</div>
<main class="vertical-center">
    <div class="container-fluid error-container px-0">
        <div class="mask flex-center mt-5 pt-5" style="background-color:rgba(251, 251, 251, 0.6)">
            <div class="row my-5 py-5">
                <div class="col-md-12">
                    <div class="error-template">
                        <br>
                        <br>
                        <h1>Oops!</h1>
                        <h2>404 Not Found</h2>
                        <div class="error-details">
                            Sorry, an error has occured, Requested page not found!
                        </div>
                        <div class="error-actions">
                            <a href="#" class="btn btn-primary btn-lg">Take Me Home </a>
                            <a href="#" class="btn btn-default btn-lg">Contact Support </a>
                            <br>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="/WEB-INF/jsp/fragment/footer.jsp"/>
</body>
</html>
<jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>