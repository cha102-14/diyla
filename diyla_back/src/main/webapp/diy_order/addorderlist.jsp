<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>DIY資料新增</h1>

	
		<li><a href='diyorderfront.jsp'>返回DIY首頁</a></li><br>
		<li><a href='getallorderlist.jsp'>查詢所有訂單</a></li><br>
		

		<form action="DiyOrderController" method="post">

			
			
			
			<label for="memId">會員編號: </label> 
			<input type="text" name="memId" id="memId">
			<br> 
			<label for="diyNo">DIY品項編號: </label> 
			<input type="text" name="diyNo" id="diyNo">
			<br> 
			<label for="contactPerson">聯絡人: </label> 
			<input type="text" name="contactPerson" id="contactPerson">
			<br> 
			<label for="contactPhone">聯絡電話:</label> 
			<input type="text" name=contactPhone id="contactPhone">
			<br>

			<label for="reservationNum">預約人數: </label> 
			<select name="reservationNum" id="reservationNum">
				<option value="1">1人</option>
				<option value="2">2人</option>
				<option value="3">3人</option>
				<option value="4">4人</option>
				<option value="5">5人</option>
				<option value="6">6人</option>
				<option value="7">7人</option>
				<option value="8">8人</option>
			</select>
			<br> 
			
			<label for="diyPeriod">預約時段: </label> 
			<select name="diyPeriod" id="diyPeriod">
				<option value="0">上午</option>
				<option value="1">下午</option>
				<option value="2">晚上</option>
			</select>
			<br> 
			
			<label for="diyReserveDate">選擇預約日期：</label> 
			<input type="date" id="diyReserveDate" name="diyReserveDate">
			<br> 
			
			<label for="reservationStatus">預約狀態: </label>		
			<select name="reservationStatus" id="reservationStatus">				
				<option value="0">待審核</option>
				<option value="1">訂位完成</option>
				<option value="2">訂位取消</option>
				<option value="3">當日未到</option>
			</select>
			<br> 
			<label for="paymentStatus">付款狀態: </label> 
			<select name="paymentStatus" id="paymentStatus">
				<option value="0">未付款</option>
				<option value="1">已付款</option>
				<option value="2">已退款</option>
				<option value="3">沒收訂金-不退款</option>
			</select>
			<br> 
			<label for="diyPrice">DIY訂單金額 </label> 
			<input type="text"name="diyPrice" id="diyPrice">
			<br>
				
				
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="新增Order明細資料">

		</form>
</body>
</html>