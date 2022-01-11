<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.maskalenchyk.education_helper.application.ApplicationConstants" %>
<%@ page import="com.maskalenchyk.education_helper.command.CommandType" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="page_content"/>

<!doctype html>
<html lang="${sessionScope.locale}">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Author question</title>
    <jsp:include page="/WEB-INF/jsp/fragment/sourceStyleLinks.jsp"/>
</head>

<body>
<div class="container-fluid ml-0 mr-0 pl-0 pr-0">
    <jsp:include page="/WEB-INF/jsp/fragment/navbar.jsp"/>
    <main class="container-color pb-3">
        <div class="container my-5 py-5">
            <div class="accordion" id="accordionQuestion">
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question1">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer1" aria-expanded="true" aria-controls="answer1">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question1"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer1" class="collapse" aria-labelledby="question1" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text my-0"><fmt:message key="authorQuestion.text.answer1Part1"/></p>

                            <p class="text my-0"><fmt:message key="authorQuestion.text.answer1Part2"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question2">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer2" aria-expanded="false" aria-controls="answer2">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question2"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer2" class="collapse" aria-labelledby="questionTwo" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer2"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question3">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer3" aria-expanded="false" aria-controls="answer3">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question3"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer3" class="collapse" aria-labelledby="question3" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer3Part1"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer3Part2"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question4">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer4" aria-expanded="false" aria-controls="answer4">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question4"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer4" class="collapse" aria-labelledby="question4" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer4"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question5">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer5" aria-expanded="false" aria-controls="answer5">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question5"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer5" class="collapse" aria-labelledby="question5" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer5Part1"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer5Part2"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer5Part3"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question6">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer6" aria-expanded="false" aria-controls="answer6">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question6"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer6" class="collapse" aria-labelledby="question6" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer6Part1"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer6Part2"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer6Part3"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question7">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer7" aria-expanded="false" aria-controls="answer7">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question7"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer7" class="collapse" aria-labelledby="question7" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer7Part1"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer7Part2"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question8">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer8" aria-expanded="false" aria-controls="answer8">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question8"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer8" class="collapse" aria-labelledby="question8" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer8Part1"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer8Part2"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question9">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer9" aria-expanded="false" aria-controls="answer9">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question9"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer9" class="collapse" aria-labelledby="question9" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer9Part1"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer9Part2"/></p>
                        </div>
                    </div>
                </div>
                <div class="card peach-gradient color-block">
                    <div class="card-header" id="question10">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed px-1 py-0 my-0" type="button" data-toggle="collapse"
                                    data-target="#answer10" aria-expanded="false" aria-controls="answer10">
                                <p class="text-left my-0"><fmt:message key="authorQuestion.head.question10"/></p>
                            </button>
                        </h2>
                    </div>
                    <div id="answer10" class="collapse" aria-labelledby="question10" data-parent="#accordionQuestion">
                        <div class="card-body">
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer10Part1"/></p>
                            <p class="text mb-0"><fmt:message key="authorQuestion.text.answer10Part2"/></p>
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
<jsp:include page="/WEB-INF/jsp/fragment/scriptSourceLink.jsp"/>
<jsp:include page="/WEB-INF/jsp/fragment/modal/contacts.jsp"/>

