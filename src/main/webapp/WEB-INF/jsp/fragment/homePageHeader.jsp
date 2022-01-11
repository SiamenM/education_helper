<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="page_content"/>

<div id="intro" class="jumbotron-fluid md-5 mb-0 mt-5">
    <div class="mask flex-center rgba-grey-strong">
        <div class="container-fluid d-flex align-items-center justify-content-center h-100">
            <div class="row d-flex justify-content-center text-center mt-5">
                <div class="col-md-10 pt-3 pb-5">
                    <h2 class="display-4 font-weight-bold text-white bg-gradient-light pt-5 mb-2"><fmt:message key="mainpage.header.description"/></h2>
                    <hr class="hr-light">
                    <h4 class="white-text my-4"><fmt:message key="mainpage.header.description"/></h4>
                    <a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_FORM_TASK_PAGE}"
                       class="btn btn-info btn-rounded mb-4 purple-gradient"><em><fmt:message key="mainpage.button.evaluation"/></em></a>
                    <a href="" class="btn btn-info btn-rounded mb-4 purple-gradient" data-toggle="modal"
                       data-target="#modalContacts"><em><fmt:message key="mainpage.button.call"/></em> </a>
                </div>
            </div>
        </div>
    </div>
</div>