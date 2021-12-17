package com.abc.dao;

import com.abc.pojo.Student;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Mytest {
    @Test
    public void demo(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentMapper mapper = (StudentMapper) context.getBean("studentMapper");
        Student student = new Student();
        student.setDate("2020-11-11");
        Student studentByPhone = mapper.getStudentByPhone("18738898333");
        System.out.println(studentByPhone);
    }
}
