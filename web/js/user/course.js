
$("document").ready(function(){
    init();
});
function init(){

    var	arrbut = $(".mybut");

    arrbut.each(function (){
            var	value = $(this).val();
            console.log(value);

            if(value == "无课"){
                $(this).val("无课");
                $(this).css({'background-color' : '#ACA6D4'});
            }else{
                $(this).val("有课");
                $(this).css({'background-color' : '#FFFFFF'});
            }
        }
    );


}
$(".mybut").click(function(){

    var	value = $(this).val();

    if(value == "有课"){
        $(this).val("无课");
        $(this).css({'background-color' : '#ACA6D4'});
    }else{
        $(this).val("有课");
        $(this).css({'background-color' : '#FFFFFF'});
    }

});

$("#myreset").click(function(){
    if(confirm('确定重置')) {
        $(".mybut").val("有课");
        $(".mybut").css({'background-color' : '#FFFFFF'});
    }

});

$(".success_but").click(function(){
    var serialize = $("#myform").serialize();

    if(confirm('确定保存')) {

        $(".mybut").each(function () {
            var name = $(this).attr("name");
            var value = $(this).attr("value");
            serialize += "&" + name + "=" + value;
        });

        $.ajax({
            type: 'post',
            url: '/curriculum/update',
            data: serialize, //表单序列化
            dataType: "text",
            success: function (url) {
                alert("保存成功");
                location.href = url;
            },
            error: function (url) {
                alert("保存失败");
                location.href = url;
            }

        });
    }else{
        location.reload();
    }


});

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
