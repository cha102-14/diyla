<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<%@ page import="java.util.Base64" %>
<jsp:include page="/index.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
  LatestnewsVO latVO = (LatestnewsVO) request.getAttribute("latVO");
%>

<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>
<style>
body{
margin-left:500px;
}
img{
width:300px;
}
</style>
<link rel="stylesheet" href="../css/style.css">


</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3></h3>
		 <h4><a href="select_page.jsp"></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>公告編號</th>
		<th>公告內容</th>
		<th>公告圖片</th>
		<th>公告狀態</th>
		<th>發布時間</th>
	</tr>
	<tr>
		<td>S{latVO.newsNo}</td>
		<td>${latVO.newsContext}</td>
		<td><p><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(latVO.getAnnPic()) %>" alt="公告圖片"></p></td>
		<td><%=latVO.getAnnStatus()%></td>
		<td><%=latVO.getAnnTime()%></td>
	</tr>
</table>

</body>
</html>