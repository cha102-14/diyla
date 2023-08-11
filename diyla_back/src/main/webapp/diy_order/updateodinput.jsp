<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%
DiyOrderVO DOVO = (DiyOrderVO) request.getAttribute("DOVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>DIY單筆資料修改</h1>

	
		<li><a href='diyorderfront.jsp'>返回DIY首頁</a></li><br>
		<li><a href='getallorderlist.jsp'>查詢所有訂單</a></li><br>
		

		<form action="DiyOrderController" method="post">
		
		<br>
<!-- 			<label for="diyOrderNo">會員編號: </label>  -->
<%-- 			<input type="text" name="diyOrderNo" id="diyOrderNo" value="<%=DOVO.getDiyOrderNo()%>"> --%>
<!-- 			<br> -->
			<label for="diyOrderNo">訂單編號:</label>
			<input type="text" name="diyOrderNo" readonly value="<%= DOVO.getDiyOrderNo() %>" >
			<br>
			
			<label for="memId">會員編號: </label> 
			<input type="text" name="memId" id="memId" value="<%=DOVO.getMemId()%>">
			<br> 
			<label for="diyNo">DIY品項編號: </label> 
			<input type="text" name="diyNo" id="diyNo" value="<%=DOVO.getDiyNo()%>">
			<br> 
			<label for="contactPerson">聯絡人: </label> 
			<input type="text" name="contactPerson" id="contactPerson" value="<%=DOVO.getContactPerson()%>">
			<br> 
			<label for="contactPhone">聯絡電話:</label> 
			<input type="text" name=contactPhone id="contactPhone" value="<%=DOVO.getContactPhone()%>">
			<br>

			<label for="reservationNum">預約人數: </label> 
			<select name="reservationNum" id="reservationNum">
				<option value="1" <%= (DOVO.getReservationNum()==1)? "selected": "" %>>1人</option>
				<option value="2" <%= (DOVO.getReservationNum()==2)? "selected": "" %>>2人</option>
				<option value="3" <%= (DOVO.getReservationNum()==3)? "selected": "" %>>3人</option>
				<option value="4" <%= (DOVO.getReservationNum()==4)? "selected": "" %>>4人</option>
				<option value="5" <%= (DOVO.getReservationNum()==5)? "selected": "" %>>5人</option>
				<option value="6" <%= (DOVO.getReservationNum()==6)? "selected": "" %>>6人</option>
				<option value="7" <%= (DOVO.getReservationNum()==7)? "selected": "" %>>7人</option>
				<option value="8" <%= (DOVO.getReservationNum()==8)? "selected": "" %>>8人</option>
			</select>
			<br> 
			
			<label for="diyPeriod">預約時段: </label> 
			<select name="diyPeriod" id="diyPeriod">
				<option value="0" <%= (DOVO.getDiyPeriod()==0)? "selected": "" %>>上午</option>
				<option value="1" <%= (DOVO.getDiyPeriod()==1)? "selected": "" %>>下午</option>
				<option value="2" <%= (DOVO.getDiyPeriod()==2)? "selected": "" %>>晚上</option>
			</select>
			<br> 
			
			<label for="diyReserveDate">選擇預約日期：</label> 
			<input type="date" id="diyReserveDate" name="diyReserveDate" value="<%=DOVO.getDiyReserveDate()%>">
			<br> 
			
			<label for="reservationStatus">預約狀態: </label>		
			<select name="reservationStatus" id="reservationStatus" >				
				<option value="0" <%= (DOVO.getReservationStatus()==0)? "selected": "" %>>待審核</option>
				<option value="1" <%= (DOVO.getReservationStatus()==1)? "selected": "" %>>訂位完成</option>
				<option value="2" <%= (DOVO.getReservationStatus()==2)? "selected": "" %>>訂位取消</option>
				<option value="3" <%= (DOVO.getReservationStatus()==3)? "selected": "" %>>當日未到</option>
			</select>
			<br> 
			<label for="paymentStatus">付款狀態: </label> 
			<select name="paymentStatus" id="paymentStatus">
				<option value="0" <%= (DOVO.getPaymentStatus()==0)? "selected": "" %>>未付款</option>
				<option value="1" <%= (DOVO.getPaymentStatus()==0)? "selected": "" %>>已付款</option>
				<option value="2" <%= (DOVO.getPaymentStatus()==0)? "selected": "" %>>已退款</option>
				<option value="3" <%= (DOVO.getPaymentStatus()==0)? "selected": "" %>>沒收訂金-不退款</option>
			</select>
			<br> 
			<label for="diyPrice">DIY訂單金額 </label> 
			<input type="text"name="diyPrice" id="diyPrice" value="<%=DOVO.getDiyPrice()%>">
			<br>
				
				
			<input type="hidden" name="action" value="update">
			<input type="submit" value="修改完成送出">

		</form>
</body>
</html>