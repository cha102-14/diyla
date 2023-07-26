package com.cha102.diyla.back.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/shop/CommodityClassController")
public class CommodityClassController extends HttpServlet {
    CommodityClassService service = new CommodityClassService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");


        if ("insert".equals(action)) {
            String className = req.getParameter("className");

            CommodityClassVO commodityClassVO = new CommodityClassVO();
            commodityClassVO.setComClassName(className);
            int i = service.insert(commodityClassVO);

            if (i > 0) {
                req.setAttribute("message","成功");

            }else {
                req.setAttribute("message","失敗");
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/succeedInsertCommodityClass.jsp"); // webapp/index.jsp or index.html
            requestDispatcher.forward(req,res);
        }
    }
}
