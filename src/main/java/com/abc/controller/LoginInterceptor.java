package com.abc.controller;


import com.abc.pojo.Student;
import com.abc.pojo.Super;
import com.abc.pojo.Worker;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {


    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //��ȡ�����RUi:ȥ��http:localhost:8080�ⲿ��ʣ�µ�
        String uri = request.getRequestURI();
        //UTL:����login.jsp�ǿ��Թ������ʵģ�������URL���������ؿ���
        if (uri.indexOf("/login") >= 0) {
            return true;
        }
        if (uri.indexOf("/registration") >= 0) {
            return true;
        }
        if (uri.indexOf("/registrationSuccess") >= 0) {
            return true;
        }if (uri.indexOf("/student/add") >= 0) {
            return true;
        }
        //��ȡsession
        HttpSession session = request.getSession();
        Student user = (Student) session.getAttribute("student");
        Worker worker = (Worker) session.getAttribute("worker");
        Super aSuper = (Super) session.getAttribute("super");
        //�ж�session���Ƿ����û����ݣ�����У��򷵻�true����������ִ��
        if (worker != null || user != null || aSuper != null) {
            return true;
        }
        //�����������ĸ�����ʾ��Ϣ����ת������¼ҳ��
        request.setAttribute("prompt", "����û�е�¼�����ȵ�¼��");
        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        return false;
    }


    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }


    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
