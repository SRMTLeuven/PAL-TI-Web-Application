<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:if test="${param.title == 'Login'}">
    <script src="<c:url value="/resources/login.js"/>"></script>
    <script>
        $( function () {
            $( 'input' ).iCheck( {
                checkboxClass : 'icheckbox_square-blue' ,
                radioClass    : 'iradio_square-blue' ,
                increaseArea  : '20%' // optional
            } );
        } );
    </script>
</c:if>