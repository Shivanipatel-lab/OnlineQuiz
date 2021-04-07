<%-- 
    Document   : editUser
    Created on : 17 Oct, 2020, 10:51:13 PM
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
        <title>Update User | QUIZPAD</title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

        <sql:update dataSource="${db}" var="result">
            UPDATE users SET name=?, email=?, password=? WHERE id=?;
            <sql:param value="${param.name}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.password}" />
            <sql:param value="${param.id}" />
        </sql:update>
            <%--${result}, ${param.QA}, ${param.QB}, ${param.QC},${param.QD},${param.quest},${param.correctAns}, ${param.id},--%>
            <c:if test="${sessionScope.sType == 0}">
                <c:redirect url="sDashboard.jsp" />
            </c:if>
            <c:if test="${sessionScope.sType == 1}">
                <c:redirect url="mDashboard.jsp" />
            </c:if>
            <c:if test="${sessionScope.sType == 2}">
                <c:redirect url="aDashboard.jsp" />
            </c:if>
    </body>
</html>
