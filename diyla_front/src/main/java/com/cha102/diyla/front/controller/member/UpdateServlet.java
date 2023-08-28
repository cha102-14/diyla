package com.cha102.diyla.front.controller.member;

import com.cha102.diyla.member.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/member/update")
public class UpdateServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        Map<String,String> exMsgs = new LinkedHashMap<String,String>();
        req.setAttribute("exMsgs",exMsgs);
        Integer memId = null;
        try{
            memId = Integer.valueOf(req.getParameter("memId"));
        }catch (NumberFormatException n){
            n.printStackTrace();
        }

        String password = req.getParameter("password");
        String pwcheck = req.getParameter("pwcheck");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String address = req.getParameter("address");
        String addressAll = city+district+address;

        MemberService memSer = new MemberService();
        if (!password.equals(pwcheck)){
            exMsgs.put("pwcheck","該密碼與您設定的密碼不一致");
        }
        MemVO memVO = memSer.updateMem(exMsgs,password,phone,addressAll,memId);
        HttpSession session = req.getSession();
        session.setAttribute("memVO", memVO);
        RequestDispatcher select = req.getRequestDispatcher("/member/mem_update.jsp");
        select.forward(req,res);


    }
}
