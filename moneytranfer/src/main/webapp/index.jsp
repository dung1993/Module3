<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/9/2022
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Currency Converted</h2>
<form action="/convert" method="post">
  <label>Rate:</label></br>
  <input  type="text" name="rate" placeholder="Rate" value="22000"></br>
<label>USD:</label></br>
<input type="text" name="usd" placeholder="USD" value="0"></br>
<input type="submit" id="submit" value="Converted">
</form>
</body>
</html>
