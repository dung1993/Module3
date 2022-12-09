<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1><%= "Product Discount Calculator" %>
</h1>
<br/>
<form action="/display-discount" method="post">
    <label>Product Description:</label>
    <input type="text" name="Product Description" placeholder="Product Description"></br>
    <label>List Price:</label>
    <input type="text" name="List Price" placeholder="List Price"></br>
    <label>Discount Percent:</label>
    <input type="text" name="Discount Percent" placeholder="Discount Percent"></br>
    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>