
function xiugai(){
    if(confirm("确定修改")){
        $("#myform").submit();
        alert("修改成功！")
    }

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
                url: '/worker/password?wpassword=#{newpassword}',
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
