package com.cha102.diyla.back.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/shop/CommodityClassController")
public class CommodityClassController extends HttpServlet {
    CommodityClassService service = new CommodityClassService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");


        if ("insert".equals(action)) {
            HashMap<String, String> errMsgs = new HashMap<>();
            String className = req.getParameter("className");
            if (className == null || className.trim().length() == 0) {
                errMsgs.put("className", "類別名稱不得空白");
            }
            if (!errMsgs.isEmpty()) {
                req.setAttribute("errMsgs", errMsgs);
                RequestDispatcher requestDispatcher= req.getRequestDispatcher("/shop/commodityClassManage.jsp");
                requestDispatcher.forward(req,res);
                return;
            }
            CommodityClassVO commodityClassVO = new CommodityClassVO();
            commodityClassVO.setComClassName(className.trim());
            int i = service.insert(commodityClassVO);

            if (i > 0) {
                req.setAttribute("message","成功");
                ServletContext servletContext = getServletContext();
                List<CommodityClassVO> commodityClassVOS = service.getAll();
            }else {
                req.setAttribute("message","失敗");
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/commodityClassManage.jsp"); // webapp/index.jsp or index.html
            requestDispatcher.forward(req,res);
        }
    }
}
