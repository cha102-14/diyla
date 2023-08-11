<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%@ page import="java.util.List" %>
<%@ page isELIgnored="false"%>

<%
DiyOrderService DOSvc = new DiyOrderService(); //EmpServlet.java(Concroller), 存入req的empVO物件
List<DiyOrderVO> DOVOS = DOSvc.getAll();
pageContext.setAttribute("DOVOS",DOVOS);
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
<% List<DiyOrderVO> doList = (List)pageContext.getAttribute("DOVOS");%>

<% if (doList != null) { %>
            <% for (DiyOrderVO b: doList) { %>
  
                	
		<td><%=b.getDiyOrderNo()%> </td>
		<td><%=b.getMemId()%> </td>
		<td><%=b.getDiyNo()%></td>
		<td><%=b.getContactPerson()%></td>
		<td><%=b.getContactPhone()%></td>
		<td><%=b.getReservationNum()%></td>
		<td><%=b.getDiyPeriod()%></td>
		<td><%=b.getDiyReserveDate()%></td>
		<td><%=b.getCreateTime()%></td>
		<td><%=b.getReservationStatus()%></td>
		<td><%=b.getPaymentStatus()%></td>
		<td><%=b.getDiyPrice()%></td>
		<td>
			  <FORM METHOD="post" ACTION="DiyOrderController" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="diyOrderNo" value="<%=b.getDiyOrderNo()%>">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="DiyOrderController" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="diyOrderNo"  value="<%=b.getDiyOrderNo()%>">
			     <input type="hidden" name="action" value="delete">
			  </FORM>
			</td>
	</tr>
<%-- <%=b.getDiyOrderNo()%> --%>
                <% } %>
                <% } %>
	
</table>

	
	


</body>
</html>