<%-- 
    Document   : logout
    Created on : 29 Sep, 2020, 7:49:34 PM
    Author     : welcome
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:remove var="sName" />
<c:remove var="sType" />

<c:redirect url="index.jsp" />