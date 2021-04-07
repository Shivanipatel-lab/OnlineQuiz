<%-- 
    Document   : delete
    Created on : 30 Sep, 2020, 10:27:50 PM
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
        <title>Delete Question | QUIZPAD</title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

        <sql:update dataSource="${db}" var="result">
            delete from quiz where id = ?;
            <sql:param value="${param.id}" />
        </sql:update>

        <jsp:forward page="questions.jsp" />
    </body>
</html>