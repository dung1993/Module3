<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Form Elements | Zircos - Responsive Bootstrap 4 Admin Dashboard</title>
    <jsp:include page="/WEB-INF/admin/layout/headcss.jsp"></jsp:include>

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

    <div class="content-page" style="margin: 140px">
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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Forms</a></li>
                                    <li class="breadcrumb-item active">Form elements</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Edit Form</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <form class="form-horizontal" method="post">
                            <c:if test="${requestScope.message != null}">
                                <%--      <h1 style="display: none" class="alert">${requestScope.message}</h1>--%>
                                <script>
                                    let message = '<%= request.getAttribute("message")%>'
                                    window.onload = function (){
                                        Swal.fire({
                                            position: 'top-center',
                                            icon: 'success',
                                            title: message,
                                            showConfirmButton: false,
                                            timer: 1500
                                        })
                                    }
                                </script>
                            </c:if>
                            <c:if test="${requestScope.errors!=null}">
                                <div class="alert alert-danger" role="alert">
                                    <ul>
                                        <c:forEach items="${requestScope.errors}" var="error">
                                            <li>${error}</li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">Name</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control" name = "name" value="${requestScope.product.getName()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="price">Price</label>
                                <div class="col-md-10">
                                    <input type="number" id="price" name="price" class="form-control" value="${requestScope.product.getPrice()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="quantity">Quantity</label>
                                <div class="col-md-10">
                                    <input type="number" id="quantity" name="quantity" class="form-control" value="${requestScope.product.getQuantity()}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">Brand</label>
                                <div class="col-md-10">
                                    <select name="idBrand" id="idBrand" class="form-control" >
                                        <c:forEach items="${applicationScope.brands}" var="brand">
                                            <option value="${brand.getId()}">${brand.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-10 offset-2">
                                    <button type="submit">Update</button>
                                    <button type="submit"><a href="/products">Return</a></button>
                                </div>
                            </div>

                        </form>
                    </div>
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

<!-- Right Sidebar -->
<jsp:include page="/WEB-INF/admin/layout/right-bar.jsp"></jsp:include>

<jsp:include page="/WEB-INF/admin/layout/footerjs.jsp">
    <jsp:param name="page" value="create"/>
</jsp:include>

</body>

</html>