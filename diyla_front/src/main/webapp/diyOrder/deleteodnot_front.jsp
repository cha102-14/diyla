<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/front_header.jsp" />
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>取消DIY訂單確認</title>
</head>
<body>
	<h1>取消DIY訂單確認</h1>
	<h2>此訂單已無法退款</h2>
	
	<div>
	您於${DiyOrderVO.createTime}創建的訂位，因取消日期${currentDate}與您訂位日期相隔低於三天，根據訂位規範，需大於三天前退款方能退款完成，故您此筆訂單已無法退款。	
	</div>
	
	<form action="DiyOrderFrontController" method="post" id="form2">
	
	<input type="hidden" name="diyOrderNo" value="${DiyOrderVO.diyOrderNo}">
	<input type="hidden" name="memId" value="${DiyOrderVO.memId}">
	<input type="hidden" name="diyNo" value="${DiyOrderVO.diyNo}">
	<input type="hidden" name="contactPerson" value="${DiyOrderVO.contactPerson}">
	<input type="hidden" name="contactPhone" value="${DiyOrderVO.contactPhone}">
	<input type="hidden" name="reservationNum" value="${DiyOrderVO.reservationNum}">
	<input type="hidden" name="diyPeriod" value="${DiyOrderVO.diyPeriod}">
	<input type="hidden" name="diyReserveDate" value="${DiyOrderVO.diyReserveDate}">
	<input type="hidden" name="reservationStatus" value="${DiyOrderVO.reservationStatus}">
	<input type="hidden" name="paymentStatus" value="${DiyOrderVO.paymentStatus}">
	<input type="hidden" name="diyPrice" value="${DiyOrderVO.diyPrice}">
	
	<input type="hidden" name="action" value="keep_order">
	<input type="submit" value="回到訂單總覽">
	
	<form action="DiyOrderFrontController" method="post" id="form2">
	
	<input type="hidden" name="diyOrderNo" value="${DiyOrderVO.diyOrderNo}">
	<input type="hidden" name="memId" value="${DiyOrderVO.memId}">
	<input type="hidden" name="diyNo" value="${DiyOrderVO.diyNo}">
	<input type="hidden" name="contactPerson" value="${DiyOrderVO.contactPerson}">
	<input type="hidden" name="contactPhone" value="${DiyOrderVO.contactPhone}">
	<input type="hidden" name="reservationNum" value="${DiyOrderVO.reservationNum}">
	<input type="hidden" name="diyPeriod" value="${DiyOrderVO.diyPeriod}">
	<input type="hidden" name="diyReserveDate" value="${DiyOrderVO.diyReserveDate}">
	<input type="hidden" name="reservationStatus" value="${DiyOrderVO.reservationStatus}">
	<input type="hidden" name="paymentStatus" value="${DiyOrderVO.paymentStatus}">
	<input type="hidden" name="diyPrice" value="${DiyOrderVO.diyPrice}">
	
	<input type="hidden" name="action" value="keep_order">
	<input type="submit" value="仍取消訂單">
</body>
</html>