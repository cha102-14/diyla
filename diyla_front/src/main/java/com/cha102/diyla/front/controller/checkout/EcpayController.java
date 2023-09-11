package com.cha102.diyla.front.controller.checkout;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import redis.clients.jedis.Jedis;

@Controller
@RequestMapping("/checkout")
public class EcpayController {

	private HttpServletRequest req;
	// 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
	HashMapMemIdHolder memberHolder = new HashMapMemIdHolder();
	Jedis jedis = new Jedis("localhost", 6379);

	public EcpayController(HttpServletRequest req) {
		this.req = req;

	}

	@RequestMapping("/ecpay")
	public String ecpay(Model model, @RequestParam String tradeDesc, @RequestParam String totalPrice,
			@RequestParam String itemName, @RequestParam String cardrecipient,
			@RequestParam String cardrecipientAddress, @RequestParam String cardphone, @RequestParam String tokenUse) {
		HttpSession session = req.getSession();
		MemVO memVO = (MemVO) session.getAttribute("memVO");
		String jsessionId = req.getSession().getId();
		System.out.println(jsessionId);
		String token = tokenUse;
		int memNO = memVO.getMemId();
		// 會員編號先另存
		memberHolder.put("memId" + memNO, memNO);
		memberHolder.put("jsessionid", jsessionId);
		String receiveInfo = cardrecipient + "," + cardrecipientAddress + "," + cardphone;
		// 使用取號機
		if ("".equals(token)) {
			token = 0 + "";
		}
		String toEcpay = EcpayCheckout.goToEcpay(memNO, tradeDesc, totalPrice, token, itemName, receiveInfo,jsessionId);
		// 自訂取號
		model.addAttribute("toEcpay", toEcpay);
		return "/checkout/checkoutPage.jsp";
	}

	@RequestMapping("/ecpayReturn")
	public String ecpayReturn(Model model, @RequestParam("RtnCode") String rtnCode,
			@RequestParam("MerchantTradeNo") String merchantTradeNo, @RequestParam("CustomField1") String memKey,
			@RequestParam("CustomField2") String totalPrice, @RequestParam("CustomField3") String receiveInfo,
			@RequestParam("CustomField4") String token,HttpServletResponse response) {
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
			// 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
			HttpSession session = req.getSession();
			Integer memId = memberHolder.get(memKey);
			System.out.println("controllerback"+memId);
			String jsessionid = memberHolder.getj("jsessionid");
			System.out.println("return Jsessionid:"+jsessionid);
			Cookie jsessionIdCookie = new Cookie("JSESSIONID", jsessionid);
		    jsessionIdCookie.setPath("/diyla_front"); // 設定Cookie的路徑，確保可以在整個應用程式中使用
		    response.addCookie(jsessionIdCookie);			
			//從redis取cart內容
			String redisKey = "cart:" + memId;
			Map<String, String> cartInfo = jedis.hgetAll(redisKey);
			List<ShoppingCartVO> shoppingCartList = shoppingCartService.getCart(memId, cartInfo);
			// 收件人資訊取出
			String[] info = receiveInfo.split(",");
			String recipient = info[0];
			String recipientAddress = info[1];
			String phone = info[2];
			// 轉化格式準備存入訂單
			Integer tokenUse = Integer.valueOf(token);
			Integer totalPri = Integer.valueOf(totalPrice);
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO(memId, 1, totalPri, tokenUse, totalPri - tokenUse,
					recipient, recipientAddress, phone);
			//同步寫入訂單與明細
			Integer orderNo = commodityOrderService.insert(commodityOrderVO, shoppingCartList);
			// 回饋功能
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
			model.addAttribute("memId", memId);
			model.addAttribute("memVO", memVO);
			String messageContent = "訂單詳情:\n" + "訂單編號:" + orderNo + "\n" + "收件人:" + recipient + "\n" + "收件地址:"
					+ recipientAddress + "\n" + "購買日期:" + formattedDate + "\n" + "_____________________\n"
					+ "DIYLA感謝您的訂購，我們將盡快將商品寄出";
			mailService.sendMail("t1993626@gmail.com", "訂購成功", messageContent);
//			commodityOrderDetailService.insert(orderNo, shoppingCartList);
			// 訂單生成清空購物車
			jedis.del(redisKey);
			return "/checkout/checkoutSucess.jsp";
		} else {
			// todo 交易失敗的動作
			System.out.println("000");
			return "/checkout/checkoutFail.jsp";
		}

	}
}
