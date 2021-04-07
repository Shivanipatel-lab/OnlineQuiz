<%-- 
    Document   : index
    Created on : 28 Sep, 2020, 8:00:33 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
    <head>
        <title>Login | QUIZPAD</title>
        <link rel="stylesheet" href="css/main.css" />

        <style type="text/css">
            body {
                background-image: url('images/image3.jpg');
                background-size: 100% auto;
                color: white;
            }
        </style>

    </head>
    <body style="height: 100%; ">
    <center>
        <h1>QUIZPAD</h1>
        <form id="login" action="dologin.jsp" method="post"> 
            <h1>Login</h1>
            Username :<input type="text" name="username" /><br>
            Password :<input type="password" name="password" /><br>
            <p class="submit" onclick="document.getElementById('login').submit();"> Sign in </p>
            <div id="result">
                ${param.res}
            </div>
        </form>
    </center>
</body>
</html>

