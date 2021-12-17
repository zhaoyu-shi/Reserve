package com.abc.service;

import com.abc.pojo.Student;

public interface StudentService {
    //注册
    int addStudent(Student student);
    //按照手机号进行查找
    Student getStudentByPhone(String phone);
    //更新个人信息
    int updateStudent(Student student);
    //修改密码
    int updateStudentPwd(int sid,String spassword);
}
