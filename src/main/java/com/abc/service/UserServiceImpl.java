package com.abc.service;

import com.abc.dao.UserMapper;
import com.abc.pojo.Dishes;
import com.abc.pojo.Student;
import com.abc.pojo.Worker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public int addWorker(Worker worker) { return userMapper.addWorker(worker); }

    public List<Worker> getAllWorker() {
        return userMapper.getAllWorker();
    }

    public List<Student> getAllStudent() {
        return userMapper.getAllStudent();
    }

    public List<Dishes> getAllOrder() {
        return userMapper.getAllOrder();
    }

    public int deleteWorker(int wid) {
        return userMapper.deleteWorker(wid);
    }

    public int updateWorker(Worker worker) {
        return userMapper.updateWorker(worker);
    }

    public Worker getWorkerById(int wid) {
        return userMapper.getWorkerById(wid);
    }

    public Student getStudentById(int sid) {
        return userMapper.getStudentById(sid);
    }

    public int deleteStudent(int sid) {
        return userMapper.deleteStudent(sid);
    }

    public int updateStudent(Student student) {
        return userMapper.updateStudent(student);
    }

    public int addStudent(Student student) {
        return userMapper.addStudent(student);
    }

    public Dishes getDishesById(String did) {
        return userMapper.getDishesById(did);
    }

    public int deleteDishes(String did) {
        return userMapper.deleteDishes(did);
    }

    public int updateDishes(Dishes dishes) {
        return userMapper.updateDishes(dishes);
    }

    public int addDishes(Dishes dishes) {
        return userMapper.addDishes(dishes);
    }
}
