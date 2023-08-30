package com.cha102.diyla.front.controller.checkout;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cha102.diyla.commodityOrder.CommodityOrderService;
import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.commodityOrder.MailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService;
import com.cha102.diyla.front.utils.EcpayCheckout;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;
import com.cha102.diyla.tokenModel.TokenService;
import com.cha102.diyla.tokenModel.TokenVO;
import com.cha102.diyla.util.HashMapMemIdHolder;

@Controller
@RequestMapping("/checkout")
public class EcpayController {

	private HttpServletRequest req;
	// 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
	HashMapMemIdHolder memberHolder = new HashMapMemIdHolder();

	public EcpayController(HttpServletRequest req) {
		this.req = req;

	}

	@RequestMapping("/ecpay")
	public String ecpay(Model model, @RequestParam String tradeDesc, @RequestParam String totalPrice,
			@RequestParam String itemName, @RequestParam String cardrecipient,
			@RequestParam String cardrecipientAddress, @RequestParam String cardphone, @RequestParam String tokenUse) {
		// todo 未來串接從session取得會員資料
		HttpSession session = req.getSession();
		Integer memId = (Integer) session.getAttribute("memId");
		String token = tokenUse;
		int memNO = memId;
		//會員編號先另存
		memberHolder.put("memId" + memNO, memNO);
		String receiveInfo = cardrecipient + "," + cardrecipientAddress + "," + cardphone;
		// 使用取號機
		String toEcpay = EcpayCheckout.goToEcpay(memNO, tradeDesc, totalPrice, token, itemName, receiveInfo);
		// 自訂取號
		model.addAttribute("toEcpay", toEcpay);
		return "/checkout/checkoutPage.jsp";
	}

	@RequestMapping("/ecpayReturn")
	public String ecpayReturn(Model model, @RequestParam("RtnCode") String rtnCode,
			@RequestParam("MerchantTradeNo") String merchantTradeNo, @RequestParam("CustomField1") String memKey,
			@RequestParam("CustomField2") String totalPrice, @RequestParam("CustomField3") String receiveInfo,
			@RequestParam("CustomField4") String token) {
		// rtnCode == 1 表示交易成功
		if ("1".equals(rtnCode)) {
			TokenService tokenService = new TokenService();
			LocalDate currentDate = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String formattedDate = currentDate.format(formatter);
			MemberService memberService = new MemberService();
			MailService mailService = new MailService();
			ShoppingCartService shoppingCartService = new ShoppingCartService();
			CommodityOrderService commodityOrderService = new CommodityOrderService();
			CommodityOrderDetailService commodityOrderDetailService = new CommodityOrderDetailService();
			// todo 執行寫入訂單動作，並導引至訂單明細頁面
			// 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
			HttpSession session = req.getSession();
			Integer memId = memberHolder.get(memKey);
			System.out.println(memKey + "," + memId);
			//收件人資訊取出
			String[] info = receiveInfo.split(",");
			String recipient = info[0];
			String recipientAddress = info[1];
			String phone = info[2];
//			System.out.println(recipient + " " + recipientAddress + " " + phone);
			List<ShoppingCartVO> shoppingCartList = shoppingCartService.getCartList(memId);
			//轉化格式準備存入訂單
			Integer tokenUse = Integer.valueOf(token);
			Integer totalPri = Integer.valueOf(totalPrice);
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO(memId, 1, totalPri, tokenUse, totalPri - tokenUse,
					recipient, recipientAddress, phone);
			Integer orderNo = commodityOrderService.insert(commodityOrderVO);
			//回饋功能
			if (tokenUse == 0) {
				TokenVO tokenVO = tokenService.addToken((totalPri / 10), (byte) 1, memId);
				Integer tokenFeedBack = tokenVO.getTokenCount();
				session.setAttribute("tokenFeedBack", tokenFeedBack);
			} else {
				// 若有使用則扣除且回饋為0
				tokenService.addToken(-1 * tokenUse, (byte) 1, memId);
				Integer tokenFeedBack = 0;
				session.setAttribute("tokenFeedBack", tokenFeedBack);
			}
			MemVO memVO = memberService.selectMem(memId);
			session.setAttribute("memId", memId);
			session.setAttribute("memVO", memVO);
			String messageContent = "訂單詳情:\n" + "訂單編號:" + orderNo + "\n" + "收件人:" + recipient + "\n" + "收件地址:"
					+ recipientAddress + "\n" + "購買日期:" + formattedDate + "\n" + "_____________________\n"
					+ "DIYLA感謝您的訂購，我們將盡快將商品寄出";
			mailService.sendMail("t1993626@gmail.com", "訂購成功", messageContent);
			commodityOrderDetailService.insert(orderNo, shoppingCartList);
			// 訂單生成清空購物車
			shoppingCartService.clear(memId);
			// session遺失問題處理方法: 1見參考 2.用js彈窗處理 3.如果判斷是綠界導回來 直接在成功頁面set一個memVO
			return "/checkout/checkoutSucess.jsp";
		} else {
			// todo 交易失敗的動作
			System.out.println("000");
			return "/checkout/checkoutFail.jsp";
		}

	}
}
