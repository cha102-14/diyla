<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.jsp" />
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>點名系統(for現場人員_傳值)</title>
<style type="text/css">
body{

margin-left: 300px;
}

</style>

</head>
<body>
	<header>
		<span>
			<h1 class="header-title">點名系統(for現場人員_請輸入日期及時段)</h1>
			
		</span>
	</header>
	
	<form action="DiyOrderController" method="post">

	
		<br> 
		<label for="diyReserveDate">選擇預約日期：</label> 
		<input type="date" id="diyReserveDate" name="diyReserveDate"> 
		
		<br>
		
		<label for="diyPeriod">預約時段: </label> 
		<select name="diyPeriod" id="diyPeriod">
			<option value="0">上午</option>
			<option value="1">下午</option>
			<option value="2">晚上</option>
		</select> 
		<br>

		<input type="hidden" name="action" value="getAllOrderByPeriod"> 
		<input type="submit" value="查詢時段訂單明細">

	</form>
	
</body>
</html>