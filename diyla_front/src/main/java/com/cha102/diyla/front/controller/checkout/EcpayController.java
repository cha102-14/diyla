package com.cha102.diyla.front.controller.checkout;

import com.cha102.diyla.front.utils.EcpayCheckout;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.util.HashMapMemHolder;
import com.cha102.diyla.util.MemberHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/checkout")
public class EcpayController {

    private HttpServletRequest req;

    public EcpayController(HttpServletRequest req) {
        this.req = req;
    }

    @RequestMapping("/ecpay")
    public String ecpay(
            Model model,
            @RequestParam String tradeDesc,
            @RequestParam Integer totalPrice,
            @RequestParam String itemName) {
        // todo 未來串接從session取得會員資料
        HttpSession session = req.getSession();
        MemVO memVO = (MemVO) session.getAttribute("memVO");
        Integer memNO;
        if (memVO == null) {
            memNO = 1;
        } else {

            // 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
            memNO = memVO.getMemId();
            MemberHolder memberHolder = new HashMapMemHolder();
            memberHolder.put("memVO"+memNO, memVO);
        }
        // 使用取號機
        String toEcpay = EcpayCheckout.goToEcpay(memNO, tradeDesc, totalPrice, itemName);

        // 自訂取號
//        String tradeNo = "";
//        String toEcpay = EcpayCheckout.goToEcpay(memNO, tradeDesc, totalPrice, itemName,tradeNo);

        model.addAttribute("toEcpay", toEcpay);
        return "/checkout/checkoutPage.jsp";
    }

    @RequestMapping("/ecpayReturn")
    public String ecpayReturn(
            Model model,
            @RequestParam("RtnCode") String rtnCode,
            @RequestParam("MerchantTradeNo") String merchantTradeNo,
            @RequestParam("CustomField1") String memKey) {
        // rtnCode == 1 表示交易成功
        if ("1".equals(rtnCode)) {
            // 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
            MemberHolder memberHolder = new HashMapMemHolder();
            MemVO memVO = memberHolder.get(memKey);
            HttpSession session = req.getSession();
            session.setAttribute("memVO",memVO);

            // todo 執行寫入訂單動作，並導引至訂單明細頁面
            return "";
        } else {
            // todo 交易失敗的動作
            return "";
        }

    }
}
