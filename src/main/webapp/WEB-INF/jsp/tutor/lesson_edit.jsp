<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<jsp:include page="../include/head.jsp">
    <jsp:param value="Edit lesson" name="title"/>
</jsp:include>
<body class="hold-transition skin-blue">
<div class="wrapper">
    <jsp:include page="../include/menu/main-header.jsp"/>
    <jsp:include page="../include/menu/sidebar.jsp">
        <jsp:param value="tutor_lessons" name="title"/>
    </jsp:include>
    <!-- Content header (Page header) -->
    <div class="content-wrapper" style="min-height: 1126px;">
        <section class="content-header">
            <h1>
                Lesson "${lesson.name}"
            </h1>
        </section>
        <!-- main content -->
        <section class="content container-box">
            <div class="row">
                <!-- edit form -->
                <div class="col-md-12 col-sm-12">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Edit Lesson</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                        class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form:form method="post" commandName="lesson"
                                               enctype="application/x-www-form-urlencoded">
                                        <c:set var="nameError"><form:errors path="name"/></c:set>
                                        <c:set var="descriptionError"><form:errors path="description"/></c:set>
                                        <c:set var="dateError"><form:errors path="date"/></c:set>
                                        <c:set var="courseError"><form:errors path="course"/></c:set>
                                        <c:set var="maxParticipantsError"><form:errors path="maxParticipants"/></c:set>
                                        <c:set var="durationError"><form:errors path="duration"/></c:set>
                                        <c:set var="roomError"><form:errors path="room"/></c:set>
                                        <c:set var="backupRoomError"><form:errors path="backupRoom"/></c:set>
                                        <div class="form-group has-feedback">
                                            <form:label path="name">Name : <c:if test="${not empty nameError}"><span
                                                    class="text-danger">${nameError}</span></c:if></form:label>
                                            <form:input path="name" class="form-control" placeholder="Name"/>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <form:label path="description">Description : <c:if
                                                    test="${not empty descriptionError}"><span
                                                    class="text-danger">${descriptionError}</span></c:if></form:label>
                                            <form:textarea path="description" class="form-control"
                                                           placeholder="Description" rows="5"/>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <form:label path="date">Date & Time : <c:if
                                                        test="${not empty dateError}"><span
                                                        class="text-danger">${dateError}</span></c:if></form:label>
                                                <div class="form-group has-feedback">
                                                    <div class="input-group date" id="datetimepicker">
                                                        <form:input path="date" type="text" class="form-control"
                                                                    placeholder="Lesson date"/>
                                                                <span class="input-group-addon">
                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <form:label path="course">Course : <c:if
                                                            test="${not empty courseError}"><span
                                                            class="text-danger">${courseError}</span></c:if></form:label>
                                                    <form:select path="course" class="form-control"
                                                                 placeholder="Course">
                                                        <form:option value="" label="--- Course ---"/>
                                                        <form:options items="${courses}" itemValue="id"
                                                                      itemLabel="name"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <form:label path="maxParticipants">Maximum number of participants :
                                                        <c:if test="${not empty maxParticipantsError}"><span
                                                                class="text-danger">${maxParticipantsError}</span></c:if></form:label>
                                                    <form:input path="maxParticipants" type="number" min="1"
                                                                class="form-control"
                                                                placeholder="Maximum number of participants"/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <form:label path="duration">Duration : <c:if
                                                            test="${not empty durationError}"><span
                                                            class="text-danger">${durationError}</span></c:if></form:label>
                                                    <form:input path="duration" type="time" class="form-control"
                                                                placeholder="Lesson duration"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group has-feedback">
                                                    <form:label path="room">Room : <c:if
                                                            test="${not empty roomError}"><span
                                                            class="text-danger">${roomError}</span></c:if></form:label>
                                                    <form:select path="room" class="form-control" placeholder="Room">
                                                        <form:option value="" label="--- Room ---"/>
                                                        <form:options items="${rooms}" itemValue="id" itemLabel="name"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <div class="col-md-6">
                                                    <form:label path="backupRoom">Backup room : <c:if
                                                            test="${not empty backupRoomError}"><span
                                                            class="text-danger">${backupRoomError}</span></c:if></form:label>
                                                    <form:select path="backupRoom" class="form-control">
                                                        <form:option value="" label="--- Backup Room ---"/>
                                                        <form:options items="${rooms}" itemValue="id" itemLabel="name"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary pull-right">Back</button>
                                            <c:if test="${editable}">
                                                <button type="submit" class="btn btn-primary pull-right">Change</button>
                                            </c:if>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- My current bookings -->
                <div class="col-md-12 col-sm-12">
                    <div class="box box-primary">
                        <div class="box-header with-border row">
                            <h3 class="box-title col-md-1">Bookings</h3>
                            <div class=" col-md-10 progress">
                                <c:set var="percentage" value="${bookings.size()/lesson.maxParticipants*100}"/>
                                <div class="progress-bar progress-bar-striped active
                                        <c:choose>
                                            <c:when test="${percentage < 60}">progress-bar-success</c:when>
                                            <c:when test="${percentage > 60 and percentage < 100}">progress-bar-warning</c:when>
                                            <c:when test="${percentage == 100}">progress-bar-danger</c:when>
                                        </c:choose>"
                                     style="width: ${bookings.size()/lesson.maxParticipants*100}%"></div>
                            </div>
                            <div class="box-tools pull-right col-md-1">
                                <span class="label label-danger">${bookings.size()} bookings</span>
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                        class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body no-padding">
                            <c:if test="${empty bookings}">
                                <div class="alert alert-warning col-sm-4 col-sm-offset-4">
                                    <h4><i class="icon fa fa-frown-o"></i>No bookings</h4>
                                    Be patient, students will join...
                                </div>
                            </c:if>
                            <c:if test="${not empty bookings}">
                                <ul class="row users-list">
                                    <c:forEach var="student" items="${bookings}">
                                        <div class="col-md-2 col-sm-3 col-xs-6">
                                            <li style="padding-bottom: 10px;">
                                                <a class="users-list-name"
                                                   href="<c:url value="/profile/${student.id}"/>">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <img class="profile-user-img img-circle"
                                                                 src="<c:url value="/resources/students/${student.id}/avatar.png"/>"
                                                                 alt="User Image">
                                                        </div>
                                                        <span class="col-md-10"
                                                              style="margin-left: 10px;">${student.name}</span>
                                                    </div>
                                                </a>
                                            </li>
                                        </div>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
<c:choose>
    <c:when test="${!editable}">
        <script>
            $( "input, select, textarea" ).each(function() {
                $( this ).prop('disabled', true);
            });
        </script>
    </c:when>
    <c:otherwise>
        <script>
            $( document ).ready( function () {
            $( "#datetimepicker" ).datetimepicker( {
            locale : 'nl'
            } );
            } );
        </script>
    </c:otherwise>
</c:choose>
</body>
</html>