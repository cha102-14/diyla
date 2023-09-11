<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<%@ page import="java.util.Base64" %>
<jsp:include page="/index.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  LatestnewsVO latVO = (LatestnewsVO) request.getAttribute("latVO");
%>

<html>
<head>
<title>單筆查詢</title>

<link rel="stylesheet" href="../css/style.css">
<style>
body {
    background-color: #f7f3e9;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
    align-items: center;
}

table#table1 {
    border-collapse: collapse;
    width: 85%;
    margin: 20px auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table th, table td {
    padding: 10px;
    border: 1px solid #dcdcdc;
}

table th {
    background-color: #f39c12;
    color: #ffffff;
    font-size: 18px;
}

table td {
    font-size: 16px;
    color: #333;
}

img {
    max-width: 100%;
    height: auto;
    border-radius: 10px;
}


</style>

</head>
<body bgcolor='white'>
  <jsp:include page="/latestnews/lat_header.jsp" />

<table id="table1">
	<tr>
		<th>公告編號</th>
		<th>公告內容</th>
		<th>公告圖片</th>
		<th>公告狀態</th>
		<th>發布時間</th>
	</tr>
	<tr>
		<td><%= latVO.getNewsNo()%></td>
		<td><%= latVO.getNewsContext()%></td>
		<td><p><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(latVO.getAnnPic()) %>" alt="公告圖片"></p></td>
		<td><%=latVO.getAnnStatus()%></td>
		<td><%=latVO.getAnnTime()%></td>
	</tr>
</table>

</body>
</html>