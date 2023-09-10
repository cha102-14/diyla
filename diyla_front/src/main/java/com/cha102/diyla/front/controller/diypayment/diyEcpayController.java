package com.cha102.diyla.front.controller.diypayment;

import com.cha102.diyla.commodityOrder.CommodityOrderService;
import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.commodityOrder.MailService;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService;
import com.cha102.diyla.diyOrder.DiyOrderService;
import com.cha102.diyla.diyOrder.DiyOrderVO;
import com.cha102.diyla.diyreservemodel.DiyReserveResultEntity;
import com.cha102.diyla.diyreservemodel.DiyReserveResultService;
import com.cha102.diyla.front.utils.EcpayCheckout;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import com.cha102.diyla.shoppingcart.ShoppingCartService;
import com.cha102.diyla.shoppingcart.ShoppingCartVO;
import com.cha102.diyla.tokenModel.TokenService;
import com.cha102.diyla.tokenModel.TokenVO;
import com.cha102.diyla.util.HashMapMemIdHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/diy/checkout")
public class diyEcpayController {


    @Resource
    DiyReserveResultService diyReserveResultService;

    private HttpServletRequest req;
    // 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
    HashMapMemIdHolder memberHolder = new HashMapMemIdHolder();

    public diyEcpayController(HttpServletRequest req) {
        this.req = req;

    }

    @RequestMapping("/ecpay")
    public String ecpay(Model model, @RequestParam String tradeDesc, @RequestParam String totalPrice,
                        @RequestParam String itemName, @RequestParam String cardrecipient,
                        @RequestParam String cardrecipientAddress, @RequestParam String cardphone, @RequestParam String tokenUse,
                        @RequestParam int period,@RequestParam int count,@RequestParam int diyNo,@RequestParam String selectedDate

    ) {
        // todo 未來串接從session取得會員資料
        HttpSession session = req.getSession();
        MemVO memVO = (MemVO) session.getAttribute("memVO");
        String token = tokenUse;
        int memNO = memVO.getMemId();
        // 會員編號先另存
        memberHolder.put("memId" + memNO, memNO);


        String receiveInfo = cardrecipient + "," + cardrecipientAddress + "," + cardphone + "," + diyNo + "," + count + "," + period + "," + selectedDate;
        // 使用取號機
        if ("".equals(token)) {
            token = 0 + "";
        }
        Date date = new Date();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(date.getTime());


        String toEcpay = EcpayCheckout.goToEcpayForDiy(memNO, tradeDesc, totalPrice, token, itemName, receiveInfo, 0);
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

            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = currentDate.format(formatter);
            MemberService memberService = new MemberService();
            MailService mailService = new MailService();

            // todo 執行寫入訂單動作，並導引至訂單明細頁面
            // 因為綠界交易成功導回專案時有時候會把session id換掉，所以離開專案前暫存會員資料進HashMap，交易回來再取出
            HttpSession session = req.getSession();
            Integer memId = memberHolder.get(memKey);
            System.out.println(memKey + "," + memId);
            // 收件人資訊取出
            System.out.println(receiveInfo);
            String[] info = receiveInfo.split(",");
            String recipient = info[0];
            String recipientAddress = info[1];
            String phone = info[2];
            String diyNo = info[3];
            String count = info[4];
            String period = info[5];
            String selectedDate = info[6];
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date sqlDate1 = new java.sql.Date(utilDate.getTime());

            Integer totalPri = Integer.valueOf(totalPrice);
            int diyReserveId = Integer.parseInt(token);


            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date sqlDate2 = null;
            try {
                sqlDate2 = new java.sql.Date(dateFormat.parse(selectedDate).getTime());
            } catch (ParseException e) {
                e.printStackTrace(); 
            }

            DiyOrderVO diyOrderVO = new DiyOrderVO(null, memId, Integer.parseInt(diyNo), recipient, phone, Integer.parseInt(count), Integer.parseInt(period), sqlDate2
                    , Timestamp.valueOf(LocalDateTime.now()), 0, 0, totalPri);

            DiyOrderService DOser = new DiyOrderService();
            DiyOrderVO diyOrderVO1 = DOser.addOD(diyOrderVO);


            MemVO memVO = memberService.selectMem(memId);
            session.setAttribute("memId", memId);
            session.setAttribute("memVO", memVO);
            String messageContent = "訂單詳情:\n" + "訂單編號:" + diyOrderVO1.getDiyOrderNo() + "\n" + "訂位人:" + recipient + "\n" + "收件地址:"
                    + recipientAddress + "\n" + "訂購日期:" + formattedDate + "\n" + "_____________________\n"
                    + "DIYLA感謝您的預約";
            mailService.sendMail("love12260327@gmail.com", "訂位成功", messageContent);

            // session遺失問題處理方法: 1見參考 2.用js彈窗處理 3.如果判斷是綠界導回來 直接在成功頁面set一個memVO
            return "/diybooking/order_completed.jsp";
        } else {
            // todo 交易失敗的動作
            return "/diybooking/error.jsp";
        }

    }


}
