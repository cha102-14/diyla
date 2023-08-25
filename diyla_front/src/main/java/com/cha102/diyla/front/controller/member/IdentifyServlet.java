package com.cha102.diyla.front.controller.member;

import com.cha102.diyla.member.MemberService;
import redis.clients.jedis.Jedis;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/member/identify")
public class IdentifyServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
        doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");

        String email = req.getParameter("email");
        String identifycode = req.getParameter("identifycode");

        //如果信箱和code一致的話，會員狀態改變
        Jedis jedis = new Jedis("localhost",6379);
        List<String> exMsgs = new ArrayList<String>();
        String tempAuth = jedis.get(email);
        if (!identifycode.equals(tempAuth)){
            exMsgs.add("請輸入正確驗證碼");
        } else {
            MemberService memSer = new MemberService();
            memSer.upStatus(exMsgs,email);
        }

        RequestDispatcher success = req.getRequestDispatcher("/member/mem_login.jsp");
        success.forward(req,res);
        jedis.close();
    }
}
