<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	float: inherit;
	box-sizing: border-box;
	width: 100%;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	box-sizing: border-box;
	min-height: 575px;
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
	border: none;
}

/* 表格標題行 */
.title {
	margin-top: 15px;
	background-color: #C7C7E2;
	text-align: center;
/* 	border-radius: 5px; */
	
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
	color: #272727;
	text-decoration: none;
	transition: color 0.3s;
}

/* 繼續購物連結樣式 */
.goshop {
	display: inline-block;
	padding: 10px 20px;
	background-color: #337ab7;
	color: white;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.goshop:hover, .backToOrder:hover {
	background-color: #2d5aa9;
	color: white;
}

.goshop {
	display: inline;
	width: 150px; /* 設定連結寬度 */
	margin: 10px 0; /* 水平置中 */
	padding: 10px 20px;
	background-color: #337ab7;
	color: white;
	border-radius: 5px;
	text-align: center; /* 文字置中 */
	transition: background-color 0.3s;
	justify-content: center;
/* 	margin-left: 500px; */
	float: right;
	margin-right: 30px;

}

.commentButton {
	display: inline;
	width: 150px; /* 設定連結寬度 */
	margin: 10px 20px; /* 水平置中 */
	padding: 7px 7px;
	background-color: #00BB00;
	color: white;
	border-radius: 5px;
	text-align: center; /* 文字置中 */
	transition: background-color 0.3s;
	justify-content: center;
}

.backToOrder {
	color: black;
}

.bar {
	padding: 20px 5px;
	margin-top: 5px;
	margin-bottom: 25px;
	background-color: #ECECFF;
	border-radius: 5px;
	width: 400px;
	white-space: nowrap;
}

.backLink {
	font-size: 16px;
	color: black;
}

a.backLink:hover {
	color: blue;
}

.orderNO {
	font-size: 20px;
	padding: 15px;
	border: 1px solid rgb(107,107,107,.5);
	border-radius: 15px;
	width: 175px;
	box-shadow: 1px 4px 3px ;
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div class="mainContent">
		<div class="bar">
			<a href="${ctxPath}/member/update?action=select&memId=${memId}" class="backLink">會員資訊管理</a> > 
			<a href="${ctxPath}/allOrder/allOrder?memId=${memId}" class="backLink">我的訂單</a> > 
			<a href="${ctxPath}/memberOrder/OrderController?action=listOrder&memId=${memId}"
				class="backLink">商店訂單</a> > <span class="backLink">訂單明細</span>
		</div>
		<hr>
		<p class="orderNO">訂單編號:${orderNo}</p>
		<table class="detailTable">
			<tr class="title">
				<td class="subtitle">購買日期</td>
				<td class="subtitle">商品名稱</td>
				<td class="subtitle">單價</td>
				<td class="subtitle">數量</td>
				<td class="subtitle">小計</td>
				<td class="subtitle" style="width: 70px;">評價</td>
			</tr>
			<c:forEach var="orderDetail" items="${commodityOrderDetailList}">
				<tr>
					<td><fmt:formatDate value="${orderTime}" pattern="yyyy-MM-dd" /></td>
					<td>${orderDetail.comName}</td>
					<td>${orderDetail.unitPrice}</td>
					<td>${orderDetail.comQuantity }</td>
					<td>${orderDetail.unitPrice*orderDetail.comQuantity}</td>
					<form action="${ctxPath}/shop/commodityComment/goInsertPage"
						method="post" enctype="application/x-www-form-urlencoded">
						<input type="hidden" value="${orderDetail.comNo}" name="comNo">
						<td><button type="submit" class="commentButton">新增評論</button></td>
					</form>
				</tr>
			</c:forEach>
		</table>
		<hr>
		<br>
		<p class="pblock">

			<a href="${ctxPath}/shop/CommodityController?action=listAll"
				class="goshop">繼續購物</a>
		</p>
	</div>
	<jsp:include page="../front_footer.jsp" />

</body>
</html>