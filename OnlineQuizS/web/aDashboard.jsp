<%-- 
    Document   : aDashboard
    Created on : 12 Oct, 2020, 11:33:29 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <link rel="stylesheet" href="css/main.css" />

        <title>Admin Dashboard | QUIZPAD</title>

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
            table input {
                color: black;
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
            #addsubject {
                display: none;
            }
            #subjects {
                display: none;
            }
            #addmoderator {
                display: none;
            }
            #moderators {
                display: none;
            }
        </style>

    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />
        <div class="header">
            <ul>
                <button onclick="main()">Home</button>
                <button onclick="addsubject()">Add Subject</button>
                <button onclick="subjects()">Subjects</button>
                <button onclick="addmoderator()">Add Moderator</button>
                <button onclick="moderators()">Moderators</button>
                <button onclick="window.location.href='logout.jsp'">Logout</button>
            </ul>
        </div>

        <div id="main">
            <h2>Welcome ${sessionScope.SName}</h2>
        </div>

        <div id="addsubject">
            <center>
                <form action="" method="post" id="login">
                      
                    <h2>Add Subject</h2>

                    <input type="text" name="name" placeholder="Name">
                    <input type="number" name="moderator" placeholder="Moderator" value="2">
                    <input type="submit" value="Add Subject" class="submit">
                </form>
            </center>

             <c:if test="${!empty param.moderator}">
                <sql:update dataSource="${db}" var="result1">
                    INSERT INTO `subject`(`name`, `moderator`) VALUES (?, ?);
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.moderator}" />
                </sql:update>
            </c:if>
        </div>

        <div id="subjects">
            <sql:query dataSource="${db}" var="result">
                SELECT * from subject;
            </sql:query>

            <table width = "100%" class="blueTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Moderator</th>
                        <th>Tools</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var = "row" items = "${result.rows}">
                        <tr>
                            <form id="login subjects" action="editSubject.jsp" method="post">
                                <input type="hidden" value="${row.id}" name="id" />
                                <td> <input type="text" value="${row.name}" name="name" /> </td>
                                <td> <input type="number" value="${row.moderator}<c:if test='${empty row.moderator}'>2</c:if>" name="moderator" /> </td>
                                <td>
                                    <button type="submit">Edit</button>
                                    <button type="button" onclick=" window.location.href = 'deleteSubject.jsp?id=${row.id}' " class="submit">Delete</button> 
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div id="addmoderator">
            <center>
                <form action="" method="post" id="login">
                      
                    <h2>Add Moderator</h2>

                    <input type="hidden" name="type" value="1">
                    <input type="text" name="name" placeholder="Name">
                    <input type="email" name="email" placeholder="E-Mail">
                    <input type="text" name="password" placeholder="Password">
                    <input type="submit" value="Add Moderator" class="submit">
                </form>
            </center>

             <c:if test="${!empty param.email}">
                <sql:update dataSource="${db}" var="result3">
                    INSERT INTO `users`(`name`, `email`, `password`, `type`) VALUES (?, ?, ?, ?);
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.password}" />
                    <sql:param value="${param.type}" />
                </sql:update>
            </c:if>
        </div>

        <div id="moderators">
            <sql:query dataSource="${db}" var="result2">
                SELECT * from users where type=1;
            </sql:query>

            <table width = "100%" class="blueTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Username</th>
                        <th>password</th>
                        <th>Tools</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var = "row2" items = "${result2.rows}">
                        <tr>
                            <form id="login" action="editUser.jsp" method="post">
                                <input type="hidden" value="${row2.id}" name="id" />
                                <input type="hidden" value="${row2.type}" name="type" />
                                <td> <input type="text" value="${row2.name}" name="name" /> </td>
                                <td> <input type="text" value="${row2.email}" name="email" /> </td>
                                <td> <input type="text" value="${row2.password}" name="password" /> </td>
                                <td>
                                    <button type="submit" class="submit">Edit</button>
                                    <button type="button" onclick="window.location.href = 'deleteUser.jsp?id=${row2.id}'" class="submit">Delete</button> 
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script type="text/javascript">

        function main() {
            $("#main").show();
            $("#addmoderator").hide();
            $("#moderators").hide();
            $("#addsubject").hide();
            $("#subjects").hide();
        }
        function addsubject() {
            $("#addsubject").show();
            $("#main").hide();
            $("#addmoderator").hide();
            $("#moderators").hide();
            $("#subjects").hide();
        }
        function subjects() {
            $("#subjects").show();
            $("#main").hide();
            $("#addmoderator").hide();
            $("#moderators").hide();
            $("#addsubject").hide();
        }
        function addmoderator() {
            $("#addmoderator").show();
            $("#main").hide();
            $("#moderators").hide();
            $("#addsubject").hide();
            $("#subjects").hide();
        }
        function moderators() {
            $("#moderators").show();
            $("#main").hide();
            $("#addmoderator").hide();
            $("#addsubject").hide();
            $("#subjects").hide();
        }

        </script>
    </body>
</html>
