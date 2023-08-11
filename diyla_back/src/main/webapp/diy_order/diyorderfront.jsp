<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>DIY首頁</h1>

	<ul>

		<li><a href='getallorderlist.jsp'>查詢所有訂單</a><br>
		<br></li>
		<li><a href='addorderlist.jsp'>新增訂單</a><br>
		<br></li>

		<li>
        <FORM METHOD="post" ACTION="DiyOrderController" >
            <b>輸入訂單編號 (如1):</b><input type="text" name="diyorderno">
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="查詢單筆資料">
        </FORM>
        </li>
	</ul>

</body>
</html>