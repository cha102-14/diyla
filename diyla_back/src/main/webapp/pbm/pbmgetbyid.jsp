<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>常見問題單筆</title>
<link rel="stylesheet" href="../css/style.css">
<style>
    body{
    margin-left:300px;
    }
</style>



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
		<th>常見問題編號</th>
		<th>常見問題分類</th>
		<th>常見問題標題</th>
		<th>常見問題內容</th>
	</tr>
	<tr>
		<td>${pbmVO.pbmNo}</td>
		<td>${pbmVO.pbmSort}</td>
		<td>${pbmVO.pbmTitle}</td>
		<td>${pbmVO.pbmContext}</td>
	</tr>
</table>

</body>
</html>