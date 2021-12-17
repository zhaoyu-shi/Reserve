package com.abc.controller;

import com.abc.pojo.Student;
import com.abc.pojo.Worker;
import com.abc.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/worker")
public class WorkerController {
    @Autowired
    private WorkerService workerService;

    @RequestMapping("/password")
    @ResponseBody
    public String updateStudentPassWord(String oldpassword, String newpassword, HttpSession session, Model model){
        Worker worker = (Worker) session.getAttribute("worker");
        // System.out.println(worker);
        // System.out.println(oldpassword);
        // System.out.println(newpassword);
        String result = "";
        int wid =worker.getWid() ;   //从session中获取

        if(oldpassword.equals(worker.getWpassword())){
            workerService.updateWorkerPwd(wid,newpassword);
            result = "true";
        }else{
            result = "false";
        }

        return result;
    }
}
