package com.cha102.diyla.back.controller.desertcourse.blobreader;

import java.util.Base64;

public class Base64Converter {
    public static String byteArrayToBase64(byte[] byteArray) {
        return Base64.getEncoder().encodeToString(byteArray);
    }
}