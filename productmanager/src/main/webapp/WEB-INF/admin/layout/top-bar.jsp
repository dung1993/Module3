<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 19/12/2022
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="navbar-custom">
  <ul class="list-unstyled topnav-menu float-right mb-0">

    <li class="d-none d-sm-block">
      <form class="app-search">
        <div class="app-search-box">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search...">
            <div class="input-group-append">
              <button class="btn" type="submit">
                <i class="fe-search"></i>
              </button>
            </div>
          </div>
        </div>
      </form>
    </li>

    <c:if test="${sessionScope.username!=null}">
    <li class="dropdown notification-list">
      <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
        <img src="assets\images\users\user-1.jpg" alt="user-image" class="rounded-circle">
        <span class="pro-user-name ml-1">
          <i class="mdi mdi-chevron-down"></i>
                            </span>
      </a>
      <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
        <!-- item-->
        <div class="dropdown-item noti-title">
          <h5 class="m-0 text-white">
            Welcome ! ${sessionScope.username}
          </h5>
        </div>
          <!-- item-->
          <a href="/logout" class="dropdown-item notify-item">
            <i class="fe-log-out"></i>
            <span>Logout</span>
          </a>

      </div>
    </li>
    </c:if>
    <li class="dropdown notification-list">
      <a href="javascript:void(0);" class="nav-link right-bar-toggle waves-effect waves-light">
        <i class="fe-settings noti-icon"></i>
      </a>
    </li>


  </ul>

  <!-- LOGO -->
  <div class="logo-box">
    <a href="/products" class="logo text-center">
                        <span class="logo-lg">
                            <img src="assets\images\logo.png" alt="" height="24" style="width: 80px; height: 70px">
                          <!-- <span class="logo-lg-text-light">Upvex</span> -->
                        </span>
      <span class="logo-sm">
                            <!-- <span class="logo-sm-text-dark">X</span> -->
                            <img src="assets\images\logo.png" alt="" height="28">
                        </span>
    </a>
  </div>

  <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
    <li>
      <button class="button-menu-mobile waves-effect waves-light">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </li>
    <h3 style="padding: 20px; margin: 0">Gear Store</h3>
<%--    <li class="dropdown d-none d-lg-block">--%>
<%--      <a class="nav-link dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">--%>
<%--        Reports--%>
<%--        <i class="mdi mdi-chevron-down"></i>--%>
<%--      </a>--%>
<%--      <div class="dropdown-menu">--%>
<%--        <!-- item-->--%>
<%--        <a href="javascript:void(0);" class="dropdown-item">--%>
<%--          Finance Report--%>
<%--        </a>--%>

<%--        <!-- item-->--%>
<%--        <a href="javascript:void(0);" class="dropdown-item">--%>
<%--          Monthly Report--%>
<%--        </a>--%>

<%--        <!-- item-->--%>
<%--        <a href="javascript:void(0);" class="dropdown-item">--%>
<%--          Revenue Report--%>
<%--        </a>--%>

<%--        <!-- item-->--%>
<%--        <a href="javascript:void(0);" class="dropdown-item">--%>
<%--          Settings--%>
<%--        </a>--%>

<%--        <!-- item-->--%>
<%--        <a href="javascript:void(0);" class="dropdown-item">--%>
<%--          Help & Support--%>
<%--        </a>--%>

<%--      </div>--%>
<%--    </li>--%>

<%--    <li class="dropdown dropdown-mega d-none d-lg-block">--%>
<%--      <a class="nav-link dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">--%>
<%--        Mega Menu--%>
<%--        <i class="mdi mdi-chevron-down"></i>--%>
<%--      </a>--%>
<%--      <div class="dropdown-menu dropdown-megamenu">--%>
<%--        <div class="row">--%>
<%--          <div class="col-sm-8">--%>

<%--            <div class="row">--%>
<%--              <div class="col-md-4">--%>
<%--                <h5 class="text-dark mt-0">UI Components</h5>--%>
<%--                <ul class="list-unstyled megamenu-list mt-2">--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Widgets</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Nestable List</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Range Sliders</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Masonry Items</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Sweet Alerts</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Treeview Page</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Tour Page</a>--%>
<%--                  </li>--%>
<%--                </ul>--%>
<%--              </div>--%>

<%--              <div class="col-md-4">--%>
<%--                <h5 class="text-dark mt-0">Applications</h5>--%>
<%--                <ul class="list-unstyled megamenu-list mt-2">--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Email Pages</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Profile</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Calendar</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Team Contacts</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Maintenance</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Coming Soon Page</a>--%>
<%--                  </li>--%>
<%--                </ul>--%>
<%--              </div>--%>

<%--              <div class="col-md-4">--%>
<%--                <h5 class="text-dark mt-0">Layouts</h5>--%>
<%--                <ul class="list-unstyled megamenu-list mt-2">--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Small Sidebar</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Light Sidebar</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Dark Topbar</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Preloader</a>--%>
<%--                  </li>--%>
<%--                  <li>--%>
<%--                    <a href="javascript:void(0);">Sidebar Collapsed</a>--%>
<%--                  </li>--%>
<%--                </ul>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="col-sm-4">--%>
<%--            <div class="text-center mt-3">--%>
<%--              <h3 class="text-dark">Launching Discount Sale!</h3>--%>
<%--              <p class="font-16">Save up to 55% off.</p>--%>
<%--              <button class="btn btn-primary mt-1">Download Now <i class="mdi mdi-arrow-right-bold-outline ml-1"></i></button>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--      </div>--%>
<%--    </li>--%>
  </ul>
</div>