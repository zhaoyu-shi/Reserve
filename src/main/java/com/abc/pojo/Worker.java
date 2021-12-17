package com.abc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Worker {
    private int wid;
    private String wname;
    private String wpassword;
    private String wphone;
    private String id;
}
