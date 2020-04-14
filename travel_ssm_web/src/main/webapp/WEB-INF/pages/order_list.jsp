<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单管理</title>
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
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">订单管理</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="index.jsp">首页</a></li>
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/order/findAll.do?page=1&size=4">订单管理</a></li>
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
                <security:authorize access="hasRole('ADMIN')">
                <div>
                    <div class="form-group form-inline">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" title= "刷新" onclick="window.location.reload()">
                                <i class="fa fa-refresh"></i> 刷新
                            </button>
                        </div>
                    </div>
                </div>
                </security:authorize>
                <!--工具栏/-->
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <form action="${pageContext.request.contextPath}/order/deleteManyOrders.do" method="post">
                            <table class="table m-0">
                                <thead>
                                <tr>
                                    <th tyle="padding-right: 0px"><input type="checkbox" name="checkAll"/></th>
                                    <th>ID</th>
                                    <th>订单编号</th>
                                    <th>产品名称</th>
                                    <th>金额</th>
                                    <th>下单时间</th>
                                    <th>订单状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageInfo.list}" var="order">
                                    <tr>
                                        <td><input type="checkbox" name="checkItemTd" value="${order.id}"/></td>
                                        <td>${order.id}</td>
                                        <td>${order.orderNum}</td>
                                        <td>${order.product.productName}</td>
                                        <td>${order.product.productPrice}</td>
                                        <td>${order.orderTimeStr}</td>
                                        <td>${order.orderStatusStr}</td>
                                        <td>
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath}/order/selectById.do?id=${order.id}"'>详情</button>
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath}/order/toPage_OrderEdit.do?id=${order.id}"'>添加备注</button>
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath}/order/deleteOneOrder.do?id=${order.id}"'>删除订单</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="card-footer clearfix">
                                <input type="submit" value="删除" class="btn btn-sm btn-info float-left"/>
                            </div>
                        </form>
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
                                <option selected>${pageInfo.pageSize}</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                            </select>
                        </div>
                        <span>条</span>
                    </div>
                    <div class="btn-group float-right mt-3">
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/order/findAll.do?page=1&size=${pageInfo.pageSize}'">首页</button>
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/order/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}'">上一页</button>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="num">
                            <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/order/findAll.do?page=${num}&size=${pageInfo.pageSize}'">${num}</button>
                        </c:forEach>
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/order/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}'">下一页</button>
                        <button type="button" class="btn btn-sm btn-default" onclick="location.href='${pageContext.request.contextPath}/order/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}'">尾页</button>
                    </div>
                </div>
            </div>
            <!-- /.card-footer -->
        </section>
    </div>
    <!-- /.content-wrapper -->

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
        location.href='${pageContext.request.contextPath}/order/findAll.do?page=1&size='+size;
    }
</script>
</body>
</html>


