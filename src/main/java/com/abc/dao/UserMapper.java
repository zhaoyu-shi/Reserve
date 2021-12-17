package com.abc.dao;

import com.abc.pojo.Dishes;
import com.abc.pojo.Student;
import com.abc.pojo.Super;
import com.abc.pojo.Worker;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    //遍历所有窗口
    List<Worker> getAllWorker();
    //根据wid查窗口
    Worker getWorkerById(@Param("wid") int wid);
    //删除窗口
    int deleteWorker(@Param("wid") int wid);
    //修改窗口信息
    int updateWorker(Worker worker);
    //增加窗口
    int addWorker(Worker worker);

    //遍历所有学生
    List<Student> getAllStudent();
    //根据id查学生
    Student getStudentById(@Param("sid") int sid);
    //删除学生
    int deleteStudent(@Param("sid") int sid);
    //修改学生信息
    int updateStudent(Student student);
    //增加学生
    int addStudent(Student student);

    //遍历所有订单
    List<Dishes> getAllOrder();
    //根据id查订单
    Dishes getDishesById(@Param("did") String did);
    //删除订单
    int deleteDishes(@Param("did") String did);
    //修改订单信息
    int updateDishes(Dishes dishes);
    //增加订单
    int addDishes(Dishes dishes);

}
