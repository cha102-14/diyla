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

<li><a href='diyorderfront.jsp'>返回DIY首頁</a></li><br>
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
	<tr>
		<td><%=DOVO.getDiyOrderNo()%> </td>
		<td><%=DOVO.getMemId()%> </td>
		<td><%=DOVO.getDiyNo()%></td>
		<td><%=DOVO.getContactPerson()%></td>
		<td><%=DOVO.getContactPhone()%></td>
		<td><%=DOVO.getReservationNum()%></td>
		<td><%=DOVO.getDiyPeriod()%></td>
		<td><%=DOVO.getDiyReserveDate()%></td>
		<td><%=DOVO.getCreateTime()%></td>
		<td><%=DOVO.getReservationStatus()%></td>
		<td><%=DOVO.getPaymentStatus()%></td>
		<td><%=DOVO.getDiyPrice()%></td>
	</tr>
	
</table>

</body>
</html>