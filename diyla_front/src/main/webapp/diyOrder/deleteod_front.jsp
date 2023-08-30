<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/front_header.jsp" />
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>取消DIY訂單確認</title>
</head>
<body>

	<h1>取消DIY訂單確認</h1>
	
	<div>
	您將取消於${DiyOrderVO.createTime}創建的訂位，如日後需重新建立訂位，請至DIY訂位專區新增一筆DIY訂單。	
	</div>
	
	<div>
	您的款項${DiyOrderVO.diyPrice}，將於三個工作天內退款至您的信用卡帳戶中，如需查詢退款狀態可至訂單管理中查看。
	</div>
	
	
		
		<br>
 			
		<label for="diyNo">DIY品項編號: </label> 
		<c:choose>
			<c:when test="${DiyOrderVO.diyNo == 0}">
				<div name="diyNo" value="0">點心</div>
			</c:when>
			<c:when test="${DiyOrderVO.diyNo == 1}">
				<div name="diyNo" value="1">蛋糕</div>
			</c:when>
			<c:when test="${DiyOrderVO.diyNo == 2}">
				<div name="diyNo" value="2">塔派</div>
			</c:when>
			<c:when test="${DiyOrderVO.diyNo == 3}">
				<div name="diyNo" value="3">生乳酪</div>
			</c:when>
			<c:otherwise>
				<div>其他</div>
			</c:otherwise>
		</c:choose>
			
		<br> 	
			
		<label for="contactPerson">聯絡人: </label> 				
		<div name="contactPerson">${DiyOrderVO.contactPerson}</div>	
		<br>
			 
		<label for="contactPhone">聯絡電話:</label> 	
		<div name="contactPhone">${DiyOrderVO.contactPhone}</div>	
			
		<br>

		<label for="reservationNum">預約人數: </label> 
		<div name="reservationNum" value="${DiyOrderVO.reservationNum}">${DiyOrderVO.reservationNum}</div>
		
		<br> 
			
		<label for="diyPeriod">預約時段: </label> 
		<c:choose>
			<c:when test="${DiyOrderVO.diyPeriod == 0}">
				<div name="diyPeriod" value="0">上午</div>
			</c:when>
			<c:when test="${DiyOrderVO.diyPeriod == 1}">
				<div name="diyPeriod" value="1">下午</div>
			</c:when>
			<c:when test="${DiyOrderVO.diyPeriod == 2}">
				<div name="diyPeriod" value="2">晚上</div>
			</c:when>
		</c:choose>
		
		<br> 
			
		<label for="diyReserveDate">選擇預約日期：</label> 
		<div name="diyReserveDate" value="${DiyOrderVO.diyReserveDate}">${DiyOrderVO.diyReserveDate}</div>
		
		<br> 
			
		<label for="createTime">預約單建立時間: </label>		
		<div name="createTime" value="${DiyOrderVO.createTime}">${DiyOrderVO.createTime}</div>
			
		<br> 
		
		<label for="reservationStatus">預約狀態: </label>		
		<c:choose>
				<c:when test="${DiyOrderVO.reservationStatus == 0}">
					<div name="reservationStatus" value="0">訂位完成</div>
				</c:when>
				<c:when test="${DiyOrderVO.reservationStatus == 1}">
					<div name="reservationStatus" value="1">訂位已取消，尚未退款完成</div>
				</c:when>
				<c:when test="${DiyOrderVO.reservationStatus == 2}">
					<div name="reservationStatus" value="2">退款完成</div>
				</c:when>
				<c:when test="${DiyOrderVO.reservationStatus == 3}">
					<div name="reservationStatus" value="3">當日未到</div>
				</c:when>
		</c:choose>
			
		<br> 
		
		<label for="paymentStatus">付款狀態: </label> 
		
		<c:choose>
				<c:when test="${DiyOrderVO.paymentStatus == 0}">
					<div name="paymentStatus" value="0">已付款</div>
				</c:when>
				<c:when test="${DiyOrderVO.paymentStatus == 1}">
					<div name="paymentStatus" value="1">已完成訂單</div>
				</c:when>
				<c:when test="${DiyOrderVO.paymentStatus == 2}">
					<div name="paymentStatus" value="2">已失效訂單</div>
				</c:when>
				<c:when test="${DiyOrderVO.paymentStatus == 3}">
					<div name="paymentStatus" value="3">已退款訂單</div>
				</c:when>
		</c:choose>
		
		<br> 
		
		<label for="diyPrice">DIY訂單金額 </label> 
		<div name="diyPrice" value="${DiyOrderVO.diyPrice}">${DiyOrderVO.diyPrice}</div>
			
		<br>
	
	<form action="DiyOrderFrontController" method="post" id="form1">
	
	<input type="hidden" name="diyOrderNo" value="${DiyOrderVO.diyOrderNo}">
	<input type="hidden" name="memId" value="${DiyOrderVO.memId}">
	<input type="hidden" name="diyNo" value="${DiyOrderVO.diyNo}">
	<input type="hidden" name="contactPerson" value="${DiyOrderVO.contactPerson}">
	<input type="hidden" name="contactPhone" value="${DiyOrderVO.contactPhone}">
	<input type="hidden" name="reservationNum" value="${DiyOrderVO.reservationNum}">
	<input type="hidden" name="diyPeriod" value="${DiyOrderVO.diyPeriod}">
	<input type="hidden" name="diyReserveDate" value="${DiyOrderVO.diyReserveDate}">
	<input type="hidden" name="reservationStatus" value="${DiyOrderVO.reservationStatus}">
	<input type="hidden" name="paymentStatus" value="${DiyOrderVO.paymentStatus}">
	<input type="hidden" name="diyPrice" value="${DiyOrderVO.diyPrice}">	
	
	<input type="hidden" name="action" value="cancel_order_comfirm">
	<input type="submit" value="確定取消訂單">
	
	</form>
	
	<form action="DiyOrderFrontController" method="post" id="form2">
	
	<input type="hidden" name="diyOrderNo" value="${DiyOrderVO.diyOrderNo}">
	<input type="hidden" name="memId" value="${DiyOrderVO.memId}">
	<input type="hidden" name="diyNo" value="${DiyOrderVO.diyNo}">
	<input type="hidden" name="contactPerson" value="${DiyOrderVO.contactPerson}">
	<input type="hidden" name="contactPhone" value="${DiyOrderVO.contactPhone}">
	<input type="hidden" name="reservationNum" value="${DiyOrderVO.reservationNum}">
	<input type="hidden" name="diyPeriod" value="${DiyOrderVO.diyPeriod}">
	<input type="hidden" name="diyReserveDate" value="${DiyOrderVO.diyReserveDate}">
	<input type="hidden" name="reservationStatus" value="${DiyOrderVO.reservationStatus}">
	<input type="hidden" name="paymentStatus" value="${DiyOrderVO.paymentStatus}">
	<input type="hidden" name="diyPrice" value="${DiyOrderVO.diyPrice}">
	
	<input type="hidden" name="action" value="keep_order">
	<input type="submit" value="保留訂單">
	
	</form>
	
	
	
	
	
--可ajax部分渲染該筆取消的訂單明細--
</body>
</html>