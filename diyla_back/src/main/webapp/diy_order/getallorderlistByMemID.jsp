<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>



<jsp:include page="/index.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css" />
<title>會員${memVO.memName}的所有訂單</title>


<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

<style type="text/css">
body {
	margin-left: 280px;

}

div#padding {
	padding: 40px;
}

a {
    font-size: 1rem;
    text-decoration: none;
    color: #333; /* 设置链接文本颜色为灰色 */
    margin-bottom: 10px;
}

/* 鼠标悬停时的链接样式 */
a:hover {
    color: red; /* 设置鼠标悬停时的文本颜色为红色 */
    font-weight: bold; /* 设置文本粗体 */
    font-size: 1.05rem;
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
	margin-left: 88%;
	gap: 10px
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

 td#inn { 
	display: flex; 
 	/* padding: 0px; */ 
 	/* width: 90px; */ 
 	/* height: 10px 0; */ 
 } 

 th { 
 	background-color: #f2f2f2; /* 設定表頭背景顏色 */ 
 } 

 tr:nth-child(even) { 
 	background-color: #f2f2f2; /* 設定奇數行背景顏色 */ 
 } 

 /* 設定表格間距 */ 
 .table-container { 
 	margin-top: 20px; 
 } 

div.inline {
	display: flex;
	gap: 8px;
}

</style>
</head>
<body>

	<header>
		<span>
			<h1 class="header-title" style="font-size: 2rem;font-weight: bold;margin-top: 15px;">會員${memVO.memName}的所有訂單</h1>
			<p class="header-subtitle">
				<a href='diyorderfront.jsp'>返回DIY首頁</a>
			</p>
		</span>
	</header>

	
	<div id="padding">


	<table id="table_id">
		<thead>
			<tr>
				<th>DIY訂單編號</th>
				<th>會員編號</th>
				<th>DIY品項編號</th>
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
		</thead>
		<tbody>
			
			
			<c:forEach var="DiyOrderVO" items="${diyOrderList}">

				<tr>

					<td>${DiyOrderVO.diyOrderNo}</td>
					<td>${DiyOrderVO.memId}</td>

					<c:forEach var="DiyCateEntity" items="${diyCateList}">
						<c:choose>
								<c:when test="${DiyOrderVO.diyNo == DiyCateEntity.diyNo}">
									<td id="diyNo">${DiyCateEntity.diyName}</td>
								</c:when>
						</c:choose>			
					</c:forEach>

					<td>${DiyOrderVO.contactPerson}</td>
					<td>${DiyOrderVO.contactPhone}</td>
					<td>${DiyOrderVO.reservationNum}</td>

					<c:choose>
						<c:when test="${DiyOrderVO.diyPeriod == 0}">
							<td>上午</td>
						</c:when>
						<c:when test="${DiyOrderVO.diyPeriod == 1}">
							<td>下午</td>
						</c:when>
						<c:when test="${DiyOrderVO.diyPeriod == 2}">
							<td>晚上</td>
						</c:when>
					</c:choose>

					<td>${DiyOrderVO.diyReserveDate}</td>
					<td id="createTime11"><fmt:formatDate value="${DiyOrderVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

					<c:choose>
						<c:when test="${DiyOrderVO.reservationStatus == 0}">
							<td>訂位完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 1}">
							<td>訂位已取消，尚未退款完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 2}">
							<td>退款完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 3}">
							<td>當日未到</td>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${DiyOrderVO.paymentStatus == 0}">
							<td>已付款</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 1}">
							<td>已完成訂單</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 2}">
							<td>已失效訂單</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 3}">
							<td>已退款訂單</td>
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

 <script type="text/javascript">
 
//  new DataTable('#table_id');


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

 
 </script>   

</body>
</html>