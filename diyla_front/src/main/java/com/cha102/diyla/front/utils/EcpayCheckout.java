package com.cha102.diyla.front.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

public class EcpayCheckout {
	/*
	 * memNo：會員編號 tradeDesc: 交易敘述 totalPrice: 總價 itemName: 條列式商品敘述
	 */
	public static String goToEcpay(Integer memNO, String tradeDesc, String totalPrice,String token, String itemName,
								   String receiveInfo) {
		// 一般信用卡測試卡號 : 4311-9522-2222-2222 安全碼 : 222
		// 取得交易時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tradeDate = sdf.format(new Date(System.currentTimeMillis()));
		AllInOne allInOne = new AllInOne(""); // 實體化AllInOne並設置空字串

		AioCheckOutOneTime aioCheckOutALL = new AioCheckOutOneTime();
		// 交易編號 綠界測試環境為所有人共用，須訂出一個不太可能跟其他人重複的交易編號
		String tradeNo = getTradeNo(tradeDate, memNO);
		Integer actualPrice =Integer.valueOf(totalPrice)-Integer.valueOf(token);
		aioCheckOutALL.setMerchantTradeNo(tradeNo);
		aioCheckOutALL.setMerchantTradeDate(tradeDate); // 交易日期
		aioCheckOutALL.setTotalAmount(actualPrice + ""); // 設定交易價格
//		System.out.println(aioCheckOutALL.getTotalAmount());
		aioCheckOutALL.setTradeDesc(tradeDesc);
		aioCheckOutALL.setCustomField1("memId" + memNO);
		//回傳總價和折扣價
		aioCheckOutALL.setCustomField2(totalPrice);
		aioCheckOutALL.setCustomField3(receiveInfo);
		aioCheckOutALL.setCustomField4(token);
//		System.out.println("測試:" + 111);
//        String ECPAY_PROD_FORMAT = "品名：%s 數量：%s 價格：%s #";
		aioCheckOutALL.setItemName("Diyla商品一批"); // 商品敘述不能超過兩百字，否則顯示商品一批
		aioCheckOutALL.setReturnURL("http://localhost:8081/diyla_front/shop/XxxController"); // 綠界回傳成功訊息的api網址，上線環境才有用
		// todo 放入綠界結帳成功後訊息要打的api(servlet)，測試環境有用，確定寫入成功後要執行寫入訂單
		aioCheckOutALL.setOrderResultURL("http://localhost:8081/diyla_front/checkout/ecpayReturn");
		aioCheckOutALL.setClientBackURL("http://localhost:8081/diyla_front");
		aioCheckOutALL.setNeedExtraPaidInfo("N");
		return allInOne.aioCheckOut(aioCheckOutALL, null); // 新增一個jsp，把checkoutPage放在<body>標籤內，會自動導向結帳頁面
	}

	public static String goToEcpayForDiy(Integer memNO, String tradeDesc, String totalPrice,String token, String itemName,
										 String receiveInfo, Integer diyReserveNo) {
		// 一般信用卡測試卡號 : 4311-9522-2222-2222 安全碼 : 222
		// 取得交易時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String tradeDate = sdf.format(new Date(System.currentTimeMillis()));
		AllInOne allInOne = new AllInOne(""); // 實體化AllInOne並設置空字串

		AioCheckOutOneTime aioCheckOutALL = new AioCheckOutOneTime();
		// 交易編號 綠界測試環境為所有人共用，須訂出一個不太可能跟其他人重複的交易編號
		String tradeNo = getTradeNo(tradeDate, memNO);
		Integer actualPrice =Integer.valueOf(totalPrice)-Integer.valueOf(token);
		aioCheckOutALL.setMerchantTradeNo(tradeNo);
		aioCheckOutALL.setMerchantTradeDate(tradeDate); // 交易日期
		aioCheckOutALL.setTotalAmount(actualPrice + ""); // 設定交易價格
//		System.out.println(aioCheckOutALL.getTotalAmount());
		aioCheckOutALL.setTradeDesc(tradeDesc);
		aioCheckOutALL.setCustomField1("memId" + memNO);
		aioCheckOutALL.setCustomField2(totalPrice);
		aioCheckOutALL.setCustomField3(receiveInfo);
		aioCheckOutALL.setCustomField4(String.valueOf(diyReserveNo));
//		System.out.println("測試:" + 111);
//        String ECPAY_PROD_FORMAT = "品名：%s 數量：%s 價格：%s #";
		aioCheckOutALL.setItemName("Diyla商品一批"); // 商品敘述不能超過兩百字，否則顯示商品一批
		aioCheckOutALL.setReturnURL("http://localhost:8081/diyla_front/shop/XxxController"); // 綠界回傳成功訊息的api網址，上線環境才有用
		// todo 放入綠界結帳成功後訊息要打的api(servlet)，測試環境有用，確定寫入成功後要執行寫入訂單
		aioCheckOutALL.setOrderResultURL("http://localhost:8081/diyla_front/diy/checkout/ecpayReturn");
		aioCheckOutALL.setClientBackURL("http://localhost:8081/diyla_front");
		aioCheckOutALL.setNeedExtraPaidInfo("N");
		return allInOne.aioCheckOut(aioCheckOutALL, null); // 新增一個jsp，把checkoutPage放在<body>標籤內，會自動導向結帳頁面
	}


//	public static String goToEcpay(Integer memNO, String tradeDesc, String totalPrice, String itemName,
//			String tradeNo,String receiveInfo) {
//		// 一般信用卡測試卡號 : 4311-9522-2222-2222 安全碼 : 222
//		// 取得交易時間
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		String tradeDate = sdf.format(new Date(System.currentTimeMillis()));
//		AllInOne allInOne = new AllInOne(""); // 實體化AllInOne並設置空字串
//		AioCheckOutOneTime aioCheckOutALL = new AioCheckOutOneTime();
//		// 交易編號 綠界測試環境為所有人共用，須訂出一個不太可能跟其他人重複的交易編號
//		aioCheckOutALL.setMerchantTradeNo(tradeNo);
//		aioCheckOutALL.setMerchantTradeDate(tradeDate); // 交易日期
//		aioCheckOutALL.setTotalAmount(String.valueOf(totalPrice)); // 設定交易價格
//		aioCheckOutALL.setTradeDesc(tradeDesc);
//		aioCheckOutALL.setCustomField1("memId" + memNO);
////        String ECPAY_PROD_FORMAT = "品名：%s 數量：%s 價格：%s #";
//		aioCheckOutALL.setItemName("Diyla商品一批"); // 商品敘述不能超過兩百字，否則顯示商品一批
////        aioCheckOutALL.setReturnURL("http://localhost:8081/diyla_front/shop/XxxController"); // 綠界回傳成功訊息的api網址，上線環境才有用
//		// todo 放入綠界結帳成功後訊息要打的api(servlet)，測試環境有用，確定寫入成功後要執行寫入訂單
//		aioCheckOutALL.setOrderResultURL("http://localhost:8081/diyla_front/checkout/ecpayReturn");
//		aioCheckOutALL.setClientBackURL("https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5");
//		aioCheckOutALL.setNeedExtraPaidInfo("N");
//		return allInOne.aioCheckOut(aioCheckOutALL, null); // 新增一個jsp，把checkoutPage放在<body>標籤內，會自動導向結帳頁面
//	}

	// 取號機 Diyla+會員編號+年月日時分秒 ，ex：Diyla120230819201930
	public static String getTradeNo(String tradeDate, int memNO) {

		return "Diyla" + memNO + tradeDate.replace("/", "").replace(":", "").replace(" ", "");

	}

}
