package com.cha102.diyla.back.controller.emp;

import com.cha102.diyla.empmodel.EmpDAO;
import com.cha102.diyla.empmodel.EmpDAOImpl;
import com.cha102.diyla.empmodel.EmpService;
import com.cha102.diyla.empmodel.EmpVO;
import org.springframework.util.ObjectUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet("/emp/empInsert")
//fileSizeThreshold = 0 * 1024 * 1024, // 檔案大小閾值，超過這個大小的檔案會被寫入磁碟，否則存儲在記憶體中
// maxFileSize = 1 * 1024 * 1024,      // 單個檔案的最大大小，這裡設定為 1MB
//maxRequestSize = 10 * 1024 * 1024   // 整個 HTTP 請求的最大大小，包括所有檔案和其他表單數據，這裡設定為 10MB
@MultipartConfig(fileSizeThreshold = 0 * 1024 * 1024, maxFileSize = 1 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class EmpInsertController extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String account = req.getParameter("account");
        // 修改前端為 password ->empPassword
        String password = (String) req.getAttribute("empPassword");
        String email = req.getParameter("email");
        String statusStr = req.getParameter("status");
        String authfun = req.getParameter("funcClass");
        Part picPart = req.getPart("upFiles");
        byte[] pic = ObjectUtils.isEmpty(picPart.getInputStream().readAllBytes()) ? null : picPart.getInputStream().readAllBytes();

        /** status 一開始傳入值為字串
         * 因此設條件式statusSTr如果不為空值
         *則透過valueOf將true/false轉為整數1,0
         * */
        Boolean status = null;
        if (!ObjectUtils.isEmpty(statusStr)) {
            status = Boolean.valueOf(statusStr);
        }

//  2.功能類別資料傳到insertController
//      3.Controller至Service 調用查詢功能類別對應各功能細項
        // 建一個List集合放入錯誤訊息

        Map<String, String> errorMsgMap = (ConcurrentHashMap)req.getAttribute("errorMsgMap");
        // Store this set in the request scope, in case we need to
        // send the ErrorPage view.
        EmpService empService = new EmpService();
        EmpDAO daoImpl = new EmpDAOImpl();
        EmpVO empVO = empService.insertValidEmpParam(pic, daoImpl, errorMsgMap, name, account, password, email, status);


        if (!ObjectUtils.isEmpty(errorMsgMap)) {
            empVO.setEmpPassword("");
            req.setAttribute("empVO",empVO);
            req.setAttribute("errorMsgMap", errorMsgMap);
            RequestDispatcher failureView = req.getRequestDispatcher("/emp/insert.jsp");
            // RequestDispatcher為物件,裡面的failureView方法可設定將資料打包帶往專案的相對路徑
            failureView.forward(req, res);
            return;//程式中斷
        } else {
            empService.empInsert(daoImpl, empVO, authfun);
            req.setAttribute("empVO", empVO);
            String url = "/emp/empShowAll.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
            successView.forward(req, res);
        }
    }

}
