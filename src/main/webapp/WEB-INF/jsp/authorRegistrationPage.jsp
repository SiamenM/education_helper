<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.user.RegistrationUserCommand" %>
<%@ page import="com.maskalenchyk.education_helper.entity.UserRole" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:bundle basename="page_content" prefix="registrationPage.">

    <!doctype html>
    <html lang="${sessionScope.locale}">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
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
                                <h3 class="text-center font-weight-bold"><fmt:message key="label.registration"/></h3>
                                <label class="pt-2 my-0" for="nameAuthor"><fmt:message key="label.name"/></label>
                                <input type="text" class="form-control" id="nameAuthor"
                                       name="${RegistrationUserCommand.USER_NAME}" required>
                                <label class="pt-2 my-0" for="emailAuthor"><fmt:message key="label.email"/></label>
                                <input type="email" class="form-control" id="emailAuthor"
                                       name="${RegistrationUserCommand.USER_EMAIL}" required>
                                <label class="pt-2 my-0" for="phoneAuthor"><fmt:message key="label.phone"/></label>
                                <input type="tel" class="form-control" id="phoneAuthor"
                                       name="${RegistrationUserCommand.USER_PHONE}" required>
                                <div class="bg-light p-3" style="max-height:200px;overflow:auto">
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                    <label class="display-7 d-block"><input type="checkbox" name="science[]"
                                                                            value="490"> TEST</label>
                                </div>
                                <label class="pt-2 my-0" for="documentsAuthor"><fmt:message
                                        key="label.additionalInformation"/></label>
                                <textarea class="form-control" id="documentsAuthor" rows="4"
                                          name="${RegistrationUserCommand.USER_ADDITIONAL_INFO}"></textarea>
                                <br>
                                <div class="col text-center">
                                    <input> type="hidden" name="${RegistrationUserCommand.USER_ROLE}" value="${UserRole.AUTHOR}">
                                    <input type="hidden" name="${ApplicationConstants.COMMAND_NAME_PARAMETER}">
                                    <input class="btn btn-rounded mb-4 purple-gradient" type="submit"
                                           onclick="message('<fmt:message key="message.msgAfterSend"/>')"
                                           value="<fmt:message key="button.send"/>">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-md-7 col-lg-6">
                        <div class="col">
                            <h3 class="text-center font-weight-bold text-white"><fmt:message
                                    key="label.authorHead"/></h3>
                            <p class="text-center text-white"><fmt:message key="label.authorRequired"/></p>
                            <p class="text-center text-white"><fmt:message key="label.fillForm"/></p>
                            <div class="row text-center">
                                <div class="col">
                                    <a href="#" class="btn btn-info btn-rounded mb-4 purple-gradient"
                                       data-toggle="modal" data-target="#modalContacts"><fmt:message
                                            key="button.call"/></a>
                                </div>
                            </div>
                        </div>
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
    </html>
    <jsp:include page="/WEB-INF/jsp/fragment/scriptSourceLink.jsp"/>
    <jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>
</fmt:bundle>