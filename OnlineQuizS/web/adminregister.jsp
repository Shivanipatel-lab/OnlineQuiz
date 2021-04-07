<%-- 
    Document   : adminregister
    Created on : 29 Sep, 2020, 10:36:00 PM
    Author     : welcome
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link rel="stylesheet" href="css/main.css" />
        <title>QUIZPAD</title>
    </head>
    <body style="overflow: hidden;">
    <center>
        <h1>Register</h1>
        <form action="register.jsp" method="post" style="margin-top: 0;" id="login">
            Name :<input type="text" name="name" style="margin-left: 30px;"/><br>
            Email ID :<input type="text" name="email" /><br>
            Password :<input type="password" name="password" />
            <c:if test="${empty sessionScope.sType}">
                <input type="hidden" name="type" value="0"/>
            </c:if>
            <c:if test="${sessionScope.sType == 1}" >
                <input type="hidden" name="type" value="0" />
            </c:if>
            <c:if test="${sessionScope.sType == 2}" >
                <br>Role : <select name="type">
                    <option value="0">User</option>
                    <option value="1">Moderator</option>
                </select>
            </c:if><br><br>
            <p class="submit" onclick="document.getElementById('login').submit();"> Register </p>
            <p onclick="window.location.href = 'questForm.jsp'" class="submit" style="margin-top: 10px;">Return</p>
            <div id="result">
                ${param.res}
            </div>
        </form>
    </center>
</body>
</html>