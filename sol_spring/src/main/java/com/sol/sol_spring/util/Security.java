package com.sol.sol_spring.util;

import java.security.MessageDigest;

public class Security {
    public String convertMD5(String pass) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(pass.getBytes());
            byte[] bytes = md.digest();
            return new String(bytes);
        } catch (Exception e) {
            return null;
        }
    }
}
