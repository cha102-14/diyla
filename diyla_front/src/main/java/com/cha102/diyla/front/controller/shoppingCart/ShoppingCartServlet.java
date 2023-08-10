package com.cha102.diyla.front.controller.shoppingCart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.cha102.diyla.commodityModel.CommodityService;

import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;
import com.cha102.diyla.shoppongcart.ShoppingCartDaoImpl;
import com.cha102.diyla.shoppongcart.ShoppingCartService;

@WebServlet("/shoppingCart/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
//	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		Integer memId = Integer.valueOf(req.getParameter("memId"));
		if ("getAll".equals(action)) {
			// ***************************2.開始查詢資料*****************************************/
//			ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
			List<ShoppingCartVO> shoppingCartList = shoppingCartService.getAll(Integer.valueOf(memId));
			req.setAttribute("shoppingCartList", shoppingCartList);
			req.setAttribute("memId", memId);
			String url = "/shoppingCart/listAll.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);

		}
	}
}