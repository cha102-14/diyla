package com.cha102.diyla.front;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EcpayCheckout {
    /*
    *  memNo：會員編號
    *  tradeDesc: 交易敘述
    *  totalPrice: 總價
    *  itemName: 條列式商品敘述
     */
    public static String goToEcpay(Integer memNO,String tradeDesc,Integer totalPrice, String itemName){
        // 一般信用卡測試卡號 : 4311-9522-2222-2222 安全碼 : 222
        int memNo = 1;
        // 取得交易時間
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String tradeDate = sdf.format(new Date(System.currentTimeMillis()));
        AllInOne allInOne = new AllInOne(""); // 實體化AllInOne並設置空字串

        AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();

        aioCheckOutALL.setMerchantTradeNo(getTradeNo(tradeDate, memNo)); // 交易編號
        aioCheckOutALL.setMerchantTradeDate(tradeDate); // 交易日期
        aioCheckOutALL.setTotalAmount(java.lang.String.valueOf(totalPrice)); // 設定交易價格
        aioCheckOutALL.setTradeDesc(tradeDesc);
        aioCheckOutALL.setCustomField1(tradeDesc);
        aioCheckOutALL.setItemName(itemName.length()>200?"Diyla商品一批":itemName); // 商品敘述不能超過兩百字，否則顯示商品一批
        aioCheckOutALL.setReturnURL("http://localhost:8081/diyla_front/shop/XxxController"); // 綠界回傳成功訊息的api網址，上線環境才有用
        aioCheckOutALL.setOrderResultURL("http://localhost:8081/diyla_front/shop/XxxController?action=??????");  // 放入綠界結帳成功後訊息要打的api，測試環境有用
        aioCheckOutALL.setClientBackURL("http://localhost:8081/diyla_front");
        aioCheckOutALL.setNeedExtraPaidInfo("N");
        String checkoutPage = allInOne.aioCheckOut(aioCheckOutALL, null);
        return checkoutPage;  // 新增一個jsp，把checkoutPage放在<body>標籤內，會自動導向結帳頁面
    }
    // 取號機 Diyla+會員編號+年月日時分秒 ，ex：Diyla120230819201930
    private static String getTradeNo(String tradeDate,int memNO) {

        return "Diyla"+memNO + tradeDate.replace("/", "").replace(":", "").replace(" ", "") ;

    }

//    public static void main(String[] args) {
//        String s = goToEcpay(1, "哈哈", 1000, "商品一批");
//        System.out.println(s);
//    }
}
