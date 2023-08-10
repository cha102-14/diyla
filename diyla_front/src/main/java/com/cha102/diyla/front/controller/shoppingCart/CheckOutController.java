package com.cha102.diyla.front.controller.shoppingCart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.shoppongcart.ShoppingCartService;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;

public class CheckOutController extends HttpServlet {
	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
		 List<ShoppingCartVO> shoppingCartList = (ArrayList<ShoppingCartVO>) session.getAttribute("shoppingCartList");
		 String action = req.getParameter("action");
		 MemVO memVo=null;
		 if("checkout".equals(action)) {
			 
		 }
		
	}
}
