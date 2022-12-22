<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 20/12/2022
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
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
                                    <li class="breadcrumb-item active">Login</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Login</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                <div class="row" style="padding: 15px">
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
                                <label class="col-md-2 control-label" for="username">UserName</label>
                                <input class="col-md-5 control-label" name="username" type="text" id="username" style="max-width: 250px; margin-right: 50px">
                                <p class="col-md-5 control-label">* username is not empty, start with uppercase and at least 4 characters</p>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" for="password">Password</label>
                                <input class="col-md-5 control-label" name="password" type="password" id="password" style="max-width: 250px; margin-right: 50px">
                                <p class="col-md-5 control-label">* password is not empty and at least 6 character</p>
                            </div>
                            <button style="margin-left: 395px">Login</button>
                        </form>
                    </div>
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
