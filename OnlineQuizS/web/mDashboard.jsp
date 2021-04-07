<%-- 
    Document   : mDashboard
    Created on : 12 Oct, 2020, 11:33:11 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page buffer="20kb"%>

<c:if test="${empty sessionScope.sName}">
    <c:redirect url="index.jsp" />
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <link rel="stylesheet" href="css/main.css" />

        <title>Moderator Dashboard | QUIZPAD</title>

        <style type="text/css">
            body {
                background-image: url('images/image4.jpg');
                background-size: 100% auto;
                color: white;
            }
            form {
                margin: 0;
                padding: 5px;
            }
            input {
                margin: 0;
                padding: 0;
                width: 80%;
                background-color: transparent;
                overflow: auto;
                color: white;
            }
            table.blueTable {
              border: 1px solid #1C6EA4;
              background-color: #EEEEEE;
              width: 100%;
              text-align: left;
              border-collapse: collapse;
            }
            table.blueTable td, table.blueTable th {
              border: 1px solid #AAAAAA;
              padding: 3px 2px;
            }
            table.blueTable tbody td {
              font-size: 13px;
            }
            table.blueTable tr:nth-child(even) {
              background: #D0E4F5;
            }
            table.blueTable thead {
              background: #1C6EA4;
              background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
              background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
              background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
              border-bottom: 2px solid #444444;
            }
            table.blueTable thead th {
              font-size: 15px;
              font-weight: bold;
              color: #FFFFFF;
              border-left: 2px solid #D0E4F5;
              padding: 0 10px;
            }
            table.blueTable thead th:first-child {
              border-left: none;
            }
            .submit {
                padding: 5px;
                width: auto;
                border: 0;
                border-radius: 0;
                background-color: cyan;
                color: black;
            }
            .submit:hover {
                color: cyan;
                background-color: black;
            }
            td:last-of-type button.submit {
                display: inline-block;
            }
            #main {
                display: block;
            }
            #addquestion {
                display: none;
            }
            #questions {
                display: none;
            }
            #addstudent {
                display: none;
            }
            #quizresults {
                display: none;
            }
        </style>

    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />
        <div class="header">
            <ul>
                <button onclick="home()">Home</button>
                <button onclick="addquestion()">Add Question</button>
                <button onclick="questions()">Questions</button>
                <button onclick="addstudent()">Add Student</button>
                <button onclick="quizresults()">Student Quiz Results</button>
                <button onclick="window.location.href='logout.jsp'">Logout</button>
            </ul>
        </div>

        <div id="main">
           <h2>Welcome ${sessionScope.sName}</h2> 
        </div>

        <div id="addquestion">

            <sql:query dataSource="${db}" var="result1">
                SELECT id from subject where moderator = ?;
                <sql:param value="${sessionScope.sID}" />
            </sql:query>

            <c:set var="id" value="${result1.rows}" />

            <center>
                <form action="" method="post" style="padding: 20px; width: 700px;">
                    <h2>Add Question</h2>
                    <input type="hidden" name="subject" value="${id[0].id}"><br>
                    Level: <input type="number" name="level" placeholder="Question Level"><br>
                    Quesiton: <input type="text" name="quest" placeholder="Question"><br>
                    Option A: <input type="text" name="QA" placeholder="Option A"><br>
                    Option B: <input type="text" name="QB" placeholder="Option B"><br>
                    Option C: <input type="text" name="QC" placeholder="Option C"><br>
                    Option D: <input type="text" name="QD" placeholder="Option D"><br>
                    Correct Option: <input type="text" name="correctAns" placeholder="Correct Option"><br>
                    <input type="submit" value="Add Question" class="submit">
                </form>
            </center>

            <c:if test="${!empty param.quest}">
                <sql:update dataSource="${db}" var="result2">
                    INSERT INTO quiz ( quest, QA, QB, QC, QD, correctAns, level, subject) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);
                    <sql:param value="${param.quest}" />
                    <sql:param value="${param.QA}" />
                    <sql:param value="${param.QB}" />
                    <sql:param value="${param.QC}" />
                    <sql:param value="${param.QD}" />
                    <sql:param value="${param.correctAns}" />
                    <sql:param value="${param.level}" />
                    <sql:param value="${param.subject}" />
                </sql:update>
            </c:if>

        </div>

        <div id="questions">

            <sql:query dataSource="${db}" var="result">
                SELECT quiz.id, quiz.quest, quiz.QA, quiz.QB, quiz.QC, quiz.QD, quiz.correctAns, quiz.level, subject.id AS subject FROM quiz RIGHT JOIN subject ON quiz.subject = subject.id WHERE subject.moderator = ${sessionScope.sID};
            </sql:query>

            <table width = "100%" class="blueTable">
                <thead>
                    <tr>
                        <th width="50">Level</th>
                        <th>Question</th>
                        <th>Option A</th>
                        <th>Option B</th>
                        <th>Option C</th>
                        <th>Option D</th>
                        <th width="50">Correct Option</th>
                        <th>Tools</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var = "row" items = "${result.rows}">
                        <tr>
                            <form id="login" action="questionsupdate.jsp" method="post">
                                <input type="hidden" value="${row.id}" name="id" />
                                <td> 
                                    <input type="text" value="${row.level}" name="level" />
                                </td>
                                <td> <input type="text" value="${row.quest}" name="quest" /> </td>
                                <td> <input type="text" value="${row.QA}" name="QA" /> </td>
                                <td> <input type="text" value="${row.QB}" name="QB" /> </td>
                                <td> <input type="text" value="${row.QC}" name="QC" /> </td>
                                <td> <input type="text" value="${row.QD}" name="QD" /> </td>
                                <td> <input type="text" value="${row.correctAns}" name="correctAns" /> </td>
                                <td>
                                    <button onclick="window.location.href = 'document.getElementById('login').submit();'" class="submit">Edit</button>
                                    <button onclick="window.location.href = 'delete.jsp?id=${row.id}'" class="submit">Delete</button> 
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div id="addstudent">
            <center>
                <form action="" method="post">
                      
                    <h2>Add Student</h2>

                    <input type="hidden" name="type" value="0">
                    <input type="text" name="name" placeholder="Name">
                    <input type="email" name="email" placeholder="E-Mail">
                    <input type="text" name="password" placeholder="Password">
                    <input type="submit" value="Add Student" class="submit">
                </form>
            </center>

             <c:if test="${!empty param.name}">
                <sql:update dataSource="${db}" var="result3">
                    INSERT INTO `users`(`name`, `email`, `password`, `type`) VALUES (?, ?, ?, ?);
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.password}" />
                    <sql:param value="${param.type}" />
                </sql:update>
            </c:if>
        </div>

        <div id="quizresults">
            
        </div>

        <script type="text/javascript">
            function home() {
                $('#main').css("display", "block");
                $('#questions').css("display", "none");
                $('#addquestion').css("display", "none");
                $('#addstudent').css("display", "none");
                $('#quizresults').css("display", "none");
            }

            function addquestion() {
                $('#addquestion').css("display", "block");
                $('#main').css("display", "none");
                $('#questions').css("display", "none");
                $('#addstudent').css("display", "none");
                $('#quizresults').css("display", "none");
            }
            function questions() {
                $('#questions').css("display", "block");
                $('#main').css("display", "none");
                $('#addquestion').css("display", "none");
                $('#addstudent').css("display", "none");
                $('#quizresults').css("display", "none");
            }
            function addstudent() {
                $('#addstudent').css("display", "block");
                $('#main').css("display", "none");
                $('#addquestion').css("display", "none");
                $('#questions').css("display", "none");
                $('#quizresults').css("display", "none");
            }
            function quizresults() {
                $('#quizresults').css("display", "block");
                $('#main').css("display", "none");
                $('#addquestion').css("display", "none");
                $('#questions').css("display", "none");
                $('#addstudent').css("display", "none");
            }
        </script>
    </body>
</html>
