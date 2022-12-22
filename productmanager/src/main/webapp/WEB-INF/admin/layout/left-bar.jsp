<div class="left-side-menu">

    <div class="slimscroll-menu">

        <!--- Sidemenu -->
        <div id="sidebar-menu">

            <ul class="metismenu" id="side-menu">

                <li class="menu-title">Navigation</li>

                <li>
                    <a href="javascript: void(0);">
                        <i class="la la-dashboard"></i>
                        <span> Product </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="nav-second-level" aria-expanded="false">
                        <li>
                            <a href="index1.jsp">List Product</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);">
                        <i class="la la-cube"></i>
                        <span> Service </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="nav-second-level" aria-expanded="false">
                        <li>
                            <a href="/products?action=create">Create Product</a>
                        </li>
                        <li>
                            <a href="/products?action=edit&id=${product.getId}">Edit & Update</a>
                        </li>
                        <li>
                            <a href="/products?action=delete&id=${product.getId}">Delete Product</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);">
                        <i class="la la-file-text-o"></i>
                        <span> Admin & User </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul class="nav-second-level" aria-expanded="false">
                        <li>
                            <a href="/products">Log In</a>
                        </li>
                        <li>
                            <a href="/login">Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
        <!-- End Sidebar -->

        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->

</div>