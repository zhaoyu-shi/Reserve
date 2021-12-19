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
        //获取请求的RUi:去除http:localhost:8080这部分剩下的
        String uri = request.getRequestURI();
        //UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
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
        //获取session
        HttpSession session = request.getSession();
        Student user = (Student) session.getAttribute("student");
        Worker worker = (Worker) session.getAttribute("worker");
        Super aSuper = (Super) session.getAttribute("super");
        //判断session中是否有用户数据，如果有，则返回true，继续向下执行
        if (worker != null || user != null || aSuper != null) {
            return true;
        }
        //不符合条件的给出提示信息，并转发到登录页面
        request.setAttribute("prompt", "您还没有登录，请先登录！");
        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        return false;
    }


    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }


    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
