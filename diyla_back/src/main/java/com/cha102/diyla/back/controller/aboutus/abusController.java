package com.cha102.diyla.back.controller.aboutus;


import org.json.JSONObject;
import redis.clients.jedis.Jedis;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/aboutus/aboutusContro")
public class abusController extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }


    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // 使用你的 Redis 客戶端庫，將修改後的內容存儲到 Redis 中
        Jedis jedis = new Jedis("localhost", 6379);

        BufferedReader reader = req.getReader();
        StringBuilder strb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            strb.append(line);
        }

        JSONObject datas = new JSONObject(strb.toString());
        String content = datas.getString("content");
        String image = datas.getString("image");

        if (content != null) {
            jedis.set("content", content);
        }
        if (image != null) {
            jedis.set("image", image);
        }
        jedis.close();
        res.getWriter().write("{\"status\": \"success\"}");
    }
}

