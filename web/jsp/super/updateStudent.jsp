<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改学生信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="icon" href="https://zhaoyushi.oss-cn-beijing.aliyuncs.com/img/IMG_2347(20210227-020611).JPG">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<br>
<p class="text-center">修改信息</p>
<form class="form-horizontal" role="form" method="post" action="/user/updateStudent">
    <input type="hidden" name="id" value="${studentById.id}">
    <div class="form-group">
        <label for="firstname" class="col-sm-2 control-label">学号：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="firstname" name="sid"
                   value="${studentById.sid}">
        </div>
    </div>
    <div class="form-group">
        <label for="lastname" class="col-sm-2 control-label">姓名：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="lastname" name="sname"
                   value="${studentById.sname}">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">年纪：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="password" name="spassword"
                   value="${studentById.grade}">
        </div>
    </div>
    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">联系方式：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phone" name="sphone"
                   value="${studentById.sphone}">
        </div>
    </div>
    <div class="form-group">
        <label for="sex" class="col-sm-2 control-label">性别：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="sex" name="sex"
                   value="${studentById.sex}">
        </div>
    </div>
    <div class="form-group">
        <label for="pwd" class="col-sm-2 control-label">密码：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="pwd" name="spassword"
                   value="${studentById.spassword}">
        </div>
    </div>
    <div class="form-group">
        <label for="class" class="col-sm-2 control-label">班级：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="class" name="classname"
                   value="${studentById.classname}">
        </div>
    </div>
    <div class="form-group">
        <label for="we" class="col-sm-2 control-label">微信：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="we" name="wechat"
                   value="${studentById.wechat}">
        </div>
    </div>
    <div class="form-group">
        <label for="qq" class="col-sm-2 control-label">QQ：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="qq" name="qq"
                   value="${studentById.qq}">
        </div>
    </div>
    <div class="form-group">
        <label for="bir" class="col-sm-2 control-label">生日：</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="bir" name="date"
                   value="${studentById.date}">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">确定</button>
        </div>
    </div>
</form>

</body>
</html>

