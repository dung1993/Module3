<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="container">
    <h1>Customer manager</h1>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Brand Name</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.customers}" var="customer">
            <tr>
                <th scope="row">${customer.getId()}</th>
                <td>${customer.getName()}</td>
                <td>${customer.getPrice()}</td>
                <td>${customer.getQuantity()}</td>
                <td>${customer.getbrandName()}</td>
                <td><a href="/customers?action=create"><i class="fa fa-add"></i></a>
                    <a href="/customers?action=edit&id=${customer.getId()}"><i class="fa fa-edit"></i> </a>
                    <a href="/customer?action=remove&id=${customer.getId()}"><i class="fa fa-remove"></i></a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>