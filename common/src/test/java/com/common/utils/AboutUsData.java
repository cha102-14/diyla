package com.common.utils;

import redis.clients.jedis.Jedis;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;

public class AboutUsData {

    public static void main(String[] args) throws IOException {
        Jedis jedis = new Jedis("localhost", 6379);

        String content = "忙碌的現代社會中，總是為了方便而選擇外食，但是自己動手做，不僅滿足吃甜食的慾望，更能夠揮灑自己的創意和想像力，自己創造甜點、享受、分享。\n" +
                "透過集體活動DIY的過程，促進彼此之間的情感以及平衡忙碌生活下的壓力。\n" +
                "手作甜點DIY的訂位服務，將一切材料、器材、場地的需求解決，只需好好享受做甜點的快樂。\n" +
                "結合師傅的專人指導，讓任何對於DIY甜點有興趣的朋友都可以更容易上手。\n" +
                "整合商店，不管想要器材自己動手，或者直接品嘗都可以在此滿足需求。";

        String imageUrl = "C:/Image/1 (16).jpg";
        byte[] imageBytes = Files.readAllBytes(Paths.get(imageUrl));
        String image = Base64.getEncoder().encodeToString(imageBytes);

        if (content != null) {
            jedis.set("content", content);
        }
        if (image != null) {
            jedis.set("image", "data:image/jpeg;base64," + image);
        }

        jedis.close();
        System.out.println("關於我們新增成功");
    }
}
