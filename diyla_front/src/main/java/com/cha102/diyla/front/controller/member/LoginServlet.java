package com.cha102.diyla.front.controller.member;

import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;


@WebServlet("/member/login")
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        List<String> exMsgs = new LinkedList<String>();
        req.setAttribute("exMsgs", exMsgs);
        String action = req.getParameter("action");
        MemberService memSer = new MemberService();
        //登入
        String user = req.getParameter("user");
        String password = req.getParameter("password");
        MemVO memVO = memSer.login(exMsgs,user,password);
        if (!exMsgs.isEmpty()){
            req.setAttribute("memVO",memVO);
            RequestDispatcher failure = req.getRequestDispatcher("/member/mem_login.jsp");
            failure.forward(req,res);
        } else {
            String url = "/";
            HttpSession session = req.getSession();
            session.setAttribute("memVO", memVO);
            res.sendRedirect(req.getContextPath()+"/index.jsp");

        }




    }


//    登入後會有等待畫面或是登入成功畫面後再跳轉？
//    三次密碼錯誤要發驗證信
}
