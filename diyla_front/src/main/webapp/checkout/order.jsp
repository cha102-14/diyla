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
<title>填寫付款資訊</title>
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
<style>
.mainContent {
	width: 70%;
	margin: 0 auto;
	padding: 20px;
}

.orderDetail {
	margin-bottom: 20px;
}

.orderDetail table {
	width: 100%;
	border-collapse: collapse;
}

.orderDetail th, .orderDetail td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.title {
	background-color: #f2f2f2;
}

.total {
	display: block;
	text-align: right;
	margin-top: 10px;
	font-weight: bold;
}

.form-row {
	margin-bottom: 10px;
}

label {
	display: inline-block;
	width: 150px;
	font-weight: bold;
}

input[type="text"], input[type="tel"], select {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.confirmButton {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.confirmButton:hover {
	background-color: #0056b3;
}

.total {
	float: right;
}

.container {
	border: 1px solid #ccc;
	padding: 20px;
}

.title {
	cursor: pointer;
	padding: 10px;
	background-color: #f2f2f2;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
}

.form-container {
	display: none;
}

.form-container.active {
	display: block;
}

.form-row {
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

.canceled {
	display: inline-block;
	/* 	float: right; */
	padding: 10px 20px;
	border: 1px solid black;
	color: teal;
	background-color: #red;
	border-radius: 4px;
	cursor: pointer;
	border: 1px solid black;
}

.canceled::hover {
	color: red;
	background-color: #red;
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div class="mainContent">
		<h1 style="text-align: center; padding: 20px;">訂購明細</h1>

		<form action="${ctxPath}/memberOrder/OrderController" method="post">
			<div class="orderDetail">
				<table>
					<tr class="title">
						<td class="subtitle">商品名稱</td>
						<td class="subtitle">單價</td>
						<td class="subtitle">數量</td>
						<td class="subtitle">小計</td>
					</tr>
					<c:forEach var="cartItem" items="${shoppingCartList}">
						<c:forEach var="comVO" items="${commodityList}">
							<c:if test="${cartItem.comNo == comVO.comNO}">
								<tr class="itemrow">
									<td class="itemInfo">${comVO.comName}</td>
									<td class="itemInfo">${comVO.comPri}</td>
									<td class="itemInfo">${cartItem.comAmount}</td>
									<td class="itemInfo">${comVO.comPri*cartItem.comAmount}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
				<span class="total">總金額${totalPrice}</span>
			</div>

			<div>
				<label for="useTokens">使用代幣：</label>
				<div>
					<input type="radio" id="yes" name="coin" value="0" checked /> <label
						for="yes">是</label>
				</div>

				<div>
					<input type="radio" id="no" name="coin" value="1" /> <label
						for="no">否</label>
				</div>
			</div>
			<div class="container">
				<div class="title">填寫付款資訊</div>
				<div class="form-container">
					<div class="form-row">

						<label for="recipientName">收件人姓名：</label> <input type="text"
							id="recipientName" name="recipient" value="${param.recipient}">
						<p style="display: block; color: red; padding: 0px 3px;">${errMsg["recipient"]}</p>

					</div>
					<div class="form-row">

						<label for="recipientPhone">收件人電話：</label> <input type="tel"
							id="recipientPhone" name="phone" value="${param.phone}">
						<p style="display: block; color: red; padding: 0px 3px">${errMsg["phone"]}</p>
					</div>
					<div class="form-row">
						<label for="recipientAddress">收件人地址：</label> <input type="text"
							id="recipientAddress" name="recipientAddress"
							value="${param.recipientAddress}">
						<p style="display: block; color: red; padding: 0px 3px">${errMsg["recipientAddress"]}</p>

					</div>
				</div>
			</div>
			<div class="form-row">
				<label for="paymentMethod">付款方式：</label> <select id="paymentMethod"
					name="paymentMethod" required>
					<option value="creditCard">信用卡</option>
					<option value="cashOnDelivery">貨到付款</option>
				</select>
			</div>
			<input type="hidden" name="action" value="orderConfirm"> <input
				type="submit" class="confirmButton" value="確認"> <a
				href="${ctxPath}/shop/ShoppingCartServlet?action=getAll&memId=${memId}"
				class="canceled">返回購物車</a>
		</form>
	</div>

	<jsp:include page="../front_footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			const formContainer = document.querySelector('.form-container');

			$(".title").click(function() {
				formContainer.classList.toggle('active');
			});
		});
	</script>


</body>
</html>
