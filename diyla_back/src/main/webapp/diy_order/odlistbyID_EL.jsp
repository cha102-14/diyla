<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
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
/* margin-left : 300px; */
border : 1px solid red;
height: 100%;
text-decoration:center;
line-height:50px;
}


/* 第二個 div，固定寬度 */
.center-div {
float: right;
min-height: 600px;
min-width: calc(100% - 300px);
/* height: 150px; */
/*   width: 300px; */
   text-align: center;
/* padding: 200px 300px 20px 0px; */
}
</style>

</head>
<body>

<li><a href='diyorderfront.jsp'>返回DIY首頁</a></li><br>

<div class="center-div">
<table>
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
	
<%-- 	<jsp:useBean id="doser" scope="page" class="com.cha102.diyla.diyOrder.DiyOrderService" /> --%>
	
	<tr>
		<td>${diyOrderVO.diyOrderNo}</td>
		<td>${diyOrderVO.memId}</td>
		<td>${diyOrderVO.diyNo}</td>
		<td>${diyOrderVO.contactPerson}</td>
		<td>${diyOrderVO.contactPhone}</td>
		<td>${diyOrderVO.reservationNum}</td>
		<td>${diyOrderVO.diyPeriod}</td>
		<td>${diyOrderVO.diyReserveDate}</td>
		<td>${diyOrderVO.createTime}</td>
		<td>${diyOrderVO.reservationStatus}</td>
		<td>${diyOrderVO.paymentStatus}</td>
		<td>${diyOrderVO.diyPrice}</td>
	</tr>
	
</table>
</div>



</body>
</html>