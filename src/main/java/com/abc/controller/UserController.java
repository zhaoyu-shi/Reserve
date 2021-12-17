package com.abc.controller;

import com.abc.pojo.Dishes;
import com.abc.pojo.Student;
import com.abc.pojo.Super;
import com.abc.pojo.Worker;
import com.abc.service.StudentService;
import com.abc.service.UserService;
import com.abc.service.WorkerService;
import com.abc.utils.IDutils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private WorkerService workerService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private UserService userService;

    //登陆错误时返回登陆页面
    @RequestMapping("/login")
    public String login(){
        return "forward:/";
    }

    //增加窗口
    @RequestMapping("/add")
    public String add(Worker worker, HttpSession session){
        String id = IDutils.getId();
        worker.setId(id);
        userService.addWorker(worker);
        List<Worker> allWorker = userService.getAllWorker();
        session.setAttribute("allWorker",allWorker);
        return "redirect:/jsp/super/manage.jsp";
    }

    //删除窗口
    @RequestMapping("/delete")
    public String delete(int wid, HttpSession session){
        userService.deleteWorker(wid);
        List<Worker> allWorker = userService.getAllWorker();
        session.setAttribute("allWorker",allWorker);
        return "redirect:/jsp/super/manage.jsp";
    }

    //修改窗口信息
    @RequestMapping("/toUpdate")
    public String toupdate(int wid, HttpSession session){
        Worker workerById = userService.getWorkerById(wid);
        System.out.println(workerById);
        session.setAttribute("workerById",workerById);
        return "super/updateWorker";
    }
    @RequestMapping("/update")
    public String update(Worker worker, HttpSession session){
        /*Worker workerById = (Worker) session.getAttribute("workerById");
        String id = workerById.getId();*/
        System.out.println(worker);
        /*System.out.println(id);*/
        userService.updateWorker(worker);
        List<Worker> allWorker = userService.getAllWorker();
        session.setAttribute("allWorker",allWorker);
        return "redirect:/jsp/super/manage.jsp";
    }

    //查看所有窗口
    @RequestMapping("/getAllWorker")
    public String getAllWorker(HttpSession session){
        List<Worker> allWorker = userService.getAllWorker();
        session.setAttribute("allWorker",allWorker);
        return "super/manage";
    }

    //查看所有学生
    @RequestMapping("/getAllStudent")
    public String getAllStudent(HttpSession session){
        List<Student> allStudent = userService.getAllStudent();
        session.setAttribute("allStudent",allStudent);
        return "super/studentManage";
    }

    //删除学生
    @RequestMapping("/deleteStu")
    public String deleteStu(int sid,HttpSession session){
        System.out.println(sid);
        userService.deleteStudent(sid);
        List<Student> allStudent = userService.getAllStudent();
        session.setAttribute("allStudent",allStudent);
        return "super/studentManage";
    }

    //修改学生信息
    @RequestMapping("/toUpdateStu")
    public String toUpdateStu(int sid, HttpSession session){
        Student studentById = userService.getStudentById(sid);
        session.setAttribute("studentById",studentById);
        return "super/updateStudent";
    }
    @RequestMapping("/updateStudent")
    public String updateStudent(Student student, HttpSession session){
        System.out.println(student);
        userService.updateStudent(student);
        List<Student> allStudent = userService.getAllStudent();
        session.setAttribute("allStudent",allStudent);
        return "super/studentManage";
    }

    //添加学生
    @RequestMapping("/addStudent")
    public String addStudent(Student student, HttpSession session){
        student.setId(IDutils.getId());
        userService.addStudent(student);
        List<Student> allStudent = userService.getAllStudent();
        session.setAttribute("allStudent",allStudent);
        return "super/studentManage";
    }

    //查看全部订单
    @RequestMapping("/getAllDishes")
    public String getAllDishes(HttpSession session){
        List<Dishes> allOrder = userService.getAllOrder();
        session.setAttribute("allOrder",allOrder);
        return "super/dishesManage";
    }

    //删除订单
    @RequestMapping("/deleteDishes")
    public String deleteDis(String did, HttpSession session){
        userService.deleteDishes(did);
        List<Dishes> allOrder = userService.getAllOrder();
        session.setAttribute("allOrder",allOrder);
        return "super/dishesManage";
    }
    //修改订单
    @RequestMapping("/toUpdateDishes")
    public String toUpdateDishes(String did, HttpSession session){
        Dishes dishesById = userService.getDishesById(did);
        session.setAttribute("dishesById",dishesById);
        return "super/updateDishes";
    }
    @RequestMapping("/updateDishes")
    public String updateDishes(Dishes dishes, HttpSession session){
        //System.out.println(dishes);
        userService.updateDishes(dishes);
        List<Dishes> allOrder = userService.getAllOrder();
        session.setAttribute("allOrder",allOrder);
        return "super/dishesManage";
    }
    //增加订单
    @RequestMapping("/addDishes")
    public String addDishes(Dishes dishes, HttpSession session){
        dishes.setDid(IDutils.getId());
        System.out.println(dishes);
        userService.addDishes(dishes);
        List<Dishes> allOrder = userService.getAllOrder();
        session.setAttribute("allOrder",allOrder);
        return "super/dishesManage";
    }
}
