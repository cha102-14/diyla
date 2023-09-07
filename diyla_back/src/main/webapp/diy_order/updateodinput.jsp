<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/index.jsp" />
<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%
DiyOrderVO diyOrderVO = (DiyOrderVO) request.getAttribute("diyOrderVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>修改 還不知道要不要留</title>
</head>
<body>

<h1>DIY單筆資料修改</h1>

	
		<li><a href='diyorderfront.jsp'>返回DIY首頁</a></li><br>
		<li><a href='getallorderlist_EL.jsp'>查詢所有訂單</a></li><br>
		

		<form action="DiyOrderController" method="post">
		
		<br>
<!-- 			<label for="diyOrderNo">會員編號: </label>  -->
<%-- 			<input type="text" name="diyOrderNo" id="diyOrderNo" value="<%=DOVO.getDiyOrderNo()%>"> --%>
<!-- 			<br> -->
			<label for="diyOrderNo">訂單編號:</label>
			<input type="text" name="diyOrderNo" readonly value="<%= diyOrderVO.getDiyOrderNo() %>" >
			<br>
			
			<label for="memId">會員編號: </label> 
			<input type="text" name="memId" id="memId" value="<%=diyOrderVO.getMemId()%>">
			<br> 
			<label for="diyNo">DIY品項編號: </label> 
			<input type="text" name="diyNo" id="diyNo" value="<%=diyOrderVO.getDiyNo()%>">
			<br> 
			<label for="contactPerson">聯絡人: </label> 
			<input type="text" name="contactPerson" id="contactPerson" value="<%=diyOrderVO.getContactPerson()%>">
			<br> 
			<label for="contactPhone">聯絡電話:</label> 
			<input type="text" name=contactPhone id="contactPhone" value="<%=diyOrderVO.getContactPhone()%>">
			<br>

			<label for="reservationNum">預約人數: </label> 
			<select name="reservationNum" id="reservationNum">
				<option value="1" <%= (diyOrderVO.getReservationNum()==1)? "selected": "" %>>1人</option>
				<option value="2" <%= (diyOrderVO.getReservationNum()==2)? "selected": "" %>>2人</option>
				<option value="3" <%= (diyOrderVO.getReservationNum()==3)? "selected": "" %>>3人</option>
				<option value="4" <%= (diyOrderVO.getReservationNum()==4)? "selected": "" %>>4人</option>
				<option value="5" <%= (diyOrderVO.getReservationNum()==5)? "selected": "" %>>5人</option>
				<option value="6" <%= (diyOrderVO.getReservationNum()==6)? "selected": "" %>>6人</option>
				<option value="7" <%= (diyOrderVO.getReservationNum()==7)? "selected": "" %>>7人</option>
				<option value="8" <%= (diyOrderVO.getReservationNum()==8)? "selected": "" %>>8人</option>
			</select>
			<br> 
			
			<label for="diyPeriod">預約時段: </label> 
			<select name="diyPeriod" id="diyPeriod">
				<option value="0" <%= (diyOrderVO.getDiyPeriod()==0)? "selected": "" %>>上午</option>
				<option value="1" <%= (diyOrderVO.getDiyPeriod()==1)? "selected": "" %>>下午</option>
				<option value="2" <%= (diyOrderVO.getDiyPeriod()==2)? "selected": "" %>>晚上</option>
			</select>
			<br> 
			
			<label for="diyReserveDate">選擇預約日期：</label> 
			<input type="date" id="diyReserveDate" name="diyReserveDate" value="<%=diyOrderVO.getDiyReserveDate()%>">
			<br> 
			
			<label for="reservationStatus">預約狀態: </label>		
			<select name="reservationStatus" id="reservationStatus" >				
				<option value="0" <%= (diyOrderVO.getReservationStatus()==0)? "selected": "" %>>訂位完成</option>
				<option value="1" <%= (diyOrderVO.getReservationStatus()==1)? "selected": "" %>>訂位已取消，尚未退款完成</option>
				<option value="2" <%= (diyOrderVO.getReservationStatus()==2)? "selected": "" %>>退款完成</option>
				<option value="3" <%= (diyOrderVO.getReservationStatus()==3)? "selected": "" %>>當日未到</option>
			</select>
			<br> 
			<label for="paymentStatus">付款狀態: </label> 
			<select name="paymentStatus" id="paymentStatus">
				<option value="0" <%= (diyOrderVO.getPaymentStatus()==0)? "selected": "" %>>已付款</option>
				<option value="1" <%= (diyOrderVO.getPaymentStatus()==1)? "selected": "" %>>已完成訂單</option>
				<option value="2" <%= (diyOrderVO.getPaymentStatus()==2)? "selected": "" %>>已失效訂單</option>
				<option value="3" <%= (diyOrderVO.getPaymentStatus()==3)? "selected": "" %>>已退款訂單</option>
			</select>
			<br> 
			<label for="diyPrice">DIY訂單金額 </label> 
			<input type="text"name="diyPrice" id="diyPrice" value="<%=diyOrderVO.getDiyPrice()%>">
			<br>
				
				
			<input type="hidden" name="action" value="update">
			<input type="submit" value="修改完成送出">

		</form>
</body>
</html>