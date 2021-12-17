package com.abc.service;

import com.abc.pojo.Worker;
import org.apache.ibatis.annotations.Param;

public interface WorkerService {
    //按照手机号进行查找
    Worker getStudentByPhone(String phone);
    //更改密码
    int updateWorkerPwd( int wid, String wpassword);
}
