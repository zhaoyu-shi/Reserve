<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        /*表单样式*/
        /*    .myformdiv {
                    width: 428px;
                    height: 345px;
                    padding-top:20px;
                    background-color:rgba(0,0,0,0.2);
                    border-radius: 20px;
            }*/
        #mybtn{
            width: 100%;
        }
        .mybody_but{
            padding-top: 10px;
            padding-right: 10px;
            padding-left: 5px;
        }

        .myleft_but{
            float: left;
        }
        .myright_but{
            float: right;
        }
        #small{
            color: #f5f5f5;
            font-size: 16px;
        }
        .bg-primary{
            padding-left: 10%;
        }

    </style>
</head>
<body>
<div class="text-center">
    <div class="bg-primary"><br><h1>餐厅预约管理平台<small id="small">&emsp;&emsp;安阳师范学院&ensp;•&ensp;软件学院</small></h1><br></div>
</div>


<div class="container">
    <br>
    <blockquote>
        <p  id="mytext"></p>
        <p class="text-muted" id="myauthor"><p>
    </blockquote>
    <a class="text-primary" href="http://www.aynu.edu.cn/">关于我们</a>
</div>
<div class="container">

    <div class="row">
        <div class="col-xs-6 col-md-4"></div>

        <div class="col-xs-6 col-md-4 col-center-block myformdiv ">
            <form role="form" action="/student/login" method="post">
                <div class="form-group">
                    <p class="text-danger">${requestScope.prompt}</p>
                </div>
                <div class="form-group">
                    <label for="snumber">手机号:</label>
                    <input type="text" class="form-control" id="snumber" name="snumber"
                           placeholder="请输入" value="${requestScope.snumber}">
                </div>
                <div class="form-group">
                    <label for="password">密码:</label>
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="请输入">
                </div>
                <div class="checkbox">
                    <label class="text-muted">
                        <input type="checkbox" name="rank" value="1">高级权限
                    </label>
                </div>
                <div class="text-center">
                    <button type="submit" id="mybtn" class="btn btn-primary">提交</button>
                </div>
                <div class="form-group mybody_but" >
                    <div class="myleft_but"><a href="#">忘记密码</a></div>
                    <div class="myright_but"><a href="/jsp/register.jsp">注册</a></div>
                </div>

            </form>
        </div>

        <div class="col-xs-6 col-md-4"></div>
    </div>

</div>
<div class="container">
    <!-- 功能介绍 -->
</div>
<%--//https://v1.hitokoto.cn/--%>
<script type="text/javascript">
    $(document).ready(function(){

        $.ajax({
            type:"get",
            url:"https://v1.hitokoto.cn/",
            data:"c=j", //出自网易云
            dateType:"json",
            success:function (data) {
                $("#mytext").text(data.hitokoto);
                $("#myauthor").text(" —— "+data.from);
            },
            error:function (data) {

                $("#mytext").text("多巴胺不等于爱情，爱情却一定有多巴胺！");
                $("#myauthor").text(" —— "+"网易云");
            }

        });


    });
</script>

</body>
</html>
