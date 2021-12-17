package com.abc.service;

import com.abc.dao.WorkerMapper;
import com.abc.pojo.Worker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkerServiceImpl implements WorkerService {
    @Autowired
    private WorkerMapper workerMapper;

    public Worker getStudentByPhone(String phone) {
        return workerMapper.getStudentByPhone(phone);
    }

    public int updateWorkerPwd(int wid, String wpassword) {
        return workerMapper.updateWorkerPwd(wid,wpassword);
    }
}
