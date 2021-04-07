<%-- 
    Document   : register
    Created on : 29 Sep, 2020, 7:39:40 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<title>QUIZPAD</title>

<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

<sql:update dataSource="${db}" var="result">
    insert into users(name,email,password,type) values (?,?,?,?);
    <sql:param value="${param.name}" />
    <sql:param value="${param.email}" />
    <sql:param value="${param.password}" />
    <sql:param value="${param.type}" />
</sql:update>

<c:redirect url="index.jsp" />