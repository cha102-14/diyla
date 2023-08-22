package com.cha102.diyla.front.controller.shoppingCart;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.cha102.diyla.commodityOrder.MailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailVO;
import com.cha102.diyla.member.MemberService;
import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;

@WebServlet("/memberOrder/OrderController")
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
		// 結帳
		if ("checkout".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			List<ShoppingCartVO> shoppingCartList = shoppingCartService.getAll(memId);
			Integer totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("shoppingCartList", shoppingCartList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/checkout/order.jsp");
			dispatcher.forward(req, res);
		}
		// 前台顯示訂單
		if ("listOrder".equals(action)) {
			Integer memId = Integer.valueOf(req.getParameter("memId"));
//			Integer memId = (Integer) session.getAttribute("memId"); //之後改用這個
//			if(memId==null) {
//				//請先登入會員，跳轉到登入頁面
//			}
			List<CommodityOrderVO> list = commodityOrderService.getAllByMemId(memId);
			session.setAttribute("memId", memId);
			session.setAttribute("commodityOrderVOList", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/memberOrder.jsp");
			dispatcher.forward(req, res);
		}

		// 顯示明細
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
			RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/showOrderDetail.jsp");
			dispatcher.forward(req, res);
		}
		// 取消訂單
		if ("cancelOrder".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			Integer orderNo = Integer.valueOf(req.getParameter("orderNO"));
			commodityOrderService.updateStatus(4, orderNo);
			List<CommodityOrderVO> list = commodityOrderService.getAllByMemId(memId);
			session.setAttribute("memId", memId);
			session.setAttribute("commodityOrderVOList", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/memberOrder.jsp");
			dispatcher.forward(req, res);

		}
		if ("orderConfirm".equals(action)) {
			LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = currentDate.format(formatter);
			MailService mailService = new MailService();
			MemberService memberService =new MemberService();
			HashMap<String, String> errMsg = new HashMap<>();

			String recipient = (String)req.getParameter("recipient");
			if (recipient == null || recipient.trim().isEmpty()) {
				errMsg.put("recipient", "請填寫收件人");
			}
			String recipientAddress = (String)req.getParameter("recipientAddress");
			if (recipientAddress == null || recipientAddress.trim().isEmpty()) {
				errMsg.put("recipientAddress", "請填寫收件地址");
			}
			String phone = (String)req.getParameter("phone");
			if (phone == null || phone.trim().isEmpty()) {
				errMsg.put("phone", "請填寫手機號碼");
			} else if (!phone.matches("09\\d{8}")) {
				errMsg.put("phone", "手機號碼格式不正確");
			}
			if (!errMsg.isEmpty()) {
				req.setAttribute("errMsg", errMsg);
				RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/OrderController?action=checkout");
				dispatcher.forward(req, res);
				return;
			}
			Integer memId = (Integer) session.getAttribute("memId");
			List<ShoppingCartVO> shoppingCartList = shoppingCartService.getAll(memId);
			Integer totalPrice = (Integer) session.getAttribute("totalPrice");
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO(memId, 0, totalPrice, 0, totalPrice-0, recipient,
					recipientAddress, phone);
			Integer orderNo = commodityOrderService.insert(commodityOrderVO);
//			String memMail = memberService.selectMem(memId).getMemEmail();
			String messageContent =
                    "訂單詳情:\n" +
                    "訂單編號:" +orderNo+ "\n" +
                    "收件人:"+ recipient+"\n" +
                    "收件地址:"+recipientAddress+ "\n" +
                    "購買日期:"+formattedDate+ "\n" +
                    "_____________________\n"+
                    "DIYLA感謝您的訂購，我們將盡快將商品寄出"
                    ;
			mailService.sendMail("t1993626@gmail.com", "訂購成功", messageContent);
			commodityOrderDetailService.insert(orderNo, shoppingCartList);
			//訂單生成清空購物車
			shoppingCartService.clear(memId);
			res.sendRedirect(req.getContextPath() + "/checkout/checkoutSucess.jsp");

		}

	}
}
