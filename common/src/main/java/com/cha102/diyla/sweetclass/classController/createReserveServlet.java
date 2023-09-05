package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import com.cha102.diyla.sweetclass.email.MailService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/createReserveServlet")
public class createReserveServlet extends HttpServlet {
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //宣告用的到的物件或處理res/req
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        ClassService classService = new ClassService();
        MailService mailService = new MailService();
        //處理輸出的json字串
        String json = "";
        //抓取目前session內的會員id
        //Integer memId = (Integer)session.getAttribute("memId");
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
        //獲取用的到的參數
        Integer courseId = reserveRequest.getInt("courseId");
        Integer headcount = reserveRequest.getInt("headcount");
        ClassVO reqCourse = classService.getOneClass(courseId);
        Date regEndDate = reqCourse.getRegEndTime();
        Integer courseStatus = reqCourse.getClassStatus();
        Integer courseLimit = reqCourse.getClassLimit();
        //暫時設定mem=1, session內有memberId後再來去除
        Integer memId = 1;
        MemberService memberService = new MemberService();
        MemVO member = memberService.selectMem(memId);
        String to = member.getMemEmail();
        String memName = member.getMemName();
        //抓取目前的系統時間來看是否已超過課程截止時間
        Date currentDate = new Date();
//        if (currentDate.after(regEndDate)) {
//            errorMessage.add("該課程已過報名時間!");
//        }
        //判斷該課程是否可預約
        String[] result = classService.confirmUserReserve(courseId,memId,headcount, currentDate);
        //創建json來處理回傳的結果
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("isSuccessful", result[0]);
        jsonObject.put("message", result[1]);
        if (Boolean.parseBoolean(result[0])){
            classService.userAddReserve(courseId, memId, headcount);
            mailService.sendMail(to, memName, "createReserve");
            out.print(jsonObject);
            out.flush();
        } else {
            out.print(jsonObject);
            out.flush();
        }
    }

}
