//package com.cha102.diyla.front.controller.checkout;
//
//import ecpay.payment.integration.AllInOne;
//import ecpay.payment.integration.domain.AioCheckOutALL;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import javax.servlet.http.HttpServletRequest;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//@Controller
//@RequestMapping("/checkout")
//public class CheckoutController {
//
//
//    private HttpServletRequest req;
//
//    // 用建構子注入req
//    public CheckoutController(HttpServletRequest req) {
//        this.req = req;
//    }
//
//    @RequestMapping("/ecpay")
//    public String checkout(Model model) {
//        int memNo = 1;
//        // 取得交易時間
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//        String tradeDate = sdf.format(new Date(System.currentTimeMillis()));
//        AllInOne allInOne = new AllInOne(""); // 實體化AllInOne並設置空字串
//        String tradeDesc="會員編號："+memNo+"的交易"; // 交易敘述
//
//        AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();
//
//        aioCheckOutALL.setMerchantTradeNo(getTradeNo(tradeDate, memNo)); // 交易編號
//        aioCheckOutALL.setMerchantTradeDate(tradeDate); // 交易日期
//        aioCheckOutALL.setTotalAmount(String.valueOf(cartSV.calculateTotalPrice(cartProds))); // 設定交易價格
//        aioCheckOutALL.setTradeDesc(tradeDesc);
//        aioCheckOutALL.setCustomField1(tradeDesc);
//        aioCheckOutALL.setItemName(String.valueOf(getECContent(cartProds)));
//
//
//        return "/checkout/checkoutPage.jsp";
//    }
//
//
//}
