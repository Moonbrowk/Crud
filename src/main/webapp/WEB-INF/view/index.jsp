<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
        <%@include file="/resources/users.css"%>
    </style>
</head>
<body>
<h1>Hello World!</h1>

<a href="<c:url value="/welcome" />">Welcome page</a>
<br>
<a href="<c:url value="/users?pagesPer=5" />">Users page</a>


</body>
</html>
