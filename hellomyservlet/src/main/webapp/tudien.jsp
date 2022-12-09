<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/9/2022
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/tudien" method="post">
    <label>Key </label>
    <input type="text" name="keyword">
    <label>Result: ${requestScope.kq}</label>
    <button type="submit"> Translate</button>

    <c:if test="${requestScope.keys != null}">
        <ul>
            <c:forEach items="${requestScope.keys}" var="item">
                <li>${item}</li>
            </c:forEach>
        </ul>
    </c:if>
</form>
</body>
</html>
