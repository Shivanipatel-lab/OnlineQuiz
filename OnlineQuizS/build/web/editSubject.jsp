<%-- 
    Document   : editSubject
    Created on : 17 Oct, 2020, 10:25:04 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${sessionScope.sType == 0}">
    <c:redirect url="index.jsp" />
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Subject | QUIZPAD</title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

        <sql:update dataSource="${db}" var="result">
            UPDATE subject SET name=?, moderator=? WHERE id=?;
            <sql:param value="${param.name}" />
            <sql:param value="${param.moderator}" />
            <sql:param value="${param.id}" />
        </sql:update>
            <%--${result}, ${param.QA}, ${param.QB}, ${param.QC},${param.QD},${param.quest},${param.correctAns}, ${param.id},--%>
            <c:redirect url="aDashboard.jsp" />
    </body>
</html>
