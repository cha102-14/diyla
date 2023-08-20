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
/* 基本樣式 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	justify-content: center;
}

/* 頁面容器 */
.mainContent {
	top: 50px; float : right;
	box-sizing: border-box;
	width: 76%;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	box-sizing: border-box;
	height: 100vh;
	float: right;
}

/* 頁面標題 */
h1 {
	font-size: 24px;
	margin-bottom: 20px;
	text-align: center;
	color: #337ab7;
}

/* 表格外觀 */
.detailTable {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
}

/* 表格標題行 */
.title {
	background-color: #f2f2f2;
	text-align: center;
	border-radius: 5px;
}

.title td {
	padding: 10px;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	border-radius: 5px;
}

/* 表格內容行 */
tr {
	border-bottom: 1px solid #ccc;
}

td {
	padding: 10px;
	text-align: center;
}

/* 子標題樣式 */
.subtitle {
	font-weight: bold;
	font-size: 18px;
	color: #337ab7;
}

/* 連結樣式 */
a {
	color: #337ab7;
	text-decoration: none;
	transition: color 0.3s;
}

a:hover {
	color: #2d5aa9;
	text-decoration: underline;
}

/* 繼續購物連結樣式 */
.backToOrder {
	display: inline-block;
	padding: 10px 20px;
	background-color: #337ab7;
	color: white;
	border-radius: 5px;
	transition: background-color 0.3s;
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../index.jsp" />
	</div>
	<div class="mainContent">
		<h1>
			<a href="${ctxPath}/ordermanage/ordermanage.jsp" class="backToOrder">回到訂單一覽</a>
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
	</div>

</body>
</html>