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
        HttpSession session = req.getSession();
        //登入
        if("login".equals(action)){
            String user = req.getParameter("user");
            String password = req.getParameter("password");
            MemVO memVO = memSer.login(exMsgs,user,password);
            if (!exMsgs.isEmpty()){
                req.setAttribute("memVO",memVO);
                RequestDispatcher failure = req.getRequestDispatcher("/member/mem_login.jsp");
                failure.forward(req,res);
            } else {
                String url = "/";
                Integer memId =memVO.getMemId();
                session.setAttribute("memVO", memVO);
                session.setAttribute("memId", memId);
                try {
                    String location = (String) session.getAttribute("location");
                    if (location != null) {
                        session.removeAttribute("location"); // 看看有無來源網頁
                        // (-->如有來源網頁:則重導至來源網頁)
                        res.sendRedirect(location);
                        return;
                    }
                } catch (Exception ignored) {
                }
                res.sendRedirect(req.getContextPath()+"/index.jsp");

            }


        }
        //登出
        if ("logout".equals(action)){
            session.removeAttribute("memVO");
            res.sendRedirect(req.getContextPath()+"/index.jsp");
        }
    }
}
