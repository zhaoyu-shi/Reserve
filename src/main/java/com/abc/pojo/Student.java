package com.abc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.transaction.reactive.TransactionalOperatorExtensionsKt;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private int sid;        //学号
    private String id;
    private String sname;   //学生姓名
    private String grade;   //年级 班级
    private String sphone;   //手机号
    private String sex;
    private String spassword;
    private String classname;
    private String wechat;
    private String qq;
    private String date;
}
