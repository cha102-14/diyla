package com.cha102.diyla.front.controller.member;

import com.cha102.diyla.front.MailService;
import com.cha102.diyla.member.*;
import redis.clients.jedis.Jedis;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@WebServlet("/member/register")
public class RegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");

        List<String> exMsgs = new LinkedList<String>();
        req.setAttribute("exMsgs",exMsgs);
        Map<String,String> addMap = new LinkedHashMap<String,String>();
        Map<String,String> successMap = new LinkedHashMap<String,String>();

        String name = req.getParameter("newName");
        String email = req.getParameter("user");
        String pw = req.getParameter("password");
        String pwcheck = req.getParameter("pwcheck");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String address = req.getParameter("address");
        String addressAll = city+district+address;
        req.setAttribute("addMap",addMap);
        addMap.put("city",city);
        addMap.put("district",district);
        addMap.put("address",address);
        Integer gender=null;
        try {
            gender = Integer.valueOf(req.getParameter("gender"));
        }catch (NumberFormatException e){
            gender = 0;
            exMsgs.add("請填入性別");
        }

        Date birthday = null;
        try {
            birthday = Date.valueOf(req.getParameter("birthday"));
        }catch (IllegalArgumentException e){
            birthday=new java.sql.Date(System.currentTimeMillis());
            exMsgs.add("請輸入日期");
        }

        if (!pw.equals(pwcheck)){
            exMsgs.add("該密碼與您設定的密碼不一致");
        }
        String addReg = "^[\u4e00-\u9fa5\\w,]+$";
        if (!(address.matches(addReg))){
            exMsgs.add("地址格式只能為中、英文字母、數字和,");
        }


        MemberService memSer = new MemberService();
        MemVO memVO=memSer.addMem(exMsgs,name,email,pw,phone,birthday,gender,addressAll);
        if (!exMsgs.isEmpty()){
            req.setAttribute("mem",memVO);
            req.setAttribute("address",address);
            RequestDispatcher failure = req.getRequestDispatcher("/member/mem_register.jsp");
            failure.forward(req,res);
            return;
        }
        MailService mail = new MailService();
        String s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        String code = "";
        for (int r = 1; r <= 10; r++) {
            code += String.valueOf(s.charAt((int) (Math.random() * 61)));
        }
        String title = "【DIYLA】歡迎加入會員";
        String context = "親愛的DIYLA會員您好，感謝您加入DIYLA，您的驗證碼為"+code+"，完成信箱認證後，才能登入DIYLA使用服務功能。" ;

        Jedis jedis = new Jedis("localhost",6379);
        jedis.set(email,code);
        jedis.expire(email,86400);

        mail.sendEmail(email,title,context);
        RequestDispatcher success = req.getRequestDispatcher("/member/identify.jsp");
        success.forward(req,res);
        jedis.close();
    }
}
//要連接google 信箱

