<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diycatemodel.*"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>查詢單筆訂單資料-EL_Ver.</title>

<style>
/* 將 body 設置為 flex 容器，水平置中 */


/* 使用 flex 排列兩個 div */
/* .flex-container { */
/*   display: flex; */
/* } */
body{
margin-left : 280px;
height: 100%;
text-decoration:center;
line-height:50px;
}


header {
	background-color: rgb(243, 151, 5);; /* 背景顏色 */
	color: white; /* 文字顏色 */
	padding: 20px 0; /* 上下內邊距 10px，左右內邊距 0 */
	text-align: center; /* 文字置中 */
}

h1 {
	font-size: 2.5rem;
}


table {
	border-collapse: collapse; 
	width: 80%; 
	font-family: Arial, sans-serif; 
	border: 1px solid black;
	font-size: 0.8rem;
	text-align: center;
	margin: 150px 120px 50px 100px;
}

th {
	border: 1px solid black;
	background-color: #f2f2f2; 
}

td {
	border: 1px solid black;
}

th, td, tr {
/* 	width: 100px; */
	height: 20px;
}

tr:nth-child(even) {
	border: 1px solid black;
	background-color: #f2f2f2; /* 設定奇數行背景顏色 */
}


</style>

</head>
<body>

<header>
			<span>
				<h1 class="header-title">訂單編號：${diyOrderVO.diyOrderNo} 之訂單結果</h1>
			</span>
		</header>

<li><a href='diyorderfront.jsp'>返回DIY首頁</a></li><br>

<div class="center-div">

<table>
	<tr>
		<th>會員編號</th>
		<th>DIY品項名稱</th>
		<th>聯絡人</th>
		<th>聯絡電話</th>
		<th>預約人數</th>
		<th>預約時段</th>
		<th>DIY預約日期</th>
		<th>預約單建立時間</th>
		<th>預約狀態</th>
		<th>付款狀態</th>
		<th>DIY訂單金額</th>
	</tr>
	
<%-- 	<jsp:useBean id="doser" scope="page" class="com.cha102.diyla.diyOrder.DiyOrderService" /> --%>
	
	<tr>
	
		<td>${diyOrderVO.memId}</td>
		<c:forEach var="DiyCateEntity" items="${diyCateList}">
					<c:choose>
							<c:when test="${diyOrderVO.diyNo == DiyCateEntity.diyNo}">
								<td id="diyNo">${DiyCateEntity.diyName}</td>
							</c:when>
					</c:choose>			
			</c:forEach>
		<td>${diyOrderVO.contactPerson}</td>
		<td>${diyOrderVO.contactPhone}</td>
		<td>${diyOrderVO.reservationNum}</td>
		<c:choose>
						<c:when test="${diyOrderVO.diyPeriod == 0}">
							<td id="diyPeriod">上午</td>
						</c:when>
						<c:when test="${diyOrderVO.diyPeriod == 1}">
							<td id="diyPeriod">下午</td>
						</c:when>
						<c:when test="${diyOrderVO.diyPeriod == 2}">
							<td id="diyPeriod">晚上</td>
						</c:when>
					</c:choose>
		<td>${diyOrderVO.diyReserveDate}</td>
		<td id="createTime11"><fmt:formatDate value="${diyOrderVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<c:choose>
						<c:when test="${diyOrderVO.reservationStatus == 0}">
							<td id="reservationStatus">訂位完成</td>
						</c:when>
						<c:when test="${diyOrderVO.reservationStatus == 1}">
							<td id="reservationStatus">訂位已取消，尚未退款完成</td>
						</c:when>
						<c:when test="${diyOrderVO.reservationStatus == 2}">
							<td id="reservationStatus">退款完成</td>
						</c:when>
						<c:when test="${diyOrderVO.reservationStatus == 3}">
							<td id="reservationStatus">當日未到</td>
						</c:when>
					</c:choose>
		<c:choose>
						<c:when test="${diyOrderVO.paymentStatus == 0}">
							<td id="paymentStatus">已付款</td>
						</c:when>
						<c:when test="${diyOrderVO.paymentStatus == 1}">
							<td id="paymentStatus">已完成訂單</td>
						</c:when>
						<c:when test="${diyOrderVO.paymentStatus == 2}">
							<td id="paymentStatus">已失效訂單</td>
						</c:when>
						<c:when test="${diyOrderVO.paymentStatus == 3}">
							<td id="paymentStatus">已退款訂單</td>
						</c:when>
					</c:choose>
					
		<c:forEach var="DiyCateEntity" items="${diyCateList}">
						<c:choose>
								<c:when test="${diyOrderVO.diyNo == DiyCateEntity.diyNo}">
									<td id="diyPrice">${DiyCateEntity.amount}</td>
								</c:when>
						</c:choose>			
					</c:forEach>
	</tr>
	
</table>
</div>




</body>
</html>