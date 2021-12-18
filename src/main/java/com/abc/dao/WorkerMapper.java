package com.abc.dao;

import com.abc.pojo.Dishes;
import com.abc.pojo.Meal;
import com.abc.pojo.Worker;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkerMapper {
    //按照手机号进行查找
    Worker getWorkerByPhone(String phone);
    //更改密码
    int updateWorkerPwd(@Param("wid") int wid, @Param("wpassword") String wpassword);
    //上传餐品
    int addMeal(Meal meal);
    //遍历所有餐品
    List<Meal> getAllMeal();
    //修改餐品信息
    int updateMeal(Meal meal);
    //删除餐品
    int deleteMeal(String mid);
    //根据mid查
    Meal getMealById(String mid);
    //查看订单
    List<Dishes> getWorkerDishes(int wuid);
}
