<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title> User Data</title>

    <style>
        <%@include file="/resources/users.css"%>
    </style>

</head>
<body>
<br>
<table class="table1">
    <tr>
        <td><h1>${user.name}</h1></td>
    </tr>
    <tr>
        <td>User detail</td>
    </tr>
    <tr>
        <td height="58"></td>
    </tr>
    <tr>
        <td>ID : ${user.id}</td>
    </tr>
    <tr>
        <td>Age : ${user.age}</td>
    </tr>
    <tr>
        <td>Last Update : ${user.dateTime}</td>
    </tr>
    <tr>
        <td height="300">Description</td>
    </tr>
</table>


<a href="<c:url value="/users"/>">Back to Users page</a>
</body>
</html>