//package com.cha102.diyla.front.controller.shoppingCart;
//
//import java.io.IOException;
//import java.util.ArrayList;
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
//import org.json.JSONObject;
//
//import com.cha102.diyla.commodityModel.CommodityService;
//import com.cha102.diyla.commodityModel.CommodityVO;
//import com.cha102.diyla.member.MemVO;
//import com.cha102.diyla.shoppingcart.ShoppingCartService;
//import com.cha102.diyla.shoppingcart.ShoppingCartVO;
//
//@WebServlet("/shop/ShoppingCartServlet")
//public class ShoppingCartServlet extends HttpServlet {
//	CommodityService commodityService = new CommodityService();
//	ShoppingCartService shoppingCartService = new ShoppingCartService();
//
//	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
//	}
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//
//		HttpSession session = req.getSession();
//		req.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
//
//		List<ShoppingCartVO> shoppingCartList = (ArrayList<ShoppingCartVO>) session.getAttribute("shoppingCartList");
//		List<CommodityVO> comList = null;
//		if ("getAll".equals(action)) {
////			沒有登入就導向導向登入頁面
//			MemVO memVO =(MemVO) session.getAttribute("memVO");
//			if(memVO==null) {
//				System.out.println("no login info");
//				String loginURL ="/member/mem_login.jsp";
//				RequestDispatcher login = req.getRequestDispatcher(loginURL); 
//				login.forward(req, res);
//			}
//			 Integer memId =memVO.getMemId();
//			int totalPrice = 0;
//			shoppingCartList = shoppingCartService.getCartList(Integer.valueOf(memId));// 取出該會員所有購買商品
//			if (shoppingCartList.size() > 0) {
//				totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
//				for (ShoppingCartVO shoppingCartVO : shoppingCartList) {
//					shoppingCartService.setShowPic(shoppingCartVO);
//				}
//			}
//			session.setAttribute("shoppingCartList", shoppingCartList);
//			session.setAttribute("memId", memId);
//			session.setAttribute("totalPrice", totalPrice);
//			String url = "/shoppingCart/listAll.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listAll.jsp
//			successView.forward(req, res);
//
//		}
//		if ("addItem".equals(action)) {
////			===============
////			沒有登入就導向導向登入頁面
//			MemVO memVO =(MemVO) session.getAttribute("memVO");
//			if(memVO==null) {
//				String loginURL ="/member/mem_login.jsp";
//				RequestDispatcher login = req.getRequestDispatcher(loginURL); 
//				login.forward(req, res);
//			}
//			 Integer memId =memVO.getMemId();
////			=================
//			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
//			System.out.println(comNo);
//			Integer amount = Integer.valueOf(req.getParameter("amount"));
//			ShoppingCartVO cartVO = shoppingCartService.addShoppingCart(memId, comNo, amount);
//			if (shoppingCartList == null) {
//				shoppingCartList = new ArrayList<ShoppingCartVO>();
//				shoppingCartList.add(cartVO);
//			} else {
//				shoppingCartList.add(cartVO);
//			}
//			session.setAttribute("memId", memId);
//			session.setAttribute("shoppingCartList", shoppingCartList);
//			 JSONObject jsonResponse = new JSONObject();
//	            jsonResponse.put("success", true);
//	            res.setContentType("application/json");
//	            res.getWriter().write(jsonResponse.toString());
//		}
//		//修改數量
//		if ("changeAmount".equals(action)) {
//			Integer memId = (Integer) session.getAttribute("memId");
//			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
//			Integer amount = Integer.valueOf(req.getParameter("amount"));
//			ShoppingCartVO cartVO = new ShoppingCartVO(memId, comNo, amount);
//			if (amount == 0) {
//				// 更改之數量為0
//				shoppingCartService.delete(memId, comNo);
//				shoppingCartList.removeIf(delCartVO -> delCartVO.getComNo() == comNo && delCartVO.getMemId() == memId);
//			} else {
//
//				cartVO = shoppingCartService.update(memId, comNo, amount);
//				for (int i = 0; i < shoppingCartList.size(); i++) {
//					ShoppingCartVO existingCartItem = shoppingCartList.get(i);
//					if (cartVO.getComNo() == existingCartItem.getComNo()
//							&& cartVO.getMemId() == existingCartItem.getMemId()) {
//						existingCartItem.setComAmount(amount);
//						break;
//					}
//				}
//			}
//			int totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
//			session.setAttribute("totalPrice", totalPrice);
//			session.setAttribute("shoppingCartList", shoppingCartList);
//			  JSONObject jsonResponse = new JSONObject();
//	            jsonResponse.put("success", true);
//	            res.setContentType("application/json");
//	            res.getWriter().write(jsonResponse.toString());
//		}
//
//		if ("delete".equals(action)) {
//			  Integer memId = Integer.valueOf(req.getParameter("memId"));
//	            Integer comNo = Integer.valueOf(req.getParameter("comNo"));
//
//	            // 刪除購物車項目
//	            ShoppingCartService shoppingCartService = new ShoppingCartService();
//	            shoppingCartService.delete(memId, comNo);
//
//	            // 返回JSON響應表示刪除成功
//	            JSONObject jsonResponse = new JSONObject();
//	            jsonResponse.put("success", true);
//	            res.setContentType("application/json");
//	            res.getWriter().write(jsonResponse.toString());
//
//		}
//		//整個清空
//		if ("clear".equals(action)) {
//			Integer memId = (Integer) session.getAttribute("memId");
//			shoppingCartService.clear(memId);
//			shoppingCartList.removeAll(shoppingCartList);
//			int totalPrice = 0;
//			session.setAttribute("totalPrice", totalPrice);
//			session.setAttribute("shoppingCartList", shoppingCartList);
//			JSONObject jsonResponse = new JSONObject();
//            jsonResponse.put("success", true);
//            res.setContentType("application/json");
//            res.getWriter().write(jsonResponse.toString());
//		}
//	}
//}