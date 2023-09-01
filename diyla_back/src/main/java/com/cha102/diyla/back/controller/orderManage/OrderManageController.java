package com.cha102.diyla.back.controller.orderManage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.commodityOrder.CommodityOrderService;
import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailVO;
import com.cha102.diyla.shoppingcart.ShoppingCartService;

@WebServlet("/orderManage/OrderManageController")
public class OrderManageController extends HttpServlet {
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
		if ("listAllOrder".equals(action)) {
			List<CommodityOrderVO> list = commodityOrderService.getAll();
			session.setAttribute("commodityOrderVOList", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/ordermanage/ordermanage.jsp");
			dispatcher.forward(req, res);

		}

		if ("showDetail".equals(action)) {
			Integer orderNo = Integer.valueOf(req.getParameter("orderNO"));
			List<CommodityOrderDetailVO> commodityOrderDetailList = commodityOrderDetailService.getAll(orderNo);
			List<Integer> comNoList = new ArrayList<>();
			for (CommodityOrderDetailVO commodityOrderDetailVO : commodityOrderDetailList) {
				comNoList.add(commodityOrderDetailVO.getComNo());
			}
			List<CommodityVO> commodityList = commodityService.getAllByComNo(comNoList);
			session.setAttribute("commodityList", commodityList);
			session.setAttribute("commodityOrderDetailList", commodityOrderDetailList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/ordermanage/showOrderDetail.jsp");
			dispatcher.forward(req, res);
		}
		if ("editOrder".equals(action)) {
			Integer orderNo = Integer.valueOf(req.getParameter("orderNO"));
			CommodityOrderVO order = commodityOrderService.findByOrderNo(orderNo);
			session.setAttribute("order", order);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/ordermanage/editorder.jsp");
			dispatcher.forward(req, res);
		}
		if ("editcomplete".equals(action)) {
			Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
			Integer orderNo = Integer.valueOf(req.getParameter("orderNO"));
			Integer status = Integer.valueOf(req.getParameter("orderStatus"));
			String recipient = req.getParameter("recipient");
			String recipientAddress = req.getParameter("recipientAddress");
			String phone = req.getParameter("phone");
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO();
			commodityOrderVO.setRecipient(recipient);
			commodityOrderVO.setRecipientAddress(recipientAddress);
			commodityOrderVO.setPhone(phone);

			//將錯誤驗證存入Map 在jsp取出
			Set<ConstraintViolation<CommodityOrderVO>> errors = validator.validate(commodityOrderVO);
			Map<String, String> errorMap = new HashMap<String, String>();

			for (ConstraintViolation<CommodityOrderVO> violation : errors) {
				String fieldName = violation.getPropertyPath().toString();
				String errorMessage = violation.getMessage();
				errorMap.put(fieldName, errorMessage);
			}

			if (!errorMap.isEmpty()) {
				req.setAttribute("ErrorMap", errorMap);
				req.getRequestDispatcher("/ordermanage/editorder.jsp").forward(req, res);
				return;
			}

			commodityOrderService.update(status, orderNo, recipient, recipientAddress, phone);
			List<CommodityOrderVO> list = commodityOrderService.getAll(); // ??
			session.setAttribute("commodityOrderVOList", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/ordermanage/ordermanage.jsp");
			dispatcher.forward(req, res);

		}
	}
}
