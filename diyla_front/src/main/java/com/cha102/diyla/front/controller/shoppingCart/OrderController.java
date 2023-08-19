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
import com.cha102.diyla.commodityOrder.CommodityOrderService;
import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailVO;
import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;

@WebServlet("/shop/OrderController")
public class OrderController extends HttpServlet {
	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();
	CommodityOrderService commodityOrderService = new CommodityOrderService();
	CommodityOrderDetailService commodityOrderDetailService = new CommodityOrderDetailService();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String action = req.getParameter("action");
		//結帳==>生成訂單
		if ("checkout".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			List<ShoppingCartVO> shoppingCartList=shoppingCartService.getAll(memId);
			Integer totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO(memId, 0, totalPrice, 0, totalPrice);
			Integer orderNo = commodityOrderService.insert(memId);
			//加入商品訂單明細
			commodityOrderDetailService.insert(orderNo, shoppingCartList);
			List<CommodityOrderDetailVO>detailList =commodityOrderDetailService.getAll(orderNo);
			for(CommodityOrderDetailVO commodityOrderDetailVO : detailList) {
				System.out.println(commodityOrderDetailVO.getComQuantity());
			}
			
			//購買完清除購物車
			shoppingCartService.clear(memId);
			session.setAttribute("detailList", detailList);
			session.setAttribute("totalPrice", totalPrice);
			
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/checkout/order.jsp");
//			dispatcher.forward(req, res);
			//避免刷新重複生成空訂單
			res.sendRedirect(req.getContextPath()+"/checkout/order.jsp");
		}
		//顯示訂單
		if ("listOrder".equals(action)) {
			Integer memId = Integer.valueOf(req.getParameter("memId"));
			List<CommodityOrderVO> list = commodityOrderService.getAll(memId);
			session.setAttribute("memId", memId);
			session.setAttribute("commodityOrderVOList", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/memberOrder.jsp");
			dispatcher.forward(req, res);

		}
		//顯示明細
		if("showDetail".equals(action)) {
			Integer orderNo =Integer.valueOf(req.getParameter("orderNO"));
			List<CommodityOrderDetailVO> commodityOrderDetailList = commodityOrderDetailService.getAll(orderNo);
			List<Integer> comNoList = new ArrayList<>();
			for(CommodityOrderDetailVO commodityOrderDetailVO: commodityOrderDetailList) {
				comNoList.add(commodityOrderDetailVO.getComNo());
			}
			List<CommodityVO> commodityList =commodityService.getAllByComNo(comNoList);
			session.setAttribute("commodityList", commodityList);
			session.setAttribute("commodityOrderDetailList",commodityOrderDetailList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/showOrderDetail.jsp");
			dispatcher.forward(req, res);
		}
		//取消訂單
		if("cancelOrder".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			Integer orderNo =Integer.valueOf(req.getParameter("orderNO"));
			commodityOrderService.update(5,orderNo);
			List<CommodityOrderVO> list = commodityOrderService.getAll(memId);
			session.setAttribute("memId", memId);
			session.setAttribute("commodityOrderVOList", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/memberOrder.jsp");
			dispatcher.forward(req, res);
			
		}

	}
}
