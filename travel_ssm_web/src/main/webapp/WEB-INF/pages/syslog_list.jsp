<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>日志查询</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- Navbar -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <jsp:include page="aside.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">日志管理</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index/toPage_Index.do">首页</a></li>
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size=4">日志管理</a></li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- Main content -->
        <section class="content">
            <div class="card">
                <!-- card header -->
                <div class="card-header border-transparent">
                    <h3 class="card-title">列表</h3>
                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <!-- /.card-header -->
                <!-- 工具栏 -->
                <div>
                    <div class="form-group form-inline">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" title= "刷新" onclick="window.location.reload()">
                                <i class="fa fa-refresh"></i> 刷新
                            </button>
                        </div>
                    </div>
                </div>
                <!--工具栏/-->
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table m-0">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>访问时间</th>
                                <th>访问用户</th>
                                <th>访问IP</th>
                                <th>资源URL</th>
                                <th>执行时间</th>
                                <th>访问方法</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="sysLog">
                                <tr>
                                    <td>${sysLog.id}</td>
                                    <td>${sysLog.visitTimeStr}</td>
                                    <td>${sysLog.username}</td>
                                    <td>${sysLog.ip}</td>
                                    <td>${sysLog.url}</td>
                                    <td>${sysLog.executionTime}</td>
                                    <td>${sysLog.method}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <div class="mt-3 d-inline-block" >
                        <span>总共${pageInfo.pages}页，共${pageInfo.total}条数据，每页</span>
                        <div class="form-group d-inline">
                            <select class="rounded-sm bg-light" style="max-width: 200px;" onchange="changePageSize()" id="changePageSize">
                                <option>--请选择条数--</option>
                                <option selected="selected">${pageInfo.pageSize}</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                            </select>
                        </div>
                        <span>条</span>
                    </div>
                    <div class="btn-group float-right mt-3">
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size=${pageInfo.pageSize}'">首页</button>
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}'">上一页</button>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="num">
                            <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/sysLog/findAll.do?page=${num}&size=${pageInfo.pageSize}'">${num}</button>
                        </c:forEach>
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}'">下一页</button>
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}'">尾页</button>
                    </div>
                </div>
            </div>
            <!-- /.card-footer -->
            </div>

        </section>
    </div>


    <!--footer--!>
	  <jsp:include page="footer.jsp"></jsp:include>

	  <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${pageContext.request.contextPath}/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${pageContext.request.contextPath}/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="${pageContext.request.contextPath}/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="${pageContext.request.contextPath}/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="${pageContext.request.contextPath}/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${pageContext.request.contextPath}/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<script>
    //分页：根据选择“每页数据条数”显示数据
    function changePageSize() {
        //获取下拉列表的值
        var size=$("#changePageSize").val();
        //向服务器发送请求，改变每页显示条数
        location.href='${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size='+size;
    }
</script>
</body>
</html>


