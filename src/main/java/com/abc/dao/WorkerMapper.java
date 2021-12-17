package com.abc.dao;

import com.abc.pojo.Worker;
import org.apache.ibatis.annotations.Param;

public interface WorkerMapper {
    //按照手机号进行查找
    Worker getStudentByPhone(String phone);
    //更改密码
    int updateWorkerPwd(@Param("wid") int wid, @Param("wpassword") String wpassword);
}
