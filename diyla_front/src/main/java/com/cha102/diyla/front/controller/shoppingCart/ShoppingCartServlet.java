package com.cha102.diyla.front.controller.shoppingCart;

import java.io.IOException;
import java.util.ArrayList;
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
import com.cha102.diyla.shoppongcart.ShoppingCartService;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;

@WebServlet("/shop/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

//		session.getAttribute("memId");

		List<ShoppingCartVO> shoppingCartList = (ArrayList<ShoppingCartVO>) session.getAttribute("shoppingCartList");
		List<CommodityVO> comList = null;
		if ("getAll".equals(action)) {
//			ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
			Integer memId = Integer.valueOf(req.getParameter("memId"));
			shoppingCartList = shoppingCartService.getAll(Integer.valueOf(memId));// 取出該會員所有購買商品

			int totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			session.setAttribute("shoppingCartList", shoppingCartList);
			session.setAttribute("memId", memId);
			session.setAttribute("totalPrice", totalPrice);
			String url = "/shoppingCart/listAll.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listAll.jsp
			successView.forward(req, res);

		}
		if ("addItem".equals(action)) {
			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
			Integer amount = Integer.valueOf(req.getParameter("amount"));
			Integer memId = (Integer) session.getAttribute("memId");
			ShoppingCartVO cartVO = shoppingCartService.addShoppingCart(memId, comNo, amount);
			if (shoppingCartList == null) {
				shoppingCartList = new ArrayList<ShoppingCartVO>();
				shoppingCartList.add(cartVO);
			} else {
				shoppingCartList.add(cartVO);
			}
//			session.setAttribute("commodityVO", commodityVO);
			int totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("shoppingCartList", shoppingCartList);
			res.sendRedirect(req.getContextPath() +  "/shop/CommodityController?action=findByID&comNO="+comNo);

		}
		if ("changeAmount".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
			Integer amount = Integer.valueOf(req.getParameter("amount"));
			ShoppingCartVO cartVO = new ShoppingCartVO(memId, comNo,amount);
			if(amount==0) {
				//更改之數量為0
				shoppingCartService.delete(memId, comNo);
				shoppingCartList.removeIf(delCartVO -> delCartVO.getComNo() == comNo && delCartVO.getMemId() == memId);
			}else {
			
			
			cartVO = shoppingCartService.update(memId, comNo, amount);
			for (int i = 0; i < shoppingCartList.size(); i++) {
				ShoppingCartVO existingCartItem = shoppingCartList.get(i);
				if (cartVO.getComNo() == existingCartItem.getComNo()
						&& cartVO.getMemId() == existingCartItem.getMemId()) {
					existingCartItem.setComAmount(amount);
					break;
				}
			}
			}
			int totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("shoppingCartList", shoppingCartList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/shoppingCart/listAll.jsp");
			dispatcher.forward(req, res);
		}

		if ("delete".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
			shoppingCartService.delete(memId, comNo);
			shoppingCartList.removeIf(cartVO -> cartVO.getComNo() == comNo && cartVO.getMemId() == memId);
			int totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("shoppingCartList", shoppingCartList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/shoppingCart/listAll.jsp");
			dispatcher.forward(req, res);

		}
		if ("clear".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			shoppingCartService.clear(memId);
			shoppingCartList.removeAll(shoppingCartList);
			int totalPrice = 0;
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("shoppingCartList", shoppingCartList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/shoppingCart/listAll.jsp");
			dispatcher.forward(req, res);
		}
	}
}