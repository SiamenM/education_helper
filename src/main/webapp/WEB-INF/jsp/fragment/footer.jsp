<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="page_content"/>

<footer class="page-footer font-small unique-color-dark pt-0" id="footer">
    <div class="mask flex-center rgba-black-strong">
        <div class="container">
            <div class="row py-4">
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-0">
                    <h6 class="text font-weight-bold"><strong><fmt:message key="footer.label.contacts"/></strong></h6>
                    <hr class="hr-light" style="width: 60px;">
                    <p>+375-25-716-72-03</p>
                    <p>educationhelper@gmail.com</p>
                </div>
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-0">
                    <h6 class="text font-weight-bold"><strong><fmt:message key="footer.label.links"/></strong></h6>
                    <hr class="hr-light" style="width: 60px;">
                    <p><a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_HOME_PAGE}">
                        <fmt:message key="footer.link.finishedWorks"/></a></p>
                    <p><a href="?${ApplicationConstants.COMMAND_NAME_PARAMETER}=${CommandType.VIEW_AUTHOR_REGISTRATION_PAGE}"><fmt:message key="footer.link.becomeAuthor"/></a></p>
                    <p><a href="#"><fmt:message key="footer.link.evaluateOrder"/></a></p>
                </div>
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-0">
                    <h6 class="text font-weight-bold"><strong><fmt:message key="footer.label.workTime"/></strong></h6>
                    <hr class="hr-light" style="width: 60px;">
                    <p><fmt:message key="footer.label.MoFr"/></p>
                    <p><fmt:message key="footer.label.SaSu"/></p>
                    <p><fmt:message key="footer.label.receiveCalls"/></p>
                </div>
            </div>
        </div>
    </div>
</footer>