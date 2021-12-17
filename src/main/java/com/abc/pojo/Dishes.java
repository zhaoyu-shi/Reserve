package com.abc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dishes {
    private String did;
    private String dname;
    private String price;
    private int wuid;
    private int suid;
    private String num;
}
