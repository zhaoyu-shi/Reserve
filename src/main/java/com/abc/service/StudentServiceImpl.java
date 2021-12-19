package com.abc.service;

import com.abc.dao.StudentMapper;
import com.abc.pojo.Dishes;
import com.abc.pojo.Meal;
import com.abc.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    public int addStudent(Student student) {
        return studentMapper.addStudent(student);
    }

    public int updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }

    public Student getStudentByPhone(String phone) {
        return studentMapper.getStudentByPhone(phone);
    }

    public int updateStudentPwd(int sid,String spassword) {
        return studentMapper.updateStudentPwd(sid,spassword);
    }

    public List<Meal> getAllMeal() {
        return studentMapper.getAllMeal();
    }

    public List<Dishes> getAllStudentDishes(int suid) {
        return studentMapper.getAllStudentDishes(suid);
    }

    public int addDishes(Dishes dishes) {
        return studentMapper.addDishes(dishes);
    }

    public List<Dishes> getStudentDishesing(int suid) {
        return studentMapper.getStudentDishesing(suid);
    }

    public int changeState(String did) {
        return studentMapper.changeState(did);
    }
}

