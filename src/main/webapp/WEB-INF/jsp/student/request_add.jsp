<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="req" value="${pageContext.request}"/>
<c:set var="baseURL"
       value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 1, fn:length(req.requestURI)), req.contextPath)}"/>

<spring:message code="Request.allRequests" var="mAllRequests"/>
<spring:message code="Request.allMyRequests" var="mMyRequests"/>
<spring:message code="Request.newRequest" var="mNewRequest"/>
<spring:message code="Request.lessonRequest" var="mLessonRequest"/>
<spring:message code="Request.title" var="mTitle"/>
<spring:message code="Request.upvotes" var="mUpvotes"/>
<spring:message code="Request.course" var="mCourse"/>
<spring:message code="Request.description" var="mDescription"/>

<spring:message code="Actions.info" var="mInfo"/>
<spring:message code="Actions.add" var="mAdd"/>
<spring:message code="Actions.collapse" var="mCollapse"/>

<section class="content-header">
    <h1>
        ${mLessonRequest}
    </h1>
</section>
<!-- main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- New request form -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">${mNewRequest}</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                title="${mCollapse}">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <div class="box-body">
                    <form:form action="${pageContext.request.contextPath}/request/add" method="POST"
                               accept-charset="UTF-8"
                               commandName="request">
                        <c:set var="courseError"><form:errors path="course"/></c:set>
                        <c:set var="titleError"><form:errors path="title"/></c:set>
                        <c:set var="descriptionError"><form:errors path="description"/></c:set>
                        <div class="row">
                            <div class="col-md-9 form-group has-feedback">
                                <form:label path="title">${mTitle} : <c:if test="${not empty titleError}"><span
                                        class="text-danger">${titleError}</span></c:if></form:label>
                                <form:input id="request_title" path="title" maxlength="50" minlength="3"
                                            class="form-control" placeholder="${mTitle}"/>
                                <div id="request_title_feedback" class="label label-default"></div>
                            </div>
                            <div class="col-md-3 form-group has-feedback">
                                <form:label path="course">${mCourse} : <c:if test="${not empty courseError}"><span
                                        class="text-danger">${courseError}</span></c:if></form:label>
                                <form:select id="request_course" path="course"
                                             class="form-control select2 select2-hidden-accessible"
                                             data-placeholder="${mCourse}" style="width: 100%;" tabindex="-1"
                                             aria-hidden="true">
                                    <option></option>
                                    <form:options items="${courses}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <form:label path="description">${mDescription} : <c:if test="${not empty descriptionError}"><span
                                    class="text-danger">${descriptionError}</span></c:if></form:label>
                            <form:textarea id="request_text" path="description" maxlength="300" minlength="10"
                                           class="form-control" placeholder="${mDescription}"/>
                            <div id="request_text_feedback" class="label label-default"></div>
                        </div>
                        <div class="form-group">
                            <form:button class="btn btn-default pull-right" type="submit">${mAdd}</form:button>
                        </div>
                    </form:form>
                </div>
                <div id="similar_requests"></div>
            </div>
        </div>
        <c:if test="${not empty myRequests}">
            <div class="col-md-12">
                <!-- todo add current requests -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">${mMyRequests}</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                    title="${mCollapse}">
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <table id="request-overview" class="table table-striped table-bordered" cellspacing="0"
                               width="100%">
                            <thead>
                            <tr>
                                <th>${mUpvotes}</th>
                                <th>${mTitle}</th>
                                <th>${mCourse}</th>
                                <th data-orderable="false">${mInfo}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="request" items="${myRequests}">
                                <tr>
                                    <td><span class="label label-default"><i
                                            class="fa fa-thumbs-up"></i> ${request.upvotes.size()}</span></td>
                                    <td>${request.title}</td>
                                    <td>${request.course.name}</td>
                                    <td>
                                        <a href="<c:url value="/request/${request.id}"/>"
                                           class="btn btn-sm btn-info pull-right"><i class="fa fa-info"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${not empty requests}">
            <div class="col-md-12">
                <!-- todo add current requests -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">${mAllRequests}</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                                    title="${mCollapse}">
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <table id="request-overview" class="table table-striped table-bordered" cellspacing="0"
                               width="100%">
                            <thead>
                            <tr>
                                <th>${mUpvotes}</th>
                                <th>${mTitle}</th>
                                <th>${mCourse}</th>
                                <th data-orderable="false">${mInfo}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="request" items="${requests}">
                                <tr>
                                    <td><span class="label label-default"><i
                                            class="fa fa-thumbs-up"></i> ${request.upvotes.size()}</span></td>
                                    <td>${request.title}</td>
                                    <td>${request.course.name}</td>
                                    <td>
                                        <a href="<c:url value="/request/${request.id}"/>"
                                           class="btn btn-sm btn-info pull-right"><i class="fa fa-info"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</section>
