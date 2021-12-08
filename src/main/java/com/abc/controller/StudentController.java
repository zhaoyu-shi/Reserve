package com.abc.controller;

import com.abc.pojo.Student;
import com.abc.service.StudentService;
import com.abc.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private WorkerService workerService;

    @RequestMapping("/register")
    public String register(Student student){
        return null;
    }
}
