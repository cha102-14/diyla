<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" href="../css/style.css">
<title>編輯訂單</title>
<style>
/* 通用樣式 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

/* .topPage { */
/* 	text-align: center; */
/* 	padding: 10px; */
/* 	background-color: #333; */
/* 	color: white; */
/* } */

/* 編輯表單區域 */
.editform {
	width: 400px;
	margin: 5px 500px;
	padding: 20px;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.heading {
	text-align: center;
	font-size: 36px;
	color: #333;
}

/* 資訊區塊 */
.info {
	margin-bottom: 10px;
}

.info span {
	display: inline-block;
	width: 120px;
	font-weight: bold;
}

.info input[type="text"], .info input[type="datetime"], .info select {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.orderTime {
	border: 1px solid #ccc;
	padding: 8px 6px;
	width: 96%;
	margin: 10px 0px;
	background-color: #fff;
}

.status {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

/* 按鈕樣式 */
.submit-button {
	display: inline-block;
	width: 48%;
	background-color: #4caf50;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	transition: background-color 0.3s;
}

.cancel-button {
	display: inline-block;
	width: 48%;
	background-color: red;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	transition: background-color 0.3s;
}

.submit-button:hover {
	background-color: #45a049;
}

span.text {
	padding: 7px 0px;
	box-sizing: content-box;
	width: 90px;
}

span.error {
	color: red;
	white-space: nowrap;
}
.heading{
padding:20px 0px;
background-color:#9999CC;
/* border: 1px solid black; */
border-radius: 5px;
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../index.jsp" />
	</div>
	<div class="editform">
		<h1 style="text-align: center;" class="heading">編輯訂單</h1>
		<form action="${ctxPath}/orderManage/OrderManageController"
			method="post">
			<!-- commodityOrderVOList -->
			<div class="info">
				<span class="text">訂單編號:</span> <input name="orderNO"
					value="${order.orderNO}" type="text" readonly="readonly"
					class="fixed"> <span class="text">會員編號:</span> <input
					name="memId" value="${order.memId}" type="text" readonly="readonly"
					class="fixed"> <span class="text">訂單日期:</span>
				<p class="orderTime">
					<fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd" />
				</p>
				<span class="text">訂單狀態:</span> <select class="status"
					name="orderStatus">
					<option value="0" ${order.orderStatus == 0 ? 'selected' : ''}>訂單成立</option>
					<option value="1" ${order.orderStatus == 1 ? 'selected' : ''}>已付款</option>
					<option value="2" ${order.orderStatus == 2 ? 'selected' : ''}>備貨中</option>
					<option value="3" ${order.orderStatus == 3 ? 'selected' : ''}>已出貨</option>
					<option value="4" ${order.orderStatus == 4 ? 'selected' : ''}>已完成</option>
					<option value="5" ${order.orderStatus == 5 ? 'selected' : ''}>已取消</option>
				</select> <span class="text">金額:</span> <input name="orderPrice"
					value="${order.actualPrice }" type="text" readonly="readonly">
				<span class="text">收件人:</span>
				<c:if test="${not empty ErrorMap && ErrorMap['recipient'] != null}">
					<span class="error">${ErrorMap['recipient']}</span>
				</c:if>
				<input name="recipient" value="${order.recipient}" type="text" id="recipientName">
				<span class="text">收件地址:</span>
				<c:if
					test="${not empty ErrorMap && ErrorMap['recipientAddress'] != null}">
					<span class="error">${ErrorMap['recipientAddress']}</span>
				</c:if>
				<input name="recipientAddress" value="${order.recipientAddress}"
					type="text" id="recipientAddress"> <span class="text">連絡電話:</span>
				<c:if test="${not empty ErrorMap && ErrorMap['phone'] != null}">
					<span class="error">${ErrorMap['phone']}</span>
				</c:if>
				<input name="phone" value="${order.phone}" type="text" id="recipientPhone"> <input
					name="action" value="editcomplete" type="hidden">
				<button type="submit" class="submit-button">更新訂單</button>
				<button type="button" class="cancel-button">取消更新</button>

			</div>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	document.querySelector(".submit-button").addEventListener("click", function(e) {
		if(!validateFormFields()){
			console.log("wronggggggg");
	    e.preventDefault(); // 防止提交表單
		}else{
		    e.preventDefault(); // 防止提交表單
	    Swal.fire({
	        title: '確認更新訂單？',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '確認',
	        cancelButtonText: '取消'
	    }).then((result) => {
	    	   if (result.isConfirmed) {
	               Swal.fire({
	                   title: '更新成功',
	                   icon: 'success',
	                   timer: 1000, // 顯示成功提示 1 秒
	                   showConfirmButton: false
	               }).then(() => {
	                   setTimeout(() => {
	                       // 延遲 1 秒提交表單
	                       document.querySelector("form").submit();
	                   }, 1000);
	               });
	           }
	       });
		}
	});	
	

	function validateFormFields() {
		const recipientName = $("#recipientName").val();
		const recipientPhone = $("#recipientPhone")
				.val();
		const recipientAddress = $("#recipientAddress")
				.val();
		const phoneRegex = /^09\d{8}$/; // 電話號碼需以 "09" 開頭，總共 10 位數

		if (recipientName.trim() === "") {
			Swal.fire({
				icon : 'error',
				title : '錯誤',
				text : '請填寫收件人姓名'
			});
			return false;
		}

		if (!phoneRegex.test(recipientPhone)) {
			Swal.fire({
				icon : 'error',
				title : '錯誤',
				text : '請填寫正確的電話號碼，需以 09 開頭且總共 10 位數'
			});
			return false;
		}

		if (recipientAddress.trim() === "") {
			Swal.fire({
				icon : 'error',
				title : '錯誤',
				text : '請填寫收件人地址'
			});
			return false;
		}
		return true;
	}
	
	
	
		const cancelButton = $(".cancel-button");

		cancelButton.click(function() {
		    window.location.href = "http://localhost:8081/diyla_back/orderManage/OrderManageController?action=listAllOrder";
		});
	</script>
</body>
</html>