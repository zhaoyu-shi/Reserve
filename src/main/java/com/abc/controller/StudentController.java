package com.abc.controller;

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
        }else if (phone.equals("501") && rank != null ){
            if (password.equals("123")){
                List<Worker> allWorker = userService.getAllWorker();
                session.setAttribute("allWorker",allWorker);
                url = "super/manage";
            }

        }else {
            Worker workerByPhone = workerService.getStudentByPhone(phone);
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

}
