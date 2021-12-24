<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>餐厅预约系统 v2.0</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.getContextPath()}/css/bootstrap.min.css" rel="stylesheet" />
    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.getContextPath()}/css/metisMenu.min.css" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link href="${pageContext.request.getContextPath()}/css/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${pageContext.request.getContextPath()}/css/sb-admin-2.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link href="${pageContext.request.getContextPath()}/css/boot-crm.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="JavaScript1.2" src="${pageContext.request.getContextPath()}/js/util.js"></script>
    <link href="${pageContext.request.getContextPath()}/css/user/person.css" rel="stylesheet" />
    <link rel="icon" href="https://zhaoyushi.oss-cn-beijing.aliyuncs.com/img/IMG_2347(20210227-020611).JPG">
    <script type="text/javascript" language="JavaScript1.2" src="${pageContext.request.getContextPath()}/js/util.js"></script>
</head>
<body>

<div id="wrapper">
    <%-- <iframe id="ifarm" style="width:100% ;height: 100% ">--%>
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="customer/list.action">餐厅预约系统 v2.0</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">

            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">

                    <i class="fa fa-user-circle-o"></i>
                    <i class="fa">${worker.wname}</i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#" data-toggle="modal" data-target="#passwordModal"><i class="fa fa-key fa-fw" ></i>修改密码</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/logout">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>
        <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
                        </div>
                    </li>

                    <li>
                        <a href="${pageContext.request.getContextPath()}/worker/find?wphone=${worker.wphone}">
                            <i class="fa fa-fw fa-address-card-o" style="font-size:16px"></i> 个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.getContextPath()}/worker/getAllMeal"  class="active">
                            <i class="fa fa-tachometer fa-fw" style="font-size:18px"></i> 查看餐品
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.getContextPath()}/worker/getWorkerDishes?wuid=${worker.wid}">
                            <i class="fa fa-hand-stop-o" style="font-size:16px"></i> 未完成的订单
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.getContextPath()}/worker/getWorkerDishes?wuid=${worker.wid}">
                            <i class="fa fa-thumbs-o-up fa-fw" style="font-size:16px"></i> 已完成订单查询
                        </a>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-calendar-check-o fa-fw" style="font-size:16px"></i> 联系我们
                        </a>
                    </li>


                </ul>
                <!-- 更多图标 可以访问https://www.runoob.com/font-awesome/fontawesome-icons-webapp.html-->
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>
    <!-- 客户列表查询部分  start-->

    <div id="page-wrapper">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1>
                            <small>餐品列表</small>
                        </h1>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 column">
                        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">增加</button>
                    </div>
                </div>

            </div>

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th>餐品</th>
                            <th>价格</th>
                            <th>其他</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="work" items="${allMeal}">
                            <tr class="text-center">
                                <td>${work.mname}</td>
                                <td>${work.mprice}</td>
                                <td>
                                        <%--
                                                                                <a href="${pageContext.request.contextPath}/user/toUpdateStu?sid=${work.sid}">更改</a>  |
                                        --%>
                                        <%--    <a href="#" onClick="javascript:windowOpen('/user/toUpdate?wid=${work.wid}','','',500,420,'no','yes','100','100')">修改</a> |--%>
                                    <a href="${pageContext.request.contextPath}/worker/toUpdateMeal?mid=${work.mid}" data-toggle="modal" data-target="#xiu">更改</a> |
                                    <a href="${pageContext.request.contextPath}/worker/deleteMeal?mid=${work.mid}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </div>

    <%--</iframe>--%>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="xiu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    模态框（Modal）标题
                </h4>
            </div>
            <div class="modal-body">
                ${workerById}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">联系我们</h4>
            </div>
            <div class="modal-body">请联系后台人员进行修改<br>邮箱：zhaoyushi00@gmail.com</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 增加窗口模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加新餐品</h4>
            </div>
            <div class="modal-body">
                <form method="get" action="/worker/upload">
                    <p class="text-danger"></p>
                    <div class="myform-group">
                        <label class="control-label">餐品:</label>
                        <input name="mname" required="required" type="text" class="form-control" placeholder="请输入" >
                    </div>
                    <div class="myform-group">
                        <label  class="control-label">价格:</label>
                        <input name="mprice" required="required" type="text" class="form-control" placeholder="请输入" >
                    </div>
                    <input type="hidden" name="wmid" value="${worker.wid}">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary" onclick="add">提交</button>
                    </div>
                </form>

            </div>




        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--修改密码模拟框--%>
<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form method="post" id="myfrom">
                    <p class="text-danger" id="myinfo"></p>
                    <div class="myform-group">
                        <label for="oldpassword" class="control-label">原密码:</label>
                        <input  required="required" type="text" class="form-control" placeholder="请输入" id="oldpassword">
                    </div>
                    <div class="myform-group">
                        <label for="newpassword" class="control-label">新密码:</label>
                        <input  required="required" type="password" class="form-control" placeholder="请输入" id="newpassword">
                    </div>
                    <div class="myform-group">
                        <label for="newpassword2" class="control-label">新密码:</label>
                        <input  required="required" type="password" class="form-control" placeholder="请输入" id="newpassword2">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="mySumbit">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="${pageContext.request.getContextPath()}/js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.getContextPath()}/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.getContextPath()}/js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="${pageContext.request.getContextPath()}/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.getContextPath()}/js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.getContextPath()}/js/sb-admin-2.js"></script>
</body>
</html>