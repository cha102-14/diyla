<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
Integer memId = (Integer)session.getAttribute("memId");
MemberService memSvc = new MemberService();
MemVO memVO =  memSvc.selectMem(memId);
pageContext.setAttribute("memVO", memVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待退款訂單列表</title>

<style type="text/css">



header {
	background-color: rgb(243, 151, 5);; /* 背景顏色 */
	color: white; /* 文字顏色 */
	padding: 10px 0; /* 上下內邊距 10px，左右內邊距 0 */
	text-align: center; /* 文字置中 */
	
}
h1{
font-size: 1.5rem;
}

div#buttom{
 display: flex; /* 使用 Flex 布局 */
  gap:10px;
  margin-left: 3px;
}


table {
	border-collapse: collapse; /* 合併邊框 */
	width: 100%; /* 設定表格寬度 */
	font-family: Arial, sans-serif; /* 設定字體 */
	border: 1px solid black; /* 設定邊框 */
	font-size: 0.8rem;
	text-align: center;
	margin: 50px 0;
}

th {
	border: 1px solid black;
	background-color: #f2f2f2; /* 設定表頭背景顏色 */
}

td {
border: 1px solid black;

}
th,td,tr{
	width: 100px;
	height: 20px;
}

tr:nth-child(even) {
	border: 1px solid black;
	background-color: #f2f2f2; /* 設定奇數行背景顏色 */
}

div#body{
  margin-left: 200px;
  margin-right: 250px;
  display: block;
}

 #annotation1 { 
     font-weight: bold; 
     color: black; 
     font-size: 25px; 
     text-align: center;
     } 


 #annotation1 span { 
     font-weight: bold; 
     color: red; 
    font-size: 25px; 
     } 

</style>



</head>
<body>
<jsp:include page="/front_header.jsp" />
--會員編號:${memId}-- 
<br> 
--您好，${memVO.memName}--
<input type="hidden" class="uuu" value="${uuu}">
<div id="body">

	<header>
		<span>
			<h1 class="header-title">退款訂單狀態列表</h1>
		</span>
	</header>
	
	
	<table>
			<tr>
				<!-- 		<th>DIY訂單編號</th> -->
				<!-- 		<th>會員編號</th>  -->


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
			<c:forEach var="DiyOrderVO" items="${diyOrderList}">

				<tr>


					<%-- 		<td>${DiyOrderVO.diyOrderNo}</td> --%>
					<%-- 		<td>${DiyOrderVO.memId}</td> --%>


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
					
					
<%-- 					<c:forEach var="DiyCateEntity" items="${diyCateList}"> --%>
<%-- 						<c:choose> --%>
<%-- 								<c:when test="${DiyOrderVO.diyNo == DiyCateEntity.diyNo}"> --%>
<%-- 									<td id="diyPrice">${DiyCateEntity.amount}</td> --%>
<%-- 								</c:when> --%>
<%-- 						</c:choose>			 --%>
<%-- 					</c:forEach> --%>


						<td id="diyPrice">${DiyOrderVO.diyPrice}</td>

					
				</tr>
			</c:forEach>
		</table>
<li><a href='diyOrder_front.jsp'>回訂單管理</a></li>
	<li><a href=''>待用連結</a></li>
</div>


<div id="annotation1">
<span> <svg  width="25px" height="25px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 4.5l7.5 7.5-7.5 7.5m-6-15l7.5 7.5-7.5 7.5" />
</svg>註:
</span>訂單取消後，需三個工作天內處理退款程序。
</div>




<jsp:include page="/front_footer.jsp" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

window.onload=function(){
	 const uuu = document.querySelector('.uuu');
	 if(uuu.value === '404'){
		 swal('${errorMsgs.diyOrderList}','${errorMsgs.diyOrderList} ！ 點擊"OK"將導向前頁' , 'error').then(function () {
		        window.location.href = "diyOrder_front.jsp"
		    });
	   }
}



























</script>

</body>
</html>