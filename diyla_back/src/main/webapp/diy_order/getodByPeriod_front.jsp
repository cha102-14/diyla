<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/index.jsp" />
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css" />
<title>點名系統首頁</title>
<style type="text/css">
body, p, ul {
    margin: 0;
    padding: 0;
}

/* Apply a background color and set font styles for the entire page */
body {
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
    margin-left: 280px;
}

/* Center the main content horizontally */
#bodymain {
    text-align: center;
    margin: 0 auto;
    max-width: 800px; /* Adjust as needed */
}

/* Style the header */
header {
    background-color: #f8a229;
    color: white;
    padding: 20px 40% 30px;
    font-size: 2rem;
    margin-top: -20px;
    margin-bottom: 20px;
}

/* Style the h1 element */
.header-title {
    margin: 0; /* 移除默认上下外边距 */
    font-size: 24px;
    margin-top: 10px; /* 添加一些顶部间距 */
}

#header-title2 {
    font-size: 24px;
    margin-top: 50px; /* 添加上方间距 */
}

/* Style the form elements */
form {
    margin-top: 20px;
    text-align: left;
}

label {
    font-weight: bold;
}

/* Add some spacing between form elements */
input[type="date"],
select {
    margin-bottom: 10px;
}

/* Style the submit button */
input[type="submit"] {
    background-color: #333;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #555;
}

/* Style error messages */
.error-message {
    color: red;
    font-weight: bold;
}

/* Style the "返回DIY首頁" link */
.pennyrequest1 {
    margin-top: 20px;
    text-align: center;
}

.pennyrequest1 a {
    font-size: 1.2rem;
    text-decoration: none;
    color: #333;
     margin-left: 80%;
     font-weight: bold;
}

.pennyrequest1 a:hover {
    text-decoration: underline;
    color: red;
    font-weight: bold;
    font-size:1.5rem; 
}


</style>

</head>
<body>
	<header>
		<span style="font-weight: bold;">
		點名系統首頁
		</span>
	</header>
		
			
<div class="margin">	

<div id="bodymain">
<h1 class="header-title" style="font-weight: bold;">查詢時段「有效」訂單(點名系統-請輸入日期及時段)</h1>	
	<form action="DiyOrderController" method="post">

	
		<br> 
		<label for="diyReserveDate">預約日期：</label> 
		
		<input type="date" id="diyReserveDate" name="diyReserveDate"> 
		<p style="color:red;font-weight: bold;">${errorMsgs.diyReserveDateNull}</p>
		
		<br>
		
		<label for="diyPeriod">預約時段: </label> 
		<select name="diyPeriod" id="diyPeriod">
			<option value="0">上午</option>
			<option value="1">下午</option>
			<option value="2">晚上</option>
		</select> 
		<br>

		<input type="hidden" name="action" value="getEffectOrderByPeriod"> 
		<input type="submit" value="進入點名系統">

	</form>
	
	<p style="color:red;font-weight: bold;">${errorMsgs.diyOrderList}</p>
	

	<h1 class="header-title" id="header-title2" style="font-weight: bold;">查詢時段「所有」訂單(請輸入日期及時段)</h1>
				

	<form action="DiyOrderController" method="post">

	
		<br> 
		<label for="diyReserveDate">預約日期：</label> 
		
		<input type="date" id="diyReserveDate" name="diyReserveDate"> 
		<p style="color:red;font-weight: bold;">${errorMsgs.diyReserveDateNull1}</p>
		
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

	<p style="color:red;font-weight: bold;">${errorMsgs.diyOrderList1}</p>


	
</div>
</div>
<div class="pennyrequest1">
		<li style="list-style-type: none;"><a href='diyorderfront.jsp' style="text-decoration: none;">>返回DIY首頁</a></li>
	</div>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">


window.onload=function(){
	 const uuu = document.querySelector('.uuu');
	 if(uuu.value === '404'){
		 	swal('請更正以下資訊','${errorMsgs.diyReserveDateNull}' , 'error');
	 }else if(uuu.value === '405'){
		 	swal('請更正以下資訊','${errorMsgs.diyOrderList}' , 'error');
	 }	 
}


</script>

</body>
</html>