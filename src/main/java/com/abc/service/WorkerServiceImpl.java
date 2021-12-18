package com.abc.service;

import com.abc.dao.WorkerMapper;
import com.abc.pojo.Dishes;
import com.abc.pojo.Meal;
import com.abc.pojo.Worker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkerServiceImpl implements WorkerService {
    @Autowired
    private WorkerMapper workerMapper;

    public Worker getWorkerByPhone(String phone) {
        return workerMapper.getWorkerByPhone(phone);
    }

    public int updateWorkerPwd(int wid, String wpassword) {
        return workerMapper.updateWorkerPwd(wid,wpassword);
    }

    public int addMeal(Meal meal) {
        return workerMapper.addMeal(meal);
    }

    public List<Meal> getAllMeal() {
        return workerMapper.getAllMeal();
    }

    public int updateMeal(Meal meal) {
        return workerMapper.updateMeal(meal);
    }

    public int deleteMeal(String mid) {
        return workerMapper.deleteMeal(mid);
    }

    public Meal getMealById(String mid) {
        return workerMapper.getMealById(mid);
    }

    public List<Dishes> getWorkerDishes(int wuid) {
        return workerMapper.getWorkerDishes(wuid);
    }
}
