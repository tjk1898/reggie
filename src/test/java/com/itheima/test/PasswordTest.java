package com.itheima.test;

import org.springframework.util.DigestUtils;

/**
 * Created by jinkun.tian on 2023/4/12
 */
public class PasswordTest {
    public static void main(String[] args) throws Exception {
        String opwd = "czjt2023dsj";
        String pwd = DigestUtils.md5DigestAsHex(opwd.getBytes());
        System.out.println(pwd);
    }
}
