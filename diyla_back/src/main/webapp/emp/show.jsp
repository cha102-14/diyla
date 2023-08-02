<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.empmodel.*"%>

<%EmpVO empVO = (EmpVO) request.getAttribute("empVO");%>
<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>form1.jsp</TITLE>
</HEAD>
<BODY>

<table>
	<tr>
		<th>員工編號</th>
		<th>姓名</th>
		<th>管理員權限</th>
		<th>密碼</th>
		<th>狀態</th>
	</tr>
	<tr>
		<td><%=empVO.getEmpId()%></td>
		<td><%=empVO.getEmpName()%></td>
		<td><%=empVO.getEmpAccount()%></td>
		<td><%=empVO.getEmpPassword()%></td>
		<td><%=empVO.getEmpStatus()%></td>
	</tr>
</table>

</BODY>
</HTML>
