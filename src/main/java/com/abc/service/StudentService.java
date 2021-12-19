package com.abc.service;

import com.abc.pojo.Dishes;
import com.abc.pojo.Meal;
import com.abc.pojo.Student;
import com.abc.pojo.Super;

import java.util.List;

public interface StudentService {
    //注册
    int addStudent(Student student);
    //按照手机号进行查找
    Student getStudentByPhone(String phone);
    //更新个人信息
    int updateStudent(Student student);
    //修改密码
    int updateStudentPwd(int sid,String spassword);
    //查看餐品
    List<Meal> getAllMeal();
    //查看订单信息
    List<Dishes> getAllStudentDishes(int suid);
    //未完成的订单
    List<Dishes> getStudentDishesing(int suid);
    //下单
    int addDishes(Dishes dishes);
    //改变订单状态
    int changeState(String did);
}
