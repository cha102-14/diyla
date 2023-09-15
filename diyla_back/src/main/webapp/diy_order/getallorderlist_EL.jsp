<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/index.jsp" />
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css" />
<title>所有訂單</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<style type="text/css">
body {
	margin-left: 280px;
}

a {
    font-size: 1rem;
    text-decoration: none;
    color: #333;
}

a:hover {
    color: red; 
    font-weight: bold;
    font-size: 1.3rem;
}

 div#padding{ 
 padding: 40px; 
 } 

 header { 
 	background-color: #f8a229; /* 背景顏色 */ 
 	color: white; /* 文字顏色 */ 
 	padding: 10px 0; /* 上下內邊距 10px，左右內邊距 0 */ 
 	text-align: center; /* 文字置中 */ 
 } 

 /* Header 標題樣式 */ 
.header-title { 
 	font-size: 1.5rem; 
 	margin: 0; 
 } 

 /* Header 子標題樣式 */ 
 .header-subtitle { 
 	font-size: 16px; 
 	margin: 0; 
 	margin-left: 90%; 
 	gap:10px 
 } 

 h1 { 
 	font-size: 1.5rem; 
 } 

 li>a { 
 	font-size: 1rem; 
 	text-decoration: none; 
 } 



 table { 
 	border-collapse: collapse; /* 合併邊框 */ 
 	width: 100%; /* 設定表格寬度 */ 
	font-family: Arial, sans-serif; /* 設定字體 */ 
 	border: 1px solid black; /* 設定邊框 */ 
 	font-size: 0.8rem; 
	
} 

 th, td { 
 	border: 1px solid black; /* 設定儲存格邊框 */ 
 	padding: 8px; /* 設定內邊距 */ 
 	text-align: center; /* 設定文字對齊 */ 
	
 } 

td#inn{ 
 display: flex; 
 padding: 0px;  
 width: 90px;  
height: 10px 0;  
 } 

 th { 
 	background-color: #f2f2f2; /* 設定表頭背景顏色 */ 
 } 

 tr:nth-child(even) { 
 	background-color: #f2f2f2; /* 設定奇數行背景顏色 */ 
 } 

/* /* 設定表格間距 */ */
/* .table-container { */
/* 	margin-top: 20px; */
/* } */


/* .pennyrequest1{ */
/* margin-top: 20px; */
/* } */


</style>
</head>
<body>

	<header>
		<span>
			<h1 class="header-title" style="font-size: 2rem;font-weight: bold;margin-top: 15px;">所有訂單查詢</h1>
			<p class="header-subtitle">
				<a href='diyorderfront.jsp' style="font-size: 1rem;text-decoration: none;">>返回DIY首頁</a>
				<br>
				</div>
				
			</p>
		</span>
	</header>
	
<div id="padding">

	<table id="table_id">
	
		<thead>
				<tr>
					<th>DIY訂單編號</th>
					<th>DIY品項名稱</th>
					<th>聯絡人</th>
					<th>聯絡電話</th>
					<th>預約人數</th>
					<th>預約時段</th>
					<th>DIY預約日期</th>
					<th>預約單建立/更改時間</th>
					<th>預約狀態</th>
					<th>付款狀態</th>
					<th>DIY訂單金額</th>
				</tr>
		</thead>
			
		<tbody>	
			<c:forEach var="DiyOrderVO" items="${diyOrderList}">

				<tr>
			
					<td id="diyOrderId">${DiyOrderVO.diyOrderNo}</td>


					<c:forEach var="DiyCateEntity" items="${diyCateList}">
						<c:choose>
							<c:when test="${DiyOrderVO.diyNo == DiyCateEntity.diyNo}">
								<td id="diyNo">${DiyCateEntity.diyName}</td>
							</c:when>
						</c:choose>			
					</c:forEach>
								
					<td id="contactPerson11" class="contactPerson">${DiyOrderVO.contactPerson}</td>
					<td id="contactPhone11">${DiyOrderVO.contactPhone}</td>
					<td id="reservationNum">${DiyOrderVO.reservationNum}</td>

					<c:choose>
						<c:when test="${DiyOrderVO.diyPeriod == 0}">
							<td id="diyPeriod">上午</td>
						</c:when>
						<c:when test="${DiyOrderVO.diyPeriod == 1}">
							<td id="diyPeriod">下午</td>
						</c:when>
						<c:when test="${DiyOrderVO.diyPeriod == 2}">
							<td id="diyPeriod">晚上</td>
						</c:when>
					</c:choose>

					<td id="diyReserveDate">${DiyOrderVO.diyReserveDate}</td>
					<td id="createTime11"><fmt:formatDate value="${DiyOrderVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<c:choose>
						<c:when test="${DiyOrderVO.reservationStatus == 0}">
							<td id="reservationStatus">訂位完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 1}">
							<td id="reservationStatus">訂位已取消，尚未退款完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 2}">
							<td id="reservationStatus">退款完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 3}">
							<td id="reservationStatus">當日未到</td>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${DiyOrderVO.paymentStatus == 0}">
							<td id="paymentStatus">已付款</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 1}">
							<td id="paymentStatus">已完成訂單</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 2}">
							<td id="paymentStatus">已失效訂單</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 3}">
							<td id="paymentStatus">已退款訂單</td>
						</c:when>
					</c:choose>
					
					<td id="diyPrice">${DiyOrderVO.diyPrice}</td>
					
				</tr>
			</c:forEach>
			
			
		</tbody>
	</table>


	



</div>	
 <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"></script>
    
 <script type="text/javascript">
 
//  new DataTable('#table_id');
$(document).ready(function (){
    $('#table_id').DataTable( {
    language: {
        search: "搜尋:",
        sLengthMenu:"顯示_MENU_筆結果",
        sInfo: "顯示第_START_至_END_筆結果，共_TOTAL_筆",
        oPaginate:{
        	sFirst: "首頁",
        	sPrevious: "上頁",
        	sNext: "下頁",
        	sLast: "最後頁"        	
        }
    }
} );
});
 

 
 </script>   



</body>
</html>