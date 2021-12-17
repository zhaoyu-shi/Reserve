package com.abc.utils;

import org.junit.Test;

import java.util.UUID;

@SuppressWarnings("all") //抑制禁止
public class IDutils {

    public static String getId(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    @Test
    public void Test(){
        System.out.println(IDutils.getId());
    }
}
