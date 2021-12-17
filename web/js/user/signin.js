$(document).ready(function(){
    GetTime();
    qiandao_img();




});

$("#myclick").click(function(){
    // 走个ajax请求
    var mytime = $(".timeDiv").text();
    var mysrc = $(".myimg").attr("src");
    console.log(mysrc);

    if(mysrc == "/images/sign_in/1.png"){

        $.ajax({
            type:"post",
            url:"/attendance/add",
            data:{"print_time":mytime},
            success:function() {
                alert("签到成功！");
                window.location.reload();
            },
            error:function () {
                alert("签到失败！");
                window.location.reload();
            }
        });

    }else{
        alert("请勿重复签到！");
    }

});
//根据今天是否签到，切换壁纸
function qiandao_img() {

    var mytime = $(".timeDiv").text();
    $.ajax({
        type:"post",
        url:"/attendance/inspect",
        data:{"print_time":mytime},
        success:function(data) {

            if(data){
                $(".myimg").attr("src","/images/sign_in/1.png");
            }else{
                $(".myimg").attr("src","/images/sign_in/2.png");
            }
        },

        error:function (data) {
            if(data){
                $(".myimg").attr("src","/images/sign_in/1.png");
            }else{
                $(".myimg").attr("src","/images/sign_in/2.png");
            }

        }
    });


}


//异步加载时间
function GetTime() {
    var time = new Date();
    var year = time.getFullYear();
    var month = time.getMonth() + 1;         // 月份从0开始
    var day = time.getDate();                // 注意是getDate()
    var hour = time.getHours();
    var minute = time.getMinutes();
    var sec = time.getSeconds();
    var timestring;

    if (hour < 10) {
        hour = "0" + hour ;
    }
    if (minute < 10) {
        minute = "0" + minute ;
    }
    if (sec < 10) {
        sec = "0" + sec ;
    }

    timestring
        = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + sec;

    // div没有value属性
    $(".timeDiv").text(timestring);
    window.setInterval("GetTime()", 1000);
};


function test(){

    var txt=$("<tr><td>6</td><td>2020-11-20 12:00</td></tr>");
    $(".mytbody").append(txt);
};

// 创建客户
function createCustomer() {
    $.post("customer/create.action",
        $("#new_customer_form").serialize(),function(data){
            if(data =="OK"){
                alert("客户创建成功！");
                window.location.reload();
            }else{
                alert("客户创建失败！");
                window.location.reload();
            }
        });
}
$("#mySumbit").click(function () {
    $("#myinfo").text("");

    var oldpassword = $("#oldpassword").val();
    var newpassword = $("#newpassword").val();
    var newpassword2 = $("#newpassword2").val();

    if(oldpassword == "" || newpassword == "" || newpassword2 == ""){
        $("#myinfo").text("输入不能为空！");
    }else{

        if(newpassword != newpassword2){
            $("#myinfo").text("两次新密码输入不相同！");
        }else{
            $.ajax({
                type: 'post',
                url: '/student/password',
                data: {"oldpassword":oldpassword,"newpassword":newpassword}, //表单序列化
                dataType:"text",
                success:function (data) {
                    if(data == "true"){
                        alert("修改成功，请重新登录");
                        location.href = "/";
                    }else{
                        $("#myinfo").text("原密码输入错误！");
                    }
                },
                error:function (data) {
                    $("#myinfo").text("修改密码发生错误,错误编码 10001！");
                }

            });
        }

    }

});