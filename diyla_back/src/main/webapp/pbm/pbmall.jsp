<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>
<%@ page import="com.cha102.diyla.commonproblemmodel.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
    PbmService pbmSvc = new PbmService();
    List<PbmVO> list = pbmSvc.getAll();
    pageContext.setAttribute("list",list);
%>

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
		<th>問題編號</th>
		<th>問題分類</th>
		<th>常見問題標題</th>
		<th>常見問題內容</th>
		<th>操作</th>

	</tr>
		<c:forEach var="pbmVO" items="${list}" >

	<tr>
		<td>${pbmVO.pbmNo}</td>
		<td>${pbmVO.pbmSort}</td>
		<td>${pbmVO.pbmTitle}</td>
		<td>${pbmVO.pbmContext}</td>
	<td>
	<form method="post" action="PbmController">
        <input type="hidden" name="pbmNo" value="${pbmVO.pbmNo}">
        <input type="hidden" name="action" value="update_start">
        <button type="submit">✏️編輯</button>
    </form>

    <form method="post" action="PbmController">
        <input type="hidden" name="pbmNo" value="${pbmVO.pbmNo}">
        <input type="hidden" name="action" value="delete_pbm">
        <button type="submit">❌刪除</button>
    </form>
	</tr>
	</td>
	</c:forEach>
</table>

</body>
</html>