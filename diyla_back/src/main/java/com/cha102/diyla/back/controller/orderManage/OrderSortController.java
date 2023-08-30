//package com.cha102.diyla.back.controller.orderManage;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.cha102.diyla.commodityModel.CommodityService;
//import com.cha102.diyla.commodityOrder.CommodityOrderService;
//import com.cha102.diyla.commodityOrder.CommodityOrderVO;
//
//@WebServlet("/orderManage/OrderSortController")
//public class OrderSortController extends HttpServlet {
//	CommodityService commodityService = new CommodityService();
//	CommodityOrderService commodityOrderService = new CommodityOrderService();
//
//	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		String action = req.getParameter("action");
//		if ("sortByOrderNo".equals(action)) {
//			List<CommodityOrderVO> list = commodityOrderService.sortByOrderNo();
//			session.setAttribute("commodityOrderVOList", list);
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/ordermanage/ordermanage.jsp");
//			dispatcher.forward(req, res);
//
//		}
//		if ("sortByActualPrice".equals(action)) {
//			List<CommodityOrderVO> list = commodityOrderService.sortByActualPrice();
//			session.setAttribute("commodityOrderVOList", list);
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/ordermanage/ordermanage.jsp");
//			dispatcher.forward(req, res);
//
//		}
//	}
//
//}