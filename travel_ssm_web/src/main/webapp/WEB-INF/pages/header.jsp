<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <div class="nav-link dropdown-toggle" data-toggle="dropdown">账号管理</div>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout.do">注销</a>
            </div>
        </li>
    </ul>
</nav>
<!-- /.navbar -->
