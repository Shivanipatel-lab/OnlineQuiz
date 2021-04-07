<%-- 
    Document   : questions
    Created on : 30 Sep, 2020, 10:02:44 PM
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
        
        <link rel="stylesheet" href="css/main.css" />
        
        <title>Questions | QUIZPAD</title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

        <sql:query dataSource="${db}" var="result">
            select * from quiz;
        </sql:query>

        <table width = "100%">
            <tr>
                <th>Question</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
                <th>Correct Option</th>
                <th>Tools</th>
            </tr>

                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <form id="login" action="questionsupdate.jsp" method="post">
                            <input type="hidden" value="${row.id}" name="id" />
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
            </form>
        </table>
        <p class="submit" onclick="window.location.href = 'questForm.jsp'" style="display: inline-block;">Previous Page</p>
    </body>
</html>