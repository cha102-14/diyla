package com.cha102.diyla.front.controller.contactus;

import com.cha102.diyla.front.MailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/contactus/ContactUsController")
public class ContactUsController extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");

        if ("send_mail".equals(action)) {
            String memName = req.getParameter("memName");
            String memEmail= req.getParameter("memEmail");
            String category=req.getParameter("category");
            String mailTitle=req.getParameter("mailTitle");
            String mailContext=req.getParameter("mailContext");
            String str = "會員Email是:\t" + memEmail + "\n"
                        +  memName + "\t反應:\n"
                        + category +"問題:" + mailContext;
            String emailTO = "tibame515@gmail.com";
            MailService mailSvc = new MailService();
            mailSvc.sendEmail(emailTO,mailTitle,str);

            res.sendRedirect(req.getContextPath()+"/index.jsp");
        }

    }
}
