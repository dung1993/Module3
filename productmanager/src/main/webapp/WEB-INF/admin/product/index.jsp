<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Basic Tables | Zircos - Responsive Bootstrap 4 Admin Dashboard</title>
        <jsp:include page="/WEB-INF/admin/layout/headcss.jsp"/>

        <style>
            .row-search-form{
                justify-content: space-between;
            }
            .search-form{
                display: flex;
            }
        </style>
    </head>

    <body data-layout="horizontal">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Navigation Bar-->
            <jsp:include page="/WEB-INF/admin/layout/top-bar.jsp"></jsp:include>
                <!-- End Navigation Bar-->

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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Zircos</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                            <li class="breadcrumb-item active">Basic Tables</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Product List</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="demo-box p-2">
                                    <div class="row row-search-form">
                                        <div><h4 class="header-title">List Product</h4></div>
                                        <div>
                                            <form method="get" action="/index" class="search-form">
                                                <input type="text" name="kw" class="mr-1" value="${requestScope.kw}">
                                                <select name="idBrand" id="idBrand" class="form-control" class="mr-1" >
                                                    <option value="-1">All</option>
                                                    <c:forEach items="${applicationScope.brands}" var="brand">
                                                        <option value="${brand.getId()}" <c:if test="${requestScope.idBrand == brand.getId()}"> selected</c:if>>${brand.getName()}

                                                            </option>
                                                    </c:forEach>
                                                </select>
                                                <button>Search</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
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
                                                        <c:if test="${brand.getId() == brand.getIdBrand()}">
                                                            <td>${brand.getName()}</td>
                                                        </c:if>
                                                    </c:forEach>
                                                    <td><a href="/index?action=create"><i class="fa fa-add"></i></a>
                                                        <a href="/index?action=edit&id=${index.getId()}"><i class="fa fa-edit"></i> </a>
                                                        <a href="/index?action=delete&id=${index.getId()}"><i class="fa fa-remove" ></i></a>
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
                                                    <a href="/indexs?page=${currentPage - 1}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}" class="page-link"><i class="fa fa-angle-left"></i></a>
                                                </li>
                                            </c:if>
                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                <c:choose>
                                                    <c:when test="${currentPage eq i}">
                                                        <li class="page-item active">
                                                            <a href="#" class="page-link">${i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a href="/indexs?page=${i}&q=${requestScope.kw}&idBrand=${requestScope.idBrand}" class="page-link">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${currentPage lt noOfPages}">
                                                <li class="page-item">
                                                    <a href="/indexs?page=${currentPage + 1}&kw=${requestScope.kw}&idBrand=${requestScope.idBrand}" class="page-link"><i class="fa fa-angle-right"></i></a>
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

                    </div>
                    <!-- end container-fluid -->

                </div>
                <!-- end content -->

                

                <!-- Footer Start -->
                <jsp:include page="/WEB-INF/admin/layout/footer.jsp"></jsp:include>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->

        <jsp:include page="/WEB-INF/admin/layout/rightbar.jsp"/>

        <jsp:include page="/WEB-INF/admin/layout/footerjs.jsp">
            <jsp:param name="page" value="customer"/>
        </jsp:include>

    </body>

</html>