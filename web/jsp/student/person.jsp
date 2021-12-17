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
    <link rel="icon" href="https://zhaoyushi.oss-cn-beijing.aliyuncs.com/img/IMG_2347(20210227-020611).JPG">
    <link href="${pageContext.request.getContextPath()}/css/user/person.css" rel="stylesheet" />

</head>
<body>
<div id="wrapper">
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
                    <i class="fa">${student.sname}</i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-key fa-fw" ></i>修改密码</a></li>
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
                        <a href="${pageContext.request.getContextPath()}/student/find" class="active">
                            <i class="fa fa-fw fa-address-card-o" style="font-size:16px"></i> 个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.getContextPath()}/curriculum/find">
                            <i class="fa fa-edit fa-fw" style="font-size:18px"></i> 预约菜品
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.getContextPath()}/attendance/find">
                            <i class="fa fa-thumbs-o-up fa-fw" style="font-size:16px"></i> 我的订单
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.getContextPath()}/work/find">
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">个人信息
                    <div class="myheader" style="float:right;">
                        <!-- <input type="button" value="保 存" id="myreset" class="result_but btn-link"> -->
                        <input type="button" ONCLICK="xiugai()" value="保 存" class="result_but success_but">
                    </div>
                </h1>

            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">

                <div class="myleft">
                    <form class="form-inline" method="post" id="myform"
                          action="${pageContext.request.contextPath}/student/update">
                        <input type="hidden" name="id" value="${student.id}">
                        <div class="form-group">
                            <label for="sname">姓名:</label>
                            <input type="text" class="form-control" id="sname"
                                   value="${student.sname}" name="sname" />
                        </div>
                        <br>

                        <div class="form-group">
                            <label for="sid">学号:</label>
                            <input type="text" class="form-control" id="sid"
                                   value="${student.sid}" name="sid" />
                        </div>

                        <div class="form-group">
                            <label for="sex">性别:</label>
                            <select	class="form-control" id="sex" name="sex">
                                <option value="${student.sex}">${student.sex}</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="grade">年级:</label>
                            <input type="text" class="form-control" id="grade"
                                   value="${student.grade}" placeholder="如:2019" name="grade" />
                        </div>
                        <div class="form-group">
                            <label for="qq">QQ号:</label>
                            <input type="text" class="form-control" id="qq"
                                   value="${student.qq}" name="qq" />
                        </div>

                        <br>

                        <div class="form-group">
                            <label for="classname">班级:</label>
                            <input type="text" class="form-control" id="classname"
                                   value="${student.classname}" placeholder="如:软工2班、大数据1班、java2班" name="classname" />
                        </div>
                        <div class="form-group">
                            <label for="customerName7">手机号:</label>
                            <input type="text" class="form-control" id="customerName7"
                                   value="${student.sphone}" name="sphone" />
                        </div>
                        <br>

                        <div class="form-group">
                            <label for="date">生日:</label>
                            <input type="date" class="form-control" id="date"
                                   value="${student.date}" name="date" />
                        </div>
                        <div class="form-group">
                            <label for="wechat">微信号:</label>
                            <input type="text" class="form-control" id="wechat"
                                   value="${student.wechat}" name="wechat" />
                        </div>

                        <!-- <button type="submit" class="btn btn-primary">查询</button> -->
                    </form>
                </div>
                <div class="myright"></div>

            </div>
        </div>
    </div>
</div>
<%--修改密码模拟框--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
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
<!-- 编写js代码 -->
<script src="${pageContext.request.getContextPath()}/js/user/person.js" type="text/javascript"></script>

</body>
</html>