package com.cha102.diyla.front.controller.shoppingCart;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityOrder.CommodityOrderService;
import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.commodityOrder.MailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailVO;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;
import com.cha102.diyla.tokenModel.TokenService;
import com.cha102.diyla.tokenModel.TokenVO;

import redis.clients.jedis.Jedis;

@WebServlet("/memberOrder/OrderController")
public class OrderController extends HttpServlet {
	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();
	CommodityOrderService commodityOrderService = new CommodityOrderService();
	CommodityOrderDetailService commodityOrderDetailService = new CommodityOrderDetailService();
	TokenService tokenService = new TokenService();
	Jedis jedis = new Jedis("localhost" ,6379);

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String action = req.getParameter("action");
		// 前台顯示訂單
		if ("listOrder".equals(action)) {
			MemVO memVO = (MemVO) session.getAttribute("memVO");
			if (memVO == null) {
				String loginURL = "/member/mem_login.jsp";
				RequestDispatcher login = req.getRequestDispatcher(loginURL);
				login.forward(req, res);
			}
			Integer memId = memVO.getMemId();
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
			CommodityOrderVO commodityOrderVO =commodityOrderService.findByOrderNo(orderNo);
			session.setAttribute("orderTime", commodityOrderVO.getOrderTime());
			session.setAttribute("orderNo", orderNo);
			session.setAttribute("commodityOrderDetailList", commodityOrderDetailList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/memberOrder/showOrderDetail.jsp");
			dispatcher.forward(req, res);
		}
		// 取消訂單
		if ("cancelOrder".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			Integer orderNo = Integer.valueOf(req.getParameter("orderNO"));
			commodityOrderService.updateStatus(6, orderNo);
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
			MemberService memberService = new MemberService();
			HashMap<String, String> errMsg = new HashMap<>();
			String recipient = (String) req.getParameter("recipient");
			if (recipient == null || recipient.trim().isEmpty()) {
				errMsg.put("recipient", "請填寫收件人");
			}
			String recipientAddress = (String) req.getParameter("recipientAddress");
			if (recipientAddress == null || recipientAddress.trim().isEmpty()) {
				errMsg.put("recipientAddress", "請填寫收件地址");
			}
			String phone = (String) req.getParameter("phone");
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
			MemVO memVO =(MemVO)session.getAttribute("memVO");
			String redisKey = "cart:" + memId;
			Map<String, String>cartInfo =jedis.hgetAll(redisKey);
			List<ShoppingCartVO> shoppingCartList = shoppingCartService.getCart(memId,cartInfo);
			Integer totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			Integer tokenUse=0;
			try {
				 tokenUse=Integer.valueOf(req.getParameter("tokenUse"));
			} catch (NumberFormatException e) {
				//null無法轉換 故接到錯誤將代幣值設為0
				System.out.println(req.getParameter("tokenUse"));
				tokenUse=0;
			}
			
			// 若無使用代幣則新增一筆代幣
			if (tokenUse == 0) {
				TokenVO token = tokenService.addToken((totalPrice / 10), (byte) 1, memId);
				Integer tokenFeedBack = token.getTokenCount();
				session.setAttribute("tokenFeedBack", tokenFeedBack);
			} else {
				// 若有使用則扣除且回饋為0
				tokenService.addToken(-1 * tokenUse, (byte) 1, memId);
				Integer tokenFeedBack = 0;
				session.setAttribute("tokenFeedBack", tokenFeedBack);
			}
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO(memId, 0, totalPrice, tokenUse,
					totalPrice - tokenUse, recipient, recipientAddress, phone);
			Integer orderNo = commodityOrderService.insert(commodityOrderVO,shoppingCartList);
			String messageContent = "<html><head><style>"
			        + "body {"
			        + "    font-family: Arial, sans-serif;"
			        + "    background-color: #ffebeb;"
			        + "    margin: 0;"
			        + "    padding: 20px;"
			        + "}"
			        + "h2 {"
			        + "    color: #333;"
			        + "}"
			        + "p {"
			        + "    color: #666;"
			        + "}"
			        + "hr {"
			        + "    border: 1px solid #ccc;"
			        + "}"
			        + "</style></head><body>"
			        + "<h2>訂單詳情</h2>"
			        + "<p>訂單編號: " + orderNo + "</p>"
			        + "<p>訂單金額: " + (totalPrice - tokenUse) + "元</p>"
			        + "<p>收件人: " + recipient + "</p>"
			        + "<p>收件地址: " + recipientAddress + "</p>"
			        + "<p>購買日期: " + formattedDate + "</p>"
			        + "<hr>"
			        + "<p>DIYLA感謝您的訂購，我們將盡快將商品寄出</p>"
			        + "</body></html>";
			mailService.sendMail(memVO.getMemEmail(), "訂購成功", messageContent);
			// 訂單生成清空購物車
	        jedis.del(redisKey);
			res.sendRedirect(req.getContextPath() + "/checkout/checkoutSucess.jsp");

		}

	}
}
