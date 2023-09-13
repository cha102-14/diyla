<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page isELIgnored="false"%>


<%
Integer memId = (Integer) session.getAttribute("memId");
MemberService memSvc = new MemberService();
MemVO memVO = memSvc.selectMem(memId);
pageContext.setAttribute("memVO", memVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單狀態首頁</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
	min-height: 100vh;
}

#header {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	text-align: center;
}

.container1 {
	max-width: 800px;
	margin: 20px 300px 20px 390px;
	background-color: #fff;
	padding: 20px;
	border-radius: 30px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	display: inline-block;
	justify-content: center; /* 水平置中 */
	align-items: center; 
	height:500px;
}
#container_formgroup{
display: flex;
margin-top: 30px;
justify-content: center; /* 水平置中 */
	align-items: center;
}

.form-group {
	margin-bottom: 20px;
}

#form-group_1 {
	margin-bottom: 70px;
	margin-top: 50px;
	margin-left: -30px;
}

#form-group_2 {

	margin-left: -30px;
}

label {
	font-weight: bold;
}

input[type="date"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 15px;
}

input[type="submit"] {
	background-color: rgb(240, 170, 7);
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"].large1 {
	font-weight: bold;
	padding: 30px 60px;
	font-size: 1.2rem;
	border-radius: 30px;
	margin-left: 50px;
}

input[type="submit"].large2 {
font-weight: bold;
	font-size: 1rem;
	border-radius: 15px;
	margin-top: 50px;
	margin-left: 70px;
	height:50px;
	width:120px;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

.form-group.inline {
	display: inline-flex;
	/*         margin-right: 80px; */
	/*         margin-bottom: 150px; */
}

#form-group_2 {
	margin-left: 50px;
}
#super{
white-space: nowrap;
font-size: 1rem;
color: rgb(212, 116, 32);
margin-left: 78%;
margin-bottom: 30px;
}

#super:hover {
    color: red; 
    font-weight: bold; 
    font-size: 1.1rem;
    
}
</style>
</head>
<body>
	<jsp:include page="/front_header.jsp"></jsp:include>
	<%-- --會員編號:${memId}--  --%>
	<!-- <br>  -->
	<%-- --您好，${memVO.memName}-- --%>
	<input type="hidden" class="aaa" id="aaa" value="${aaa}">
	<!--     ================================================================= -->
	<div class="container1">
	<div style="margin-top: -10px;list-style-type: none;font-weight: bold;font-size: 2rem;" ><a href='${ctxPath}/diyOrder/Front.jsp'  id="super">>回DIY體驗首頁</a></div>
		<div id="container_formgroup">
			<div class="form-group inline" id="form-group_1">
				<form method="post" action="DiyOrderFrontController">
					<input type="hidden" name="memId" value="${memId}"> <input
						type="hidden" name="action" value="getAllOrderByMemId_front">
					<input type="submit" class="large1" value="所有訂單狀態">
				</form>
			</div>

			<div class="form-group inline" id="form-group_2">
				<form method="post" action="DiyOrderFrontController">
					<label for="diyReserveDate">選擇預約日期：</label> <input type="date" id="diyReserveDate" name="diyReserveDate"> <br> 
					<label for="diyPeriod">預約時段: </label> 
						<select name="diyPeriod" id="diyPeriod">
						<option value="0">上午</option>
						<option value="1">下午</option>
						<option value="2">晚上</option>
					</select> <br> <input type="hidden" name="memId" value="${memId}">
					<input type="hidden" name="action" value="getMemIdOrderByPeriod">
					<input type="submit" class="large2" style="font-size: 0.85rem;text-align: center;" value="查詢時段訂單">
				</form>
			</div>
		</div>	
	</div>
	
	
	<!--     ================================================================= -->
	<jsp:include page="/front_footer.jsp" />

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	<!--====================================================監聽有無更改、取消訂單、錯誤驗證錯訊====================================================== -->
		window.onload = function() {
			const aaa = document.querySelector('#aaa');
			if (aaa.value === '404') {
				swal('${errorMsgs.diyReserveDateNull}',
						'${errorMsgs.diyReserveDateNull}後重新點擊 ！ ', 'error')
			}
		}
	</script>
</body>
</html>