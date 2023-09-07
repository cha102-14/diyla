package com.cha102.diyla.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class SHAEncodeUtil {
    public static void main(String[] args) {
        String password = "eatmeat"; // 用户密碼
        String setSalt = "SleepAndEat";

        // 生成隨機的鹽值
        byte[] salt = generateSalt();
        // 自定義加鹽
        byte[] setSaltArr = setSalt.getBytes();

        // 雜湊密码
        String hashedPassword = hashPassword(password, setSaltArr);

        System.out.println("原始密碼: " + password);
        System.out.println("鹽值: " + bytesToHex(setSaltArr));
        System.out.println("雜湊密码: " + hashedPassword);
    }

    // 生成隨機的鹽值
    public static byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }

    // 使用SHA-512雜湊密码
    public static String hashPassword(String password, byte[] salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
//            將鹽加入
            md.update(salt);
//            將密碼轉成Byte陣列放入
            byte[] hashedPassword = md.digest(password.getBytes());
//            將 hashedPassword 轉成十六進制
            return bytesToHex(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    // 將字節數組轉換為十六進制字符串
    public static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder(2 * bytes.length);
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
