<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <style>
        <%@include file="/resources/users.css"%>
    </style>
</head>
<body>
<h1>User Searched</h1>

<c:if test="${!empty searchList}">
    <table class="table1">
        <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="120">Age</th>
            <th width="120">IsAdmin</th>
            <th width="120">Last Update</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${searchList}" var="user">
            <tr class="tr1">
                <td>${user.id}</td>
                <td align="left"><a href="<c:url value="/userdata/${user.id}"/> ">${user.name}</a></td>
                <td>${user.age}</td>
                <td>
                        ${user.admin}</td>
                <td>${user.dateTime}</td>
                <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<br>
<a href="<c:url value="/users"/>">Back to Users page</a>

</body>
</html>