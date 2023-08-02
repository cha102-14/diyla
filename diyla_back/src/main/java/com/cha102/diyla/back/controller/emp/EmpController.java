package com.cha102.diyla.back.controller.emp;

import com.cha102.diyla.empmodel.EmpDAO;
import com.cha102.diyla.empmodel.EmpDAOImpl;
import com.cha102.diyla.empmodel.EmpVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

@WebServlet("/emp/empFun")
public class EmpController extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("getOne_For_Display".equals(action)) {
            String id = req.getParameter("id");
            EmpDAO dao = new EmpDAOImpl();
            EmpVO empVo = dao.getOne(Integer.valueOf(id));
//            EmpVO byPrimaryKey = dao.findByPrimaryKey(Integer.valueOf("id")).var;
            /***************************3.查詢完成,準備轉交(Send the Success view)*************/
            req.setAttribute("empVO", empVo); // 資料庫取出的empVO物件,存入req
            String url = "/emp/show.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 show.jsp
            successView.forward(req, res);
        }
//        HttpSession session = req.getSession();
//        session.setAttribute("empVO",action);
    }

}
