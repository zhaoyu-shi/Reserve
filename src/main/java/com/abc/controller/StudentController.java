package com.abc.controller;

import com.abc.pojo.*;
import com.abc.service.StudentService;
import com.abc.service.UserService;
import com.abc.service.WorkerService;
import com.abc.utils.IDutils;
import org.apache.ibatis.javassist.SerialVersionUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private WorkerService workerService;
    @Autowired
    private UserService userService;

    @RequestMapping("/add")
    public String register(Student student){
        System.out.println("注册====>"+student);
        student.setId(IDutils.getId());
        studentService.addStudent(student);
        return "registerSuccess";
    }

    @RequestMapping("/login")
    public String login(String phone, String password, String rank, HttpSession session){
        String prompt = "用户名与密码错不匹配！"; //提示信息;
        String url="forward:/user/login";
         //System.out.println(rank);
         // System.out.println(phone);
         // System.out.println(password);
        if(rank == null){
            Student studentByPhone = studentService.getStudentByPhone(phone);
            System.out.println("登录====>"+studentByPhone);
            if (studentByPhone != null){
                if (studentByPhone.getSpassword().equals(password)){
                    session.setAttribute("student",studentByPhone);
                    url = "student/person";
                }
            }
        }else if (userService.getSuperById(phone)!=null && rank != null ){
            if (userService.getSuperById(phone).getPassword().equals(password)){
                Super superById = userService.getSuperById(phone);
                session.setAttribute("super",superById);
                List<Worker> allWorker = userService.getAllWorker();
                session.setAttribute("allWorker",allWorker);
                url = "super/manage";
            }

        }else {
            Worker workerByPhone = workerService.getWorkerByPhone(phone);
            if (workerByPhone != null){
                if (workerByPhone.getWpassword().equals(password)){
                    session.setAttribute("worker",workerByPhone);
                    url = "worker/person";
                }
            }
        }
        session.setAttribute("prompt",prompt);
        //System.out.println(prompt);
        return url;
    }

    @RequestMapping("/update")
    public String update(Student student){
        System.out.println(student);
        studentService.updateStudent(student);
        return "student/person";
    }

    @RequestMapping("/password")
    @ResponseBody
    public String updateStudentPassWord(String oldpassword,String newpassword,HttpSession session,Model model){
        Student student = (Student) session.getAttribute("student");
        String result = "";
        int sid =student.getSid() ;   //从session中获取
        // System.out.println(sid);
        // System.out.println(oldpassword);
        // System.out.println(newpassword);
        if(oldpassword.equals(student.getSpassword())){
            studentService.updateStudentPwd(sid,newpassword);
            result = "true";
        }else{
            result = "false";
        }

        return result;
    }

    //退出登录，清除session
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "login";
    }

    @RequestMapping("/find")
    public String find(String sphone, HttpSession session){
        Student studentByPhone = studentService.getStudentByPhone(sphone);
        session.setAttribute("student",studentByPhone);
        return "student/person";
    }

    @RequestMapping("/getAllMeal")
    public String getAllMeal(HttpSession session){
        List<Meal> allMeal = studentService.getAllMeal();
        session.setAttribute("allMeal",allMeal);
        return "student/allMeal";
    }

    @RequestMapping("/getStudentDishes")
    public String getStudentDishes(int suid , HttpSession session){
        List<Dishes> allStudentDishes = studentService.getAllStudentDishes(suid);
        System.out.println(allStudentDishes);
        session.setAttribute("dishes",allStudentDishes);
        return "student/dishes";
    }

    @RequestMapping("/toOrder")
    public String toUpdateMeal(String mid, int suid, HttpSession session){
        //System.out.println("2222");
        session.setAttribute("orderMid",suid);
        Meal maelById = workerService.getMealById(mid);
        // System.out.println("111");
        //System.out.println(maelById);
        session.setAttribute("mealById",maelById);
        System.out.println(maelById);
        return "student/order";
    }
    @RequestMapping("/order")
    public String updateMeal(Dishes dishes, HttpSession session){
        //System.out.println("111");
        dishes.setDid(IDutils.getId());
        //System.out.println(dishes);
        studentService.addDishes(dishes);
        List<Dishes> allSDishes = studentService.getStudentDishesing(dishes.getSuid());
        //System.out.println("all+"+allSDishes);
        /*
        * 上面的allStudentDishes是集合 控制台也有输出 确实是多个 但是在放在session时却变成了单个的对象
        * */
        session.setAttribute("studentDishesing",allSDishes);

        return "student/dishesing";
    }

    @RequestMapping("/getStudentDishesing")
    public String getStudentDishesing(int suid , HttpSession session) {
        List<Dishes> studentDishesing = studentService.getStudentDishesing(suid);
        System.out.println(studentDishesing);
        session.setAttribute("studentDishesing", studentDishesing);
        return "student/dishesing";
    }

    @RequestMapping("/state")
    public String state( String did, HttpSession session){
        // System.out.println("111");
        // System.out.println(did);
        studentService.changeState(did);
        Student student = (Student) session.getAttribute("student");
        List<Dishes> studentDishesing = studentService.getStudentDishesing(student.getSid());
        session.setAttribute("studentDishesing", studentDishesing);
        return "student/dishesing";
    }

}
