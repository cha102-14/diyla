package com.cha102.diyla.back.controller.emp;

import com.cha102.diyla.empmodel.EmpDAO;
import com.cha102.diyla.empmodel.EmpDAOImpl;
import com.cha102.diyla.empmodel.EmpService;
import com.cha102.diyla.empmodel.EmpVO;
import org.springframework.util.ObjectUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/emp/empFun") // form表單送入的ACTION對應路徑註冊在WebServlet
//另一種註冊在Web的 XML檔裡面
public class EmpGetOneController extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String idStr = req.getParameter("id");
        EmpService empService = new EmpService();
        List<String> errorMsgs = new LinkedList<String>();
        EmpVO empVO = empService.empGetOne(errorMsgs, idStr);
        /***************************3.查詢完成,準備轉交(Send the Success view)*************/
        if (!ObjectUtils.isEmpty(errorMsgs) || ObjectUtils.isEmpty(empVO)) {
            req.setAttribute("errorMsgs", errorMsgs);
            RequestDispatcher failureView = req.getRequestDispatcher("/emp/form.jsp");
            failureView.forward(req, res);
            return;//程式中斷
        } else {
            req.setAttribute("empVO", empVO); // 資料庫取出的empVO物件,存入req
            String url = "/emp/show.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 show.jsp
            successView.forward(req, res);
        }
    }
}
