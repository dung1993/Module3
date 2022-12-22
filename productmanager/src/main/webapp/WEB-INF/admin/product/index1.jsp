<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/admin/layout/headcss.jsp"/>
</head>

<body>

<!-- Begin page -->
<div id="wrapper">

    <!-- Topbar Start -->
    <jsp:include page="/WEB-INF/admin/layout/top-bar.jsp"/>
    <!-- end Topbar -->

    <!-- ========== Left Sidebar Start ========== -->
    <jsp:include page="/WEB-INF/admin/layout/left-bar.jsp"/>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Gear Store</a></li>
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                    <li class="breadcrumb-item active">List Products</li>
                                </ol>
                            </div>
                            <h4 class="page-title">List Products</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="demo-box p-2">
                            <div class="row row-search-form" style="justify-content: space-between">
                                <div><h4 class="header-title">Search Products</h4></div>
                                <div>
                                    <form method="get" action="/products" class="search-form" style="display: flex">
                                        <input type="text" name="kw" class="mr-1" value="${requestScope.kw}" style="margin-left: 15px">
                                        <select name="idBrand" id="idBrand" class="form-control" class="mr-1" style="margin-left: 15px">
                                            <option value="-1">All</option>
                                            <c:forEach items="${applicationScope.brands}" var="brand">
                                                <option value="${brand.getId()}"
                                                        <c:if test="${requestScope.idBrand == brand.getId()}"> selected</c:if>
                                                >
                                                        ${brand.getName()}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <button class="btn-submit" style="margin-left: 15px; border-radius: 5px">Search</button>
                                    </form>
                                </div>
                            </div>
                            <div class="table-responsive" style="padding: 15px">
                                <table class="table m-0">

                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Brand Name</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.products}" var="product">
                                        <tr>
                                            <th scope="row">${product.getId()}</th>
                                            <td>${product.getName()}</td>
                                            <td>${product.getPrice()}</td>
                                            <td>${product.getQuantity()}</td>

                                            <c:forEach items="${applicationScope.brands}" var="brand">
                                                <c:if test="${brand.getId() == product.getIdBrand()}">
                                                    <td>${brand.getName()}</td>
                                                </c:if>
                                            </c:forEach>
                                            <td><a href="/products?action=create"><i class="fa fa-add"></i></a>
                                                <a href="/products?action=edit&id=${product.getId()}"><i
                                                        class="fa fa-edit"></i> </a>
                                                <a href="/products?action=delete&id=${product.getId()}"><i
                                                        class="fa fa-remove"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <div>
                                <ul class="pagination pagination-split float-right mb-0">
                                    <c:if test="${currentPage != 1}">
                                        <li class="page-item">
                                            <a href="/products?page=${currentPage - 1}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}"
                                               class="page-link"><i class="fa fa-angle-left"></i></a>
                                        </li>
                                    </c:if>
                                    <c:if test="${(requestScope.currentPage -2 ) >= 1}">
                                        <li class="page-item">
                                            <a href="/products?page=${currentPage - 2}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}" class="page-link">${requestScope.currentPage - 2}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${(requestScope.currentPage -1 ) >= 1}">
                                        <li class="page-item">
                                            <a href="/products?page=${currentPage - 1}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}" class="page-link">${requestScope.currentPage - 1}</a>
                                        </li>
                                    </c:if>
                                    <li class="page-item active">
                                        <a href="#" class="page-link">${requestScope.currentPage}</a>
                                    </li>
                                    <c:if test="${(requestScope.currentPage + 1) <= requestScope.noOfPages}">
                                        <li class="page-item">
                                            <a href="/products?page=${currentPage + 1}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}" class="page-link">${requestScope.currentPage + 1}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${(requestScope.currentPage + 2 )<= requestScope.noOfPages}">
                                        <li class="page-item">
                                            <a href="/products?page=${currentPage + 2}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}" class="page-link">${requestScope.currentPage + 2}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage lt noOfPages}">
                                        <li class="page-item">
                                            <a href="/products?page=${currentPage + 1}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}"
                                               class="page-link"><i class="fa fa-angle-right"></i></a>
                                        </li>
                                    </c:if>

                                </ul>
                            </div>
                        </div>
                        <!-- end card-box -->
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->

            </div> <!-- container -->

        </div> <!-- content -->

        <!-- Footer Start -->

        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>
<!-- END wrapper -->

<jsp:include page="/WEB-INF/admin/layout/right-bar.jsp"/>

<jsp:include page="/WEB-INF/admin/layout/scripts.jsp"/>
</body>
</html>