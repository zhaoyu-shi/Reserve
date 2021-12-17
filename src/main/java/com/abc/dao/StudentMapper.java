package com.abc.dao;

import com.abc.pojo.Student;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    //注册
    int addStudent(Student student);
    //按照手机号进行查找
    Student getStudentByPhone(String phone);
    //更新个人信息
    int updateStudent(Student student);
    //修改密码
    int updateStudentPwd(@Param("sid") int sid, @Param("spassword") String spassword);
}
