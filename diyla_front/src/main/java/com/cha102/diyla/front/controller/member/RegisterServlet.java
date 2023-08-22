package com.cha102.diyla.front.controller.member;

import com.cha102.diyla.front.MailService;
import com.cha102.diyla.member.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

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

        String name = req.getParameter("newName");
        String email = req.getParameter("user");
        String pw = req.getParameter("password");
        String pwcheck = req.getParameter("pwcheck");
        String phone = req.getParameter("phone");
        String county = req.getParameter("county");
        String district = req.getParameter("district");
        String address = req.getParameter("address");
        String addressAll = county+district+address;
        Integer gender=null;
        Date birthday = null;
        try {
            gender = Integer.valueOf(req.getParameter("gender"));
        }catch (NumberFormatException e){
            gender = 0;
            exMsgs.add("請填入性別");
        }


        try {
            birthday = Date.valueOf(req.getParameter("birthday"));
        }catch (IllegalArgumentException e){
            birthday=new java.sql.Date(System.currentTimeMillis());
            exMsgs.add("請輸入日期");
        }

        if (!pw.equals(pwcheck)){
            exMsgs.add("該密碼與您設定的密碼不一致");
        }

        MemberService memSer = new MemberService();
        MemVO memVO=memSer.addMem(exMsgs,name,email,pw,phone,birthday,gender,addressAll);
        if (!exMsgs.isEmpty()){
            req.setAttribute("memVO",memVO);
            RequestDispatcher failure = req.getRequestDispatcher("/member/mem_register.jsp");
            failure.forward(req,res);
            return;
        }

        MailService mail = new MailService();
        String title = "【DIYLA】歡迎加入會員";
        String context = "親愛的DIYLA會員您好，感謝您加入DIYLA，很高興能為您服務，請點選以下連結完成信箱認證。" +
                "\\n提醒您，您必須完成信箱認證，才能登入DIYLA使用服務功能。" +
                "\\n此為系統發出信件，請勿直接回覆，感謝您的配合，謝謝！";
        mail.sendEmail(email,title,context);
        RequestDispatcher success = req.getRequestDispatcher("/member/mem_login.jsp");
        success.forward(req,res);

    }
}
//要連接google 信箱
//發認證信

