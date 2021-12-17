var publicTime = "";
$(document).ready(function(){
    but_val_view();
});
/*
* 功能：删除新加的元素
* append中的节点是在整个文档加载完之后开始添加，页面不会为append的元素初始化添加点击事件，
* 故使用这种方式动态添加的节点中的click事件没有生效。
* 解决方案：事件委托方式解决，将指定的事件绑定在document上，只要append元素符合指定的元素，
* 就会绑定此事件
*/
// 点击人物名称添加到右边
$(document).on("click", ".list-group-item", function() {
    var top_class = $(this).parents(".list-group").parents().attr("class");
    // 查看点击是左边还是右边

    var myname = $(this).text(); //获得名字
    var parents_class= $(this).parents(".list-group").attr("class"); //获得父类标签
    var myclass= $(this).attr("class"); //获得当前标签class
    var mysid= $(this).attr("name"); //获得当前标签class
    if(top_class == "alert_body_left"){//左边

        var value ="<a href='javascript:void(0);' name='"+mysid+"' class='"+ myclass+"'>"+myname+"</a>";
        var strArray = parents_class.split(' ');
        var parents_class_right = "."+strArray[0];

        $(".alert_body_right").find(parents_class_right).append(value);

    }
    if(top_class == "alert_body_right"){//右边删除
        $(this).remove();
    }

});


//点击按钮展开状态栏
$(".mybut").click(function(){


    $(".list-group-item-info").remove();
    $(".list-group-item-warning").remove();
    $(".list-group-item-success").remove();

    var array_css=new Array(); //三种样式
    array_css.push("list-group-item list-group-item-info");
    array_css.push("list-group-item list-group-item-warning");
    array_css.push("list-group-item list-group-item-success");

    var array_class=new Array(); //三个地方
    array_class.push(".myulRight"); //大三
    array_class.push(".myulMiddle");//大二
    array_class.push(".myulLeft");//大一

    var array_grade=new Array(); //记录年级,这里面写死了需要写活
    array_grade.push("19"); //大三
    array_grade.push("20");//大二
    array_grade.push("21");//大一
    //添加左边人物
    publicTime = $(this).attr("name"); //记录到全局变量中
    var mytime = $(this).attr("name");
    var mydata = "time="+mytime;

    //添加右边人物
    // $(this).children().each(function (index,obj_div) {
    //     var attr = obj_div.attr("class");
    //     console.log(attr);
    // });


    $.ajax({
        type: 'post',
        url: '/work/findCurriculumWorkTime',
        data: mydata, //表单序列化
        dataType:'json',
        success: function(data) {
            //生成弹窗左侧标签
            $.each(data.studentsNoWork,function (key,obj) {

                var grade = (obj.snumber).substring(0,2);

                var flag = "-1";
                for(j = 0,len=array_grade.length; j < len; j++) {
                    if(array_grade[j] == grade){ //查找不到，进行标记
                        flag = j;
                    }
                }

                //生成标签，添加
                var value ="<a href='javascript:void(0);' name='"+obj.sid+"' class='"+ array_css[flag]+"'>"+obj.sname+"</a>";
                $(".alert_body_left").find(array_class[flag]).append(value);

            });

            //生成弹窗右侧标签
            $.each(data.studentsWork,function (key,obj) {

                var grade = (obj.snumber).substring(0,2);

                var flag = "-1";
                for(j = 0,len=array_grade.length; j < len; j++) {
                    if(array_grade[j] == grade){ //查找不到，进行标记
                        flag = j;
                    }
                }

                //生成标签，添加
                var value ="<a href='javascript:void(0);' name='"+obj.sid+"' class='"+ array_css[flag]+"'>"+obj.sname+"</a>";
                $(".alert_body_right").find(array_class[flag]).append(value);

            });

        },
        error:function (data) {
            alert("数据获取失败");
            window.location.reload();
        }
    });

    $(this).attr("data-toggle","modal");
    $(this).attr("data-target","#newCustomerDialog");
});
//按钮内容展示
function but_val_view(){

    //遍历所有按钮

    var num = 0;
    $(".mybut").each(function(index,obj){

        var mytime = $(obj).attr("name");

        var mydata = "time="+mytime;
        $.ajax({
            type: 'post',
            url: '/work/findCurriculumWorkTime',
            data: mydata,
            dataType:'json',
            success: function(data) {
                var myname = "";
                $.each(data.studentsWork,function (key,value) {
                    //  //生成标签，添加
                    var grade = (value.snumber).substring(0,2);//年级
                    var val = "<div name='"+value.sid+"' class='"+grade+" view_date_div'>"+ value.sname +"</div>";
                    $(obj).append(val);
                });
                //得到无课表人数
                var number = 0;
                $.each(data.studentsNoWork,function (key,value) {
                    number++;
                });

                $(obj).prev().text(number);

            },
            error:function (data) {
                console.log("数据获取失败");
                // window.location.reload();
            }
        });

    });

}


//点击完成进行保存
$("#mysubmit").click(function(){

    // 将右侧提交到数据库中
    var array_sid = new Array();
    $(".alert_body_right > .myulLeft").children("a").each(function () {
        array_sid.push($(this).attr("name"));
    });
    $(".alert_body_right > .myulMiddle").children("a").each(function () {
        array_sid.push($(this).attr("name"));
    });
    $(".alert_body_right > .myulRight").children("a").each(function () {
        array_sid.push($(this).attr("name"));
    });
    console.log(array_sid);

    $.ajax({
        type: 'post',
        url: '/work/doWork',
        data: {"Sids":array_sid,"time":publicTime}, //表单序列化
        success: function(data) {
            //  alert("保存成功");
            location.reload();
        },
        error:function (data) {
            alert("保存失败");
            location.reload();
        }
    });

});
$("#mySumbit").click(function () {
    $("#myinfo").text("");

    var oldpassword = $("#oldpassword").val();
    var newpassword = $("#newpassword").val();
    var newpassword2 = $("#newpassword2").val();

    if(oldpassword == "" || newpassword == "" || newpassword2 == ""){
        $("#myinfo").text("输入不能为空！");
    }else {

        if (newpassword != newpassword2) {
            $("#myinfo").text("两次新密码输入不相同！");
        } else {
            $.ajax({
                type: 'post',
                url: '/student/password',
                data: {"oldpassword": oldpassword, "newpassword": newpassword}, //表单序列化
                dataType: "text",
                success: function (data) {
                    if (data == "true") {
                        alert("修改成功，请重新登录");
                        location.href = "/";
                    } else {
                        $("#myinfo").text("原密码输入错误！");
                    }
                },
                error: function (data) {
                    $("#myinfo").text("修改密码发生错误,错误编码 10001！");
                }

            });
        }
    }
});
