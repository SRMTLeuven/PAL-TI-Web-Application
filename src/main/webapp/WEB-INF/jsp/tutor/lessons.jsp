<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<jsp:include page="../include/head.jsp">
    <jsp:param value="My lessons" name="title"/>
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
                My lessons
            </h1>
        </section>
        <!-- main content -->
        <section class="content container-box">
            <div class="row">
                <!-- My upcoming lessons -->
                <div class="col-md-12 col-sm-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">My upcoming lessons</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                        class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <c:if test="${empty myUpcomingLessons}">
                                    <div class="alert alert-info col-sm-4 col-sm-offset-4">
                                        <h4><i class="icon fa fa-info"></i>No lessons</h4>
                                        You have no lessons to give.
                                    </div>
                                </c:if>
                                <c:if test="${not empty myUpcomingLessons}">
                                    <c:forEach var="lesson" items="${myUpcomingLessons}">
                                        <div class="col-md-4 col-sm-6 col-xs-12">
                                            <div class="info-box bg-blue-gradient">
                                                <div class="pull-right">
                                                    <form action="<c:url value="/tutor/lesson/remove/${lesson.id}" />"
                                                          method="POST">
                                                        <button class="btn btn-flat btn-danger"><i
                                                                class="fa fa-trash"></i></button>
                                                        </button>
                                                    </form>
                                                </div>
                                                <a href="<c:url value="/tutor/lesson/edit/${lesson.id}"/>"
                                                   style="cursor:pointer;" alt="Edit lesson ${lesson.name}">
                                                    <i class="info-box-icon fa fa-edit"></i>
                                                </a>
                                                <div class="info-box-content">
                                                    <span class="info-box-text">${lesson.course.shortName}</span>
                                                    <span class="info-box-text">${lesson.name}</span>
                                                            <span class="info-box-text">
                                                                <fmt:formatDate pattern="EEE. dd/MM HH:mm"
                                                                                value="${lesson.date}"/> - ${lesson.room.name}
                                                            </span>
                                                    <div class="progress">
                                                        <div class="progress-bar"
                                                             style="width: ${lesson.bookings.size()/lesson.maxParticipants*100}%"></div>
                                                    </div>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- My lesson history -->
                <div class="col-md-12 col-sm-12">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Lesson history</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                        class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <c:if test="${empty myPastLessons}">
                                    <div class="alert alert-info col-sm-4 col-sm-offset-4">
                                        <h4><i class="icon fa fa-info"></i>No lessons</h4>
                                        You have no lessons to give.
                                    </div>
                                </c:if>
                                <c:if test="${not empty myPastLessons}">
                                    <div class="col-sm-12">
                                        <table id="lesson-history-overview" class="table table-striped table-bordered"
                                               cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Date</th>
                                                <th>Duration (in minutes)</th>
                                                <th>Course</th>
                                                <th>Participants</th>
                                                <th>Room</th>
                                                <th>Backup room</th>
                                                <th>Actions</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>Name</th>
                                                <th>Date</th>
                                                <th>Duration</th>
                                                <th>Course</th>
                                                <th>Participants</th>
                                                <th>Room</th>
                                                <th>Backup room</th>
                                                <th>Actions</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:forEach var="lesson" items="${myPastLessons}">
                                                <tr data-toggle="tooltip" title="${lesson.description}">
                                                    <td>${lesson.name}</td>
                                                    <td><fmt:formatDate pattern="EEE. dd/MM/YYYY HH:mm"
                                                                        value="${lesson.date}"/></td>
                                                    <td>${lesson.duration}</td>
                                                    <td>${lesson.course.name}</td>
                                                    <td>
                                                        <div class="progress progress-xs">
                                                            <div class="progress-bar
                                                                        <c:set var="percentage" value="${lesson.bookings.size()/lesson.maxParticipants*100}"/>
                                                                            <c:choose>
                                                                                <c:when test="${percentage < 60}">progress-bar-success</c:when>
                                                                                <c:when test="${percentage > 60 and percentage < 100}">progress-bar-warning</c:when>
                                                                                <c:when test="${percentage == 100}">progress-bar-danger</c:when>
                                                                            </c:choose>"
                                                                 style="width: ${lesson.bookings.size()/lesson.maxParticipants*100}%">
                                                            </div>
                                                        </div>
                                                            ${lesson.bookings.size()}/${lesson.maxParticipants}</td>
                                                    <td>${lesson.room.name}</td>
                                                    <td>${lesson.backupRoom.name}</td>
                                                    <td>
                                                        <a class="btn btn-primary"
                                                           href="<c:url value="/tutor/lesson/info/${lesson.id}"/>"
                                                           style="cursor:pointer;" alt="Info for lesson ${lesson.name}">
                                                            <i class="fa fa-info"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
            </div>
</div>
<jsp:include page="../include/footer.jsp"/>
<script type="application/javascript">
    $(document).ready(function () {
        $("#lesson-history-overview").DataTable();
    });
</script>
</body>
</html>
