<%-- 
    Document   : student
    Created on : 1 Oct, 2020, 9:30:56 AM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty sessionScope.sType}">
    <jsp:forward page="index.jsp" />
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/main.css" />

        <title>QUIZPAD</title>
    </head>
    <body>

        <fmt:parseNumber var="subject" value="${param.subject}" type="number" />
        <fmt:parseNumber var="level" value="${param.level}" type="number" />

        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/onlinequiz" user="root" password="" var="db" />

        <sql:query dataSource="${db}" var="result">
            select * from quiz where subject=? and level=? LIMIT 10;
            <sql:param value="${param.subject}" />
            <sql:param value="${param.level}" />
        </sql:query>

        <c:set var="row" value= "${result.rows}" />
        <c:set var="sCount" value="0" scope="session" />

    <center>
        <form id="login" action="quizpad.jsp" method="post">

            <table border = "1" width = "100%">

                <c:choose>
                    <c:when test="${empty param.index}">
                        <c:set var="index" value="0" />
                        <c:set var="sCount" value="0" />
                        <tr>
                            <td width="30%"> Question: </td>
                            <td width="70%"> 
                                ${row[index].quest}
                            </td>
                        </tr>
                        <tr>
                            <td> A: <input type="radio" name="a" value= "A" /></td>
                            <td> ${row[index].QA} </td>
                        </tr> 
                        <tr>
                            <td> B: <input type="radio" name="a" value="B" /></td>
                            <td> ${row[index].QB} </td>
                        </tr>
                        <tr>
                            <td> C: <input type="radio" name="a" value="C" /></td>
                            <td> ${row[index].QC} </td>
                        </tr>

                        <tr>
                            <td> D: <input type="radio" name="a" value="D" /> </td>
                            <td> ${row[index].QD} </td>
                        </tr>
                        <tr>
                            <input type="hidden" name="subject" value="${subject}" />
                            <input type="hidden" name="level" value="${level}" />
                            <input type="hidden" name="correctAns" value="${row[index].correctAns}" />
                            <input type="hidden" name="index" value="${index + 1}" />
                            <%--<input type="submit" value="Submit" class="submit" />--%>
                            <p class="submit" onclick="document.getElementById('login').submit();">Next</p>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:set var="index" value="${param.index}" />
                        <c:if test="${!empty param.a}">
                            <c:choose>
                                <c:when test="${param.a==row[index-1].correctAns}">
                                    <c:set var="sCount" value="${param.sCount+1}" />
                                    <p>Previous Answer: Correct; Score : <c:if test="${empty sCount}">0</c:if>${sCount}</p>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="sCount" value="${param.sCount}" />
                                    <p>Previous Answer: Incorrect; Score : <c:if test="${empty sCount}">0</c:if>${sCount}</p>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:choose>
                            <c:when test="${!empty row[index]}">

                                <tr>
                                    <td width="30%"> Question: </td>
                                    <td width="70%"> 
                                        ${row[index].quest}
                                    </td>
                                </tr>
                                <tr>
                                    <td> A: <input type="radio" name="a" value="A" /></td>
                                    <td> ${row[index].QA} </td>
                                </tr> 
                                <tr>
                                    <td> B: <input type="radio" name="a" value="B" /></td>
                                    <td> ${row[index].QB} </td>
                                </tr>
                                <tr>
                                    <td> C: <input type="radio" name="a" value="C" /></td>
                                    <td> ${row[index].QC} </td>
                                </tr>

                                <tr>
                                    <td> D: <input type="radio" name="a" value="D" /> </td>
                                    <td> ${row[index].QD} </td>
                                </tr>
                                <input type="hidden" name="subject" value="${subject}" />
                                <input type="hidden" name="level" value="${level}" />
                                <input type="hidden" name="index" value="${index + 1}" /> 
                                <input type="hidden" name="correctAns" value="${row[index].correctAns}" />
                                <input type="hidden" name="sCount" value="${sCount}" /><br>
                                <p class="submit" onclick="document.getElementById('login').submit();">Submit</p>
                            </c:when>
                            <c:otherwise>
                                Quiz Completed!<br> 
                                You scored <c:if test="${empty sCount}">0</c:if>${sCount}<br>
                                    <p onclick="window.location.href = 'sDashboard.jsp'" class="submit">Home Page</p>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </table>
        </form>
    </center>
</body>
</html>
