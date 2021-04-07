<%-- 
    Document   : questionsupdate
    Created on : 30 Sep, 2020, 10:27:34 PM
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
        <title>Update Question | QUIZPAD</title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

        <sql:update dataSource="${db}" var="result">
            UPDATE quiz SET quest=?, QA=?, QB=?, QC=?, QD=?, correctAns=?, level=? WHERE id=?;
            <sql:param value="${param.quest}" />
            <sql:param value="${param.QA}" />
            <sql:param value="${param.QB}" />
            <sql:param value="${param.QC}" />
            <sql:param value="${param.QD}" />
            <sql:param value="${param.correctAns}" />
            <sql:param value="${param.level}" />
            <sql:param value="${param.id}" />
        </sql:update>
            <%--${result}, ${param.QA}, ${param.QB}, ${param.QC},${param.QD},${param.quest},${param.correctAns}, ${param.id},--%>
            <jsp:forward page="mDashboard.jsp" />
    </body>
</html>