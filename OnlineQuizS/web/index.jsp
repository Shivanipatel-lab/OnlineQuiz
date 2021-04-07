<%-- 
    Document   : index
    Created on : 12 Oct, 2020, 10:05:44 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" href="css/main.css" />

    <title>Home | QUIZPAD</title>

    <style type="text/css">
        body {
            text-align: center;
            background-image: url('images/bg.jpg');
            background-repeat: no-repeat;
            background-size: 100% auto;
            color: white;
            background-color: none;
        }
        div {
            display: flex;
            justify-content: space-around;
        }
        a {
            font-weight: bolder;
            font-size: 20px;
            color: white;
        }
        ul {
            list-style-type: none;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="header">
        
    </div>
    <div>
        <img src="images/logo1.png">
    </div>
    <div>
        <ul>
            <li>FEATURES</li><br><br>
            <li>One stop solution for taking quizes!!!!!</li><br>
            <li>Fully Functional Testing Environment</li><br>
            <li>View graded results & selected answers instantly</li><br>
            <li>Randomize Questions & answers</li><br>
            <li>Test availability dates</li><br>
            <li>Admin | Moderator | Student</li><br>
            <li>Easily manage quizes</li><br><br><br>
            <li>LET'S START TO NEXT STEP AND CHECK OUR KNOWLEDGE</li>
        </ul>
    </div>
    <a class="submit" href="login.jsp" style="text-decoration: none;">Login</a>
</body>
</html>
