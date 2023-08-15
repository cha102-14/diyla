<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/bootstrap.css" />

<link href="${ctxPath}/css/style.css" rel="stylesheet" />
<link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
<title>訂單明細</title>
<style>
.mainContent {
	height: 500px;
	text-align: center;
}

.detailTable {
	padding-top: 200px;
	padding-left: 200px;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.mainContent {
	width: 90%;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.detailTable {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.title {
	background-color: #f2f2f2;
}

.title td {
	padding: 10px;
	font-weight: bold;
}

tr {
	border-bottom: 1px solid #ccc;
}

td {
	padding: 10px;
	text-align: center;
}

.subtitle {
	font-weight: bold;
}

a {
	color: #337ab7;
	text-decoration: none;
}

a:hover {
	color: #337ab7;
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div class="mainContent">
		<h1>
			<a href="${ctxPath}/memberOrder/memberOrder.jsp">回到我的訂單</a>
		</h1>
		<table class="detailTable">
			<tr class="title">
				<td class="subtitle">訂單編號</td>
				<td class="subtitle">商品名稱</td>
				<td class="subtitle">單價</td>
				<td class="subtitle">數量</td>
				<td class="subtitle">小計</td>
			</tr>
			<c:forEach var="orderDetail" items="${commodityOrderDetailList}">
				<tr>
					<td>${orderDetail.orderNo}</td>
					<td>${orderDetail.comName}</td>
					<td>${orderDetail.unitPrice}</td>
					<td>${orderDetail.comQuantity }</td>
					<td>${orderDetail.unitPrice*orderDetail.comQuantity}</td>
				</tr>
			</c:forEach>
		</table>
		<p>
			<a href="${ctxPath}/shop/CommodityController?action=listAll">繼續購物</a>
		</p>
	</div>
	<jsp:include page="../front_footer.jsp" />

</body>
</html>