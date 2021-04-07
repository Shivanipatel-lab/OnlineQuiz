<%-- 
    Document   : sDashboard
    Created on : 8 Oct, 2020, 7:06:07 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${empty sessionScope.sName}">
    <c:redirect url="index.jsp" />
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <link rel="stylesheet" href="css/main.css" />
        
        <title>Student Dashboard | QUIZPAD</title>
        
        <style>
            body {
                background-image: url('images/image4.jpg');
                background-size: 100% auto;
                color: white;
            }
            #main {
                display: block;
            }
            #subjects {
                display: none;
                width: 96%;
                height: auto;
            }
            #subject {
                width: 100px;
                height: 75px;
                color: white;
                padding: 10px;
                margin: 50px;
                border: 0;
            }
            #subjects h3 {
                color: black;
            }
            #quizresults {
                display: none;
            }
        </style>
        
    </head>
    <body>
        <div class="header">
            <ul>
                <button onclick="home()">Home</button>
                <button onclick="subjects()">Subjects</button>
                <button onclick="quizresults()">Quiz Results</button>
                <button onclick="window.location.href='logout.jsp'">Logout</button>
            </ul>
        </div>

        <div id="main">
            <h2>Welcome ${sessionScope.sName}</h2>
        </div>

        <div id="subjects">
            <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

            <sql:query dataSource="${db}" var="subjects">
                SELECT * FROM `subject`;
            </sql:query>

            <c:forEach var="row" items="${subjects.rows}">

                <div id="subject" style="display: inline-block;">
                    <form action="quizpad.jsp" method="post" id="login">
                        <h2>${row.name}</h2>
                        <input type="hidden" value="${row.id}" name="subject"/>
                        Level: 
                        <select name="level">
                            <option value="1">Easy</option>
                            <option value="2">Medium</option>
                            <option value="3">Hard</option>
                        </select>
                        <input type="submit" value="Take Quiz" class="submit">
                    </form>
                </div>

            </c:forEach>   
        </div>

        <div id="quizresults">
            <sql:query dataSource="${db}" var="quizresult">
                SELECT `student` AS student, `subject` AS subject, `level`, `date` FROM `quizresults` where student = 1 ORDER BY `id` DESC;
            </sql:query>

            <table width = "60%">
                <tr>
                    <th>Subject</th>
                    <th>Level</th>
                    <th>Score</th>
                    <th>Date</th>
                </tr>

                <c:forEach var="qrrows" items="${quizresult.rows}">
                    <tr>
                    <td> ${qrrows.subject} </td>
                    <td> ${qrrows.level} </td>
                    <td> ${qrrows.score} </td>
                    <td> ${qrrows.date} </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <script>
            function home() {
                $('#main').css('display', 'block');
                $('#subjects').css('display', 'none');
                $('#quizresults').css('display', 'none');
            }
            function subjects() {
                $('#subjects').css('display', 'block');
                $('#main').css('display', 'none');
                $('#quizresults').css('display', 'none');
            }
            function quizresults() {
                $('#quizresults').css('display', 'block');
                $('#subjects').css('display', 'none');
                $('#main').css('display', 'none');
            }
        </script>
    </body>
</html>