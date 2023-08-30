package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/createReserveServlet")
public class createReserveServlet extends HttpServlet {
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json");
        PrintWriter out = res.getWriter();
        //處理輸入的json字串
        String json = "";
        try{
            BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()));
            StringBuffer stb = new StringBuffer();
            String line;
            while((line = br.readLine()) != null) {
                stb.append(line);
            }
        json = stb.toString();
        } catch(IOException e) {
            e.printStackTrace();
        }
        JSONObject reserveRequest = new JSONObject(json);
        Integer courseId = reserveRequest.getInt("courseId");
        Integer headcount = reserveRequest.getInt("headcount");
        //暫時設定mem=1, 後續確定了如何取得memberId後再來設定
        Integer memId = 1;
        ClassService classService = new ClassService();
        //抓取目前的系統時間來看是否已超過課程截止時間
        Date currentDate = new Date();
        //判斷該課程是否可預約
        String[] result = classService.confirmUserReserve(courseId,memId,headcount, currentDate);
        //創建json來處理回傳的結果
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("isSuccessful", result[0]);
        jsonObject.put("message", result[1]);
        if (Boolean.parseBoolean(result[0])){
            classService.userAddReserve(courseId, memId, headcount);
            out.print(jsonObject);
            out.flush();
        } else {
            out.print(jsonObject);
            out.flush();
        }
    }

}
