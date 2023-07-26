package com.cha102.diyla.back.controller.shop;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop/CommodityController")
public class CommodityController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        String categoryId = req.getParameter("categoryId");

        
        if ("insert".equals(action)) {
            System.out.println(action);
            req.setAttribute("categoryId",categoryId);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/succeedInsertCommodityClass.jsp"); // webapp/index.jsp or index.html
            requestDispatcher.forward(req,res);
        }
    }
}
