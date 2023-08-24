package com.cha102.diyla.back.controller.emp;

import com.cha102.diyla.empmodel.EmpDAO;
import com.cha102.diyla.empmodel.EmpDAOImpl;
import com.cha102.diyla.empmodel.EmpService;
import com.cha102.diyla.empmodel.EmpVO;
import org.springframework.util.ObjectUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/emp/empInsert")
public class EmpInsertController extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String statusStr = req.getParameter("status");
        String authfun = req.getParameter("funcClass");
        /** status 一開始傳入值為字串
         * 因此設條件式statusSTr如果不為空值
         *則透過valueOf將true/false轉為整數1,0
         * */
        Boolean status = null;
        if (!ObjectUtils.isEmpty(statusStr)) {
            status = Boolean.valueOf(statusStr);
        }

// TODO 2.功能類別資料傳到insertController
//      3.Controller至Service 調用查詢功能類別對應各功能細項
        // 建一個List集合放入錯誤訊息

        List<String> errorMsgs = new LinkedList<String>();
        // Store this set in the request scope, in case we need to
        // send the ErrorPage view.
        EmpService empService = new EmpService();
        EmpDAO daoImpl = new EmpDAOImpl();
        EmpVO empVO = empService.insertValidEmpParam(daoImpl, errorMsgs, name, account, password, email, status);


        if (!ObjectUtils.isEmpty(errorMsgs)) {
            req.setAttribute("empVO", empVO);
            req.setAttribute("errorMsgs", errorMsgs);
            RequestDispatcher failureView = req.getRequestDispatcher("/emp/insert.jsp");
            // RequestDispatcher為物件,裡面的failureView方法可設定將資料打包帶往專案的相對路徑
            failureView.forward(req, res);
            return;//程式中斷
        } else {
            empService.empInsert(daoImpl, empVO, authfun);
            req.setAttribute("empVO", empVO);
            String url = "/emp/emplistallshow.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
            successView.forward(req, res);
        }
    }

}
