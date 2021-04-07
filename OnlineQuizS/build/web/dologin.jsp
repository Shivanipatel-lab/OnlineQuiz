<%-- 
    Document   : login
    Created on : 28 Sep, 2020, 8:02:03 PM
    Author     : welcome
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${sessionScope.sType == 0}">
    <c:redirect url="sDashboard.jsp" />
</c:if>
<c:if test="${sessionScope.sType == 1}">
    <c:redirect url="mDashboard.jsp" />
</c:if>
<c:if test="${sessionScope.sType == 2}">
    <c:redirect url="aDashboard.jsp" />
</c:if>

<title>QUIZPAD</title>

<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

<sql:query dataSource="${db}" var="result">
    select * from users where email = ? and password = ?;
    <sql:param value="${param.username}" />
    <sql:param value="${param.password}" />
</sql:query>

    <c:set var="rsRows" value="${result.rows}" />

    <c:choose>
        <c:when test="${empty rsRows[0]}">
            <jsp:forward page="index.jsp">
                <jsp:param name="res" value="Username is Incorrect" />
            </jsp:forward>
        </c:when>
        <c:otherwise>
            <c:set var="sName" value="${param.username}" scope="session" />
            <c:set var="sType" value="${rsRows[0].type}" scope="session" />
            <c:set var="sID" value="${rsRows[0].id}" scope="session" />
            <c:choose>
                <c:when test="${rsRows[0].type == 0}">
                    <script>window.location.href='sDashboard.jsp'</script>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${rsRows[0].type == 1}">
                            <script>window.location.href='mDashboard.jsp'</script>
                        </c:when>
                        <c:otherwise>
                            <script>window.location.href='aDashboard.jsp'</script>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>