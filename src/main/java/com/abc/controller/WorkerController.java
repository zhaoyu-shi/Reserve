package com.abc.controller;

import com.abc.pojo.Dishes;
import com.abc.pojo.Meal;
import com.abc.pojo.Student;
import com.abc.pojo.Worker;
import com.abc.service.WorkerService;
import com.abc.utils.IDutils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/worker")
public class WorkerController {
    @Autowired
    private WorkerService workerService;

    @RequestMapping("/find")
    public String find(String wphone, HttpSession session){
        Worker workerByPhone = workerService.getWorkerByPhone(wphone);
        session.setAttribute("worker",workerByPhone);
        return "worker/person";
    }

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

    @RequestMapping("/getAllMeal")
    public String getAllMeal(HttpSession session){
        List<Meal> allMeal = workerService.getAllMeal();
        session.setAttribute("allMeal",allMeal);
        return "worker/allMeal";
    }

    @RequestMapping("/toUpdateMeal")
    public String toUpdateMeal(String mid, HttpSession session){
        //System.out.println("2222");
        Meal maelById = workerService.getMealById(mid);
       // System.out.println("111");
        System.out.println(maelById);
        session.setAttribute("mealById",maelById);
        return "worker/updateMeal";
    }
    @RequestMapping("/updateMeal")
    public String updateMeal(Meal meal, HttpSession session){
       // System.out.println(meal);
        workerService.updateMeal(meal);
        List<Meal> allMeal = workerService.getAllMeal();
        session.setAttribute("allMeal",allMeal);
        return "worker/allMeal";
    }

    @RequestMapping("/deleteMeal")
    public String deleteMeal(String mid, HttpSession session){
        workerService.deleteMeal(mid);
        List<Meal> allMeal = workerService.getAllMeal();
        session.setAttribute("allMeal",allMeal);
        return "worker/allMeal";
    }

    @RequestMapping("/getWorkerDishes")
    public String getWorkerDishes(int wuid, HttpSession session){
        List<Dishes> workerDishes = workerService.getWorkerDishes(wuid);
        session.setAttribute("workerDishes",workerDishes);
        return "worker/dishesManage";
    }

    /*
     * 采用file.Transto 来保存上传的文件
     */
    @RequestMapping("/upload")
    public String  fileUpload2(Meal meal, HttpSession session) {

        // //上传路径保存设置
        // String path = request.getSession().getServletContext().getRealPath("/upload");
        // File realPath = new File(path);
        // if (!realPath.exists()){
        //     realPath.mkdir();
        // }
        // //上传文件地址
        // System.out.println("上传文件保存地址："+realPath);
        //
        // //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        // file.transferTo(new File(realPath +"/"+ file.getOriginalFilename()));

        meal.setMid(IDutils.getId());
        System.out.println(meal);
        workerService.addMeal(meal);

        List<Meal> allMeal = workerService.getAllMeal();
        session.setAttribute("allMeal",allMeal);

        return "worker/allMeal";
    }


}
