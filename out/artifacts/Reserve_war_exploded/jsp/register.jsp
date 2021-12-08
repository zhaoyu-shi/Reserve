<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    #mybtn{
        width: 100%;
    }
    #info{
        padding-left: 15px;
    }

</style>
</head>
<body>
<div class="text-center">
    <div class="bg-primary"><br><h1>实验室管理员工作平台</h1><br></div>

</div>
<br>   <br>
<!--
<div class="container">
    <h2>文本</h2>
    <p class="text-muted">该段落使用了样式 "text-muted"。</p>
    <a class="text-primary" href="https://www.baidu.com">关于我们</a>
</div>
<div class="container"> -->

<div class="row">
    <div class="col-xs-6 col-md-4"></div>

    <div class="col-xs-6 col-md-4">
        <form role="form" action="${pageContext.request.contextPath}/student/add" method="post">
        <div class="form-group">
            <%--<p class="text-danger" id="info"></p>--%>
        </div>
        <div class="form-group">
            <label for="snumber">学号:</label>
            <input type="text" class="form-control" id="snumber" name="snumber"
                   placeholder="请输入" required="required">
        </div>
        <div class="form-group">
            <label for="sname">姓名:</label>
            <input type="text" class="form-control" id="sname" name="sname"
                   placeholder="请输入" required="required">
        </div>
        <div class="form-group">
            <label for="phone">手机号:</label>
            <input type="text" class="form-control" id="phone" name="phone"
                   placeholder="请输入" required="required">
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="请输入" required="required">
        </div>
        <div class="form-group">
            <label for="newpassword">确认密码:<span class="text-danger" id="info"></span></label>
            <input type="password" class="form-control" id="newpassword" name="newpassword"
                   placeholder="请输入" required="required">
        </div>
        <div class="checkbox">
            <label class="text-muted">
                <input type="checkbox">觉得作者长得帅
            </label>
        </div>
        <button type="submit" id="mybtn" class="btn btn-primary">注册</button>
    </form></div>

    <div class="col-xs-6 col-md-4"></div>
</div>

</div>
<div class="container">
    <!-- 功能介绍 -->
</div>
</body>
<script>

    $("#newpassword").bind('input propertychange change', function() {

        var newpassword = $("#newpassword").val();
        var password = $("#password").val();

        if (newpassword != password){
            $("#info").text("两次密码不相同！");
        }else{
            $("#info").text("");
        }

    });


</script>
</html>

