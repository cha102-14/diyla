<%@page
	import="com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@page import="com.cha102.diyla.commodityOrder.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單確認</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 引入其他所需的 CSS 和 JavaScript 檔案 -->
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="${ctxPath}/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
</head>
<body>
	<div class="topPage">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div class="mainContent">
		<h1>訂單確認</h1>

		<div class="orderDetail">
			<table cellspacing="0">
				<tr class="title">
					<td class="subtitle">商品名稱</td>
					<td class="subtitle">單價</td>
					<td class="subtitle">數量</td>
					<td class="subtitle">小計</td>
				</tr>
				<c:forEach var="detail" items="${detailList}">
					<c:forEach var="comVO" items="${commodityList}">
						<c:if test="${detail.comNo == comVO.comNO}">
							<tr class="itemrow">
								<td class="itemInfo">${comVO.comName}</td>
								<td class="itemInfo">${comVO.comPri}</td>
								<td class="itemInfo">${detail.comQuantity}</td>
								<td class="itemInfo">${comVO.comPri*detail.comQuantity}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table>
			<span>總金額${totalPrice}</span>
		</div>

		<div>
			<label for="useTokens">使用代幣：</label> <select id="useTokens">
				<option value="true">是</option>
				<option value="false">否</option>
			</select>
		</div>
		<div class="orderForm">
			<h2>填寫訂單資訊</h2>
			<form action="ConfirmOrderController" method="post">
				<div class="form-row">
					<label for="recipientName">收件人姓名：</label> <input type="text"
						id="recipientName" name="recipientName" required>
				</div>
				<div class="form-row">
					<label for="recipientPhone">收件人電話：</label> <input type="tel"
						id="recipientPhone" name="recipientPhone" required>
				</div>
				<div class="form-row">
					<label for="recipientAddress">收件人地址：</label> <input type="text"
						id="recipientAddress" name="recipientAddress" required>
				</div>
				<div class="form-row">
					<label for="paymentMethod">付款方式：</label> <select id="paymentMethod"
						name="paymentMethod" required>
						<option value="creditCard">信用卡</option>
						<option value="cashOnDelivery">貨到付款</option>
					</select>
				</div>
				<div class="form-row">
					<button type="submit" class="confirmButton">前往付款</button>
				</div>
			</form>
		</div>

	</div>
	<jsp:include page="../front_footer.jsp" />

	<script>
		
	</script>
</body>
</html>
