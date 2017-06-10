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


<a href="<c:url value="/" />">Back to Index page</a>



<!-- User page List -->

<c:if test="${!empty users}">
    <table class="table1">
        <tr>
            <td colspan="3" class="title"><b>List of Users with pagination</b></td>
            <td></td>
            <td  class="blocks">Users per page</td>
            <td colspan="2">

                <!-- PagesPer select -->

                <c:url value="/users" var="pagesCount"/>
                <form:form action="${pagesCount}">
                    <select name="pagesPer">
                        <option value="5" <c:if test="${selectedPages == 5}">selected="selected"</c:if>>5</option>
                        <option value="10" <c:if test="${selectedPages == 10}">selected="selected"</c:if>>10</option>
                        <option value="30" <c:if test="${selectedPages ==30}">selected="selected"</c:if>>30</option>
                        <option value="50" <c:if test="${selectedPages ==50}">selected="selected"</c:if>>50</option>
                    </select>
                    <input type="submit" value="<spring:message text="Refresh"/>" class="button"/>
                </form:form>
            </td>
        </tr>
        <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="120">Age</th>
            <th width="120">IsAdmin</th>
            <th width="120">Last Update</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr class="tr1">
                <td>${user.id}</td>
                <td align="left"><a href="<c:url value="/userdata/${user.id}"/> ">${user.name}</a></td>
                <td>${user.age}</td>
                <td>
                        ${user.admin}</td>
                <td>${user.dateTime}</td>
                <td><a href="<c:url value='/edit/${user.id}'/>?pagesPer=${selectedPages}">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
        <tr>
        <tr>
            <td colspan="7" align="right">

                <!-- Pagination -->

                <div id="pagination">
                    <c:url value="/users" var="prev">
                        <c:param name="page" value="${page-1}"/>
                    </c:url>
                    <c:if test="${page > 1}">
                        <a href="<c:out value="${prev}" />&pagesPer=${selectedPages}" class="pn prev">Prev</a>
                    </c:if>
                    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                        <c:choose>
                            <c:when test="${page == i.index}">
                                <span class="page">${i.index}</span>
                            </c:when>
                            <c:otherwise>
                                <c:url value="/users" var="url">
                                    <c:param name="page" value="${i.index}"/>
                                </c:url>
                                <c:if test="${page == i.index}">
                                    <a href='<c:out value="${url}" />'><h1>${i.index}</h1></a>
                                </c:if>
                                <a href='<c:out value="${url}" />&pagesPer=${selectedPages}'>${i.index}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:url value="/users" var="next">
                        <c:param name="page" value="${page + 1}"/>
                    </c:url>
                    <c:if test="${page + 1 <= maxPages}">
                        <a href='<c:out value="${next}" />&pagesPer=${selectedPages}' class="pn next">Next</a>
                    </c:if>
                </div>
            </td>
        <tr>
        </tr>
    </table>
</c:if>


<table>
<tr>
    <td class="blocks">

        <!-- add User -->

        <c:url var="addAction" value="/users/add"/>
        <form:form action="${addAction}" commandName="user">
            <table class="table1">
                <tr>
                    <td colspan="2" class="title"><b>Add User</b></td>
                </tr>
                <c:if test="${!empty user.name}">
                    <tr>
                        <td align="left">
                            <form:label path="id">
                                <spring:message text="ID"/>
                            </form:label>
                        </td>
                        <td align="left">
                            <form:input path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td align="left">
                        <form:label path="name">
                            <spring:message text="Name"/>
                        </form:label>
                    </td>
                    <td align="left">
                        <form:input path="name"/>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <form:label path="age">
                            <spring:message text="Age"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="age"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <spring:message text="isAdmin"/>
                    </td>
                    <td>
                        <form:radiobutton path="admin" value="true" label="Yes" id="admin"/>
                        <form:radiobutton path="admin" value="false" label="No" id="admin" disabled="false"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td colspan="2" align="center">
                        <c:if test="${!empty user.name}">
                            <input type="submit"
                                   value="<spring:message text="Edit User"/>" class="button"/>
                        </c:if>
                        <c:if test="${empty user.name}">
                            <input type="submit" value="<spring:message text="Add User"/>" class="button"/>
                        </c:if>
                    </td>
                </tr>
            </table>
        </form:form>
    </td>

    <td class="blocks">
        <!-- Search -->


        <c:url var="goSearch" value="/search/"/>
        <form:form action="${goSearch}" method="post">
            <table class="table1">
                <tr>
                    <td class="title">
                        <b>Search User name</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="search"/>
                        <input type="submit" value="<spring:message text="Search"/>" class="button"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </td>
</tr>
</table>
</body>
</html>