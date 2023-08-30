<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.empmodel.*"%>
<jsp:include page="/index.jsp"/>
<%EmpVO empVO = (EmpVO) request.getAttribute("empVO");%>
<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<link rel="stylesheet" href="../css/style.css">
<TITLE>員工單一查詢</TITLE>
</HEAD>
<BODY>

<table>
	<tr>
		<th>編號</th>
		<th>姓名</th>
		<th>帳號</th>
		<th>密碼</th>
		<th>信箱</th>
		<th>狀態</th>
	</tr>
	<tr>
		<td><%=empVO.getEmpId()%></td>
		<td><%=empVO.getEmpName()%></td>
		<td><%=empVO.getEmpAccount()%></td>
		<td><%=empVO.getEmpPassword()%></td>
		<td><%=empVO.getEmpEmail()%></td>
		<td><%=empVO.getEmpStatus()%></td>
	</tr>
</table>

</BODY>
</HTML>
