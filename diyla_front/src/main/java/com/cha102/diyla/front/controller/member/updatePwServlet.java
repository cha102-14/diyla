package com.cha102.diyla.front.controller.member;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.front.MailService;
import com.cha102.diyla.member.*;

import javax.servlet.RequestDispatcher;
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
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/member/updatePw")
public class updatePwServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        doPost(req, res);
    }

    public JSONObject getFetchPostRequest(HttpServletRequest req) throws IOException {
        int contentLength = req.getContentLength();
        byte[] bytes = new byte[contentLength];
        for(int i=0; i < contentLength;){
            int readLen = req.getInputStream().read(bytes, i, contentLength - 1);
            if(readLen == -1){
                break;
            }
            i+= readLen;
        }
        String s = new String(bytes);
        System.out.println(s);
        JSONObject jsonObject = JSONObject.parseObject(s);
        return jsonObject;
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");


        List<String> exMsgs = new LinkedList<String>();
        req.setAttribute("exMsgs", exMsgs);
        String action = req.getParameter("action");


        MailService mailService = new MailService();
        //臨時密碼隨機
        String s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        String code = "";
        for (int r = 1; r <= 10; r++) {
            code += String.valueOf(s.charAt((int) (Math.random() * 61)));
        }

        //忘記密碼
        JSONObject fetchPostRequest = getFetchPostRequest(req);
        String email = fetchPostRequest.getString("email");
        String phone = fetchPostRequest.getString("phonenumber");
//        if (email ==null||email.isEmpty()){
//            res.getWriter().write("ng");
//        }
//        if (phone ==null||phone.isEmpty()){
//            res.getWriter().write("ng");
//        }
        MemberService memSer = new MemberService();
        MemVO memVO = memSer.forgetPw(exMsgs, email, phone);
        if (memVO !=null) {
            String title = "【DIYLA】密碼重置信";
            String context = "親愛的會員您好，您的臨時密碼為" + code + "，請登入並盡快修改密碼";
            mailService.sendEmail(email, title, context);
            memSer.updateNewPw(exMsgs, code, email);
            res.getWriter().write("success");
            return;
        } else {
            res.getWriter().write("ng");
        }
        HttpSession session = req.getSession();
        session.setAttribute("memVO", memVO);

        //忘記密碼
//        if ("forgetPw".equals(action)) {
//            String email = req.getParameter("email");
//            String phone = req.getParameter("phonenumber");
//            MemVO memVO = memSer.forgetPw(exMsgs, email, phone);
//
//
//            String title = "【DIYLA】密碼重置信";
//            String context = "親愛的會員您好，您的臨時密碼為"+code+"，請點選以下連結輸入臨時密碼並盡快修改密碼";
//            if (exMsgs.isEmpty()){
//                mailService.sendEmail(email,title,context);
//                memSer.updateNewPw(exMsgs,code,email);
//                JSONObject fetchPostRequest = getFetchPostRequest(req);
//                System.out.println(fetchPostRequest.getString("email"));
//                System.out.println(fetchPostRequest.getString("phonenumber"));
//
//            }
//            req.setAttribute("memVO",memVO);
//
//
//            }

//        修改密碼
        if ("updatePw".equals(action)) {
            String upemail = req.getParameter("upemail");
            String upPw = req.getParameter("upPw");
            String upPwcheck = req.getParameter("upPwcheck");

            if (!upPwcheck.equals(upPw)){
                exMsgs.add("該密碼與您設定的密碼不一致");
            }

            MemVO mem = memSer.updateNewPw(exMsgs,upPw,upemail);

            session.setAttribute("memVO", mem);
            RequestDispatcher failure = req.getRequestDispatcher("/member/updatePw.jsp");
            failure.forward(req, res);

        }

    }
}
