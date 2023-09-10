<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

p{

margin-top: 10px;
}

</style>

</head>
<body>
	<header>
		<span>
		點名系統首頁
		</span>
	</header>
		<h1 class="header-title">查詢時段"有效"訂單(for現場人員點名用_請輸入日期及時段)</h1>
			
		
<%-- 	 <input type="hidden" class="uuu"  value="${uuu}"> --%>
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
		<input type="submit" value="查詢時段訂單明細">

	</form>
	
	<p style="color:red;font-weight: bold;">${errorMsgs.diyOrderList}</p>
	
	==========================================================================
	<h1 class="header-title">查詢時段所有訂單(for現場人員_請輸入日期及時段)</h1>
				

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


<div class="pennyrequest1">
		<li><a href='diyorderfront.jsp'>返回DIY首頁</a></li>
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