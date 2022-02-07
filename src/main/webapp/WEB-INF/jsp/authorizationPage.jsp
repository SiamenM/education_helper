<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<%@ page import="com.maskalenchyk.education_helper.command.user.SignInCommand" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:bundle basename="page_content" prefix="authorizationPage.">

    <!doctype html>
    <html lang="${sessionScope.locale}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Authorization</title>
        <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
    </head>

    <body>
    <div class="container-fluid ml-0 mr-0 pl-0 pr-0 pb-5">
        <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
    </div>
    <main>
            <div class="jumbotron container-color align-items-center min-vh-100 mb-0 pb-0 px-0">
                <br>
                <br>
                <br>
                <div class="card bg-light mx-auto mt-5 px-5 pt-5" style="width: 30rem;">
                    <c:if test="${not empty param.get(SignInCommand.LOGIN_PARAMETER)}">
                        <div class="alert alert-danger">
                            <fmt:message key="message.invalidInput"/>
                        </div>
                    </c:if>
                    <form class="form-horizontal pb-1" action="${pageContext.request.contextPath}/" method="post">
                        <h3 class="text-center font-weight-bold"><fmt:message key="label.authorization"/></h3>
                        <label class="pt-2 my-0" for="login"><fmt:message key="label.login"/></label>
                        <input type="text" class="form-control" id="login" name="${SignInCommand.LOGIN_PARAMETER}"
                               <c:if test="${not empty param.get(SignInCommand.LOGIN_PARAMETER)}">value="${requestScope.get(SignInCommand.LOGIN_PARAMETER)}"</c:if>
                               required>
                        <label class="pt-2 my-0" for="password"><fmt:message key="label.password"/></label>
                        <input type="text" class="form-control" id="password" name="${SignInCommand.PASSWORD_PARAMETER}"
                               required>
                        <br>
                        <div class="col text-center">
                            <input type="hidden" name="${ApplicationConstants.COMMAND_NAME_PARAMETER}"
                                   value="${CommandType.SIGN_IN}"/>
                            <input class="btn btn-rounded mb-4 purple-gradient" type="submit"
                                   value="<fmt:message key="button.enter"/>">
                        </div>
                    </form>
                </div>
            </div>

            <jsp:include page="/WEB-INF/jsp/fragment/footer.jsp"/>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    </body>
    </html>
    <jsp:include page="/WEB-INF/jsp/fragment/scriptSourceLink.jsp"/>
    <jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>
</fmt:bundle>