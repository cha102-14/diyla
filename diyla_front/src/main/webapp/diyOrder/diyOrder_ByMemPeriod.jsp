<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page import="com.cha102.diyla.diycatemodel.*"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
Integer memId = (Integer) session.getAttribute("memId");
MemberService memSvc = new MemberService();
MemVO memVO = memSvc.selectMem(memId);
DiyOrderVO diyOrderVO = new DiyOrderVO();
pageContext.setAttribute("memVO", memVO);
%>

<!-- 前台(會員DIY訂單)包含退款、修改、查全部訂單(已驗證)，差帶入diyCate的diyName -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人訂單管理</title>

<style type="text/css">
<
link href ="https: //cdn.jsdelivr.net /npm /bootstrap @5.1.1 /dist /css
	/bootstrap.min.css " rel ="stylesheet " integrity ="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU
	" crossorigin ="anonymous ">header {
	background-color: rgb(243, 151, 5);; /* 背景顏色 */
	color: white; /* 文字顏色 */
	padding: 10px 0; /* 上下內邊距 10px，左右內邊距 0 */
	text-align: center; /* 文字置中 */
}

h1 {
	font-size: 1.5rem;
}

div#buttom {
	display: flex; /* 使用 Flex 布局 */
	gap: 5px;
	margin-left: 3px;
}

table {
	border-collapse: collapse; /* 合併邊框 */
	width: 100%; /* 設定表格寬度 */
	font-family: Arial, sans-serif; /* 設定字體 */
	border: 1px solid black; /* 設定邊框 */
	font-size: 0.8rem;
	text-align: center;
	margin: 50px 0;
}

th {
	border: 1px solid black;
	background-color: #f2f2f2; /* 設定表頭背景顏色 */
}

td {
	border: 1px solid black;
}

th, td, tr {
	width: 100px;
	height: 20px;
}

tr:nth-child(even) {
	border: 1px solid black;
	background-color: #f2f2f2; /* 設定奇數行背景顏色 */
}

div#body {
	margin-left: 100px;
	margin-right: 100px;
	display: block;
}

#annotation1, #annotation2 {
	font-weight: bold;
	color: black;
	font-size: 25px;
	text-align: center;
}

#annotation1 span, #annotation2 span {
	font-weight: bold;
	color: red;
	font-size: 25px;
}

.getOne_For_Update_front_js {
	cursor: pointer;
}

#lightbox_contact {
	/*   border: 1px solid red; */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: hsla(0, 0%, 0%, .5);
}

.none {
	display: none;
}

.none_cancel {
	display: none;
}

/* 元素 article 置中及基本樣式 */
#lightbox_contact>article {
	background-color: white;
	width: 90%;
	max-width: 800px;
	border-radius: 10px;
	box-shadow: 0 0 10px #ddd;
	padding: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#lightbox_cancel {
	/*   border: 1px solid red; */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: hsla(0, 0%, 0%, .5);
}

/* 元素 article 置中及基本樣式 */
#lightbox_cancel>article {
	background-color: white;
	width: 90%;
	max-width: 800px;
	border-radius: 10px;
	box-shadow: 0 0 10px #ddd;
	padding: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>



</head>


<body>
	<div >
		<jsp:include page="/front_header.jsp"  />	
	</div>
	
	--會員編號:${memId}--
	<input type="hidden" name="memId" value="${memId}">
	<br> --您好，${memVO.memName}--
	<input type="hidden" class="uuu" value="${uuu}">
	
	
	<input type="hidden" class="refund_check" value="${refund_check}">
	<input type="hidden" class=diyCateList value="${diyCateList}">
	<input type="hidden" class="diyReserveDate" value="${diyReserveDate}">
	<input type="hidden" class=diyPeriod value="${diyPeriod1}">
	
	<div id="body">

		<header>
			<span>
<%-- 				<c:choose> --%>
<%-- 						<c:when test="${diyPeriod == 0}"> --%>
<%-- 							<h1 class="header-title">${diyReserveDate} 上午 訂單列表</h1> --%>
<%-- 						</c:when> --%>
<%-- 						<c:when test="${diyPeriod == 1}"> --%>
							<h1 class="header-title">${diyReserveDate} ${diyPeriod} 訂單列表</h1>
<%-- 						</c:when> --%>
<%-- 						<c:when test="${diyPeriod == 2}"> --%>
<%-- 							<h1 class="header-title">${diyReserveDate} 晚上 訂單列表</h1> --%>
<%-- 						</c:when> --%>
<%-- 					</c:choose>	 --%>
			</span>
		</header>
					

		<table>
			<tr>
				<!-- 		<th>DIY訂單編號</th> -->
				<!-- 		<th>會員編號</th>  -->


				<th>操作</th>
				<th>DIY品項名稱</th>
				<th>聯絡人</th>
				<th>聯絡電話</th>
				<th>預約人數</th>
				<th>預約時段</th>
				<th>DIY預約日期</th>
				<th>預約單建立/更改時間</th>
				<th>預約狀態</th>
				<th>付款狀態</th>
				<th>DIY訂單金額</th>

			</tr>
			<c:forEach var="DiyOrderVO" items="${diyOrderList}">

				<tr>


					<%-- 		<td>${DiyOrderVO.diyOrderNo}</td> --%>
					<%-- 		<td>${DiyOrderVO.memId}</td> --%>



					<td>
						<div id="buttom">
							<FORM METHOD="post" action="#" style="margin-bottom: 0px;">
								<c:choose>
									<c:when test="${(DiyOrderVO.reservationStatus) == 1}">
										<input type="submit" value="變更聯絡資訊" disabled>
									</c:when>
									<c:when test="${(DiyOrderVO.reservationStatus) == 2}">
										<input type="submit" value="變更聯絡資訊" disabled>
									</c:when>
									<c:when test="${(DiyOrderVO.reservationStatus) == 3}">
										<input type="submit" value="變更聯絡資訊" disabled>
									</c:when>
									<c:when test="${(DiyOrderVO.paymentStatus) == 1}">
										<input type="submit" value="變更聯絡資訊" disabled>
									</c:when>
									<c:when test="${(DiyOrderVO.paymentStatus) == 2}">
										<input type="submit" value="變更聯絡資訊" disabled>
									</c:when>
									<c:when test="${(DiyOrderVO.paymentStatus) == 3}">
										<input type="submit" value="變更聯絡資訊" disabled>
									</c:when>
									<c:otherwise>
										<!--  									<input type="submit" value="變更聯絡資訊" class="getOne_For_Update_front_js"  data-bs-target="#staticBackdrop"> -->
										<button type="button" class="getOne_For_Update_front_js" data-bs-toggle="modal" data-bs-target="#staticBackdrop">變更聯絡資訊</button>

									</c:otherwise>
								</c:choose>
								<input type="hidden" name="DiyOrderVO" value="${DiyOrderVO}">
								<input type="hidden" name="diyOrderNo" value="${DiyOrderVO.diyOrderNo}"> 
								<input type="hidden" name="memId" value="${DiyOrderVO.memId}">
								<!--  							<input type="hidden" name="action" value="update_contact"> -->
							</FORM>


							<FORM METHOD="post" action="#" style="margin-bottom: 0px;">
								<c:choose>
									<c:when test="${(DiyOrderVO.reservationStatus)== 0 && (DiyOrderVO.paymentStatus) == 0}">
										<button type="button" class="getOne_For_cancel_front_js" data-bs-toggle="modal" data-bs-target="#div_light_cancel">取消訂單並退款</button>
									</c:when>
									<c:otherwise>
										<input type="submit" value="取消訂單並退款" disabled>
									</c:otherwise>
								</c:choose>


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

								<!-- 							<input type="hidden" name="action" value="getOne_For_cancel_front_js"> -->
							</FORM>
						</div>
					</td>

			<c:forEach var="DiyCateEntity" items="${diyCateList}">
					<c:choose>
							<c:when test="${DiyOrderVO.diyNo == DiyCateEntity.diyNo}">
								<td id="diyNo">${DiyCateEntity.diyName}</td>
							</c:when>
					</c:choose>			
			</c:forEach>
								
					<td id="contactPerson11" class="contactPerson">${DiyOrderVO.contactPerson}</td>
					<td id="contactPhone11">${DiyOrderVO.contactPhone}</td>
					<td id="reservationNum">${DiyOrderVO.reservationNum}</td>

					<c:choose>
						<c:when test="${DiyOrderVO.diyPeriod == 0}">
							<td id="diyPeriod">上午</td>
						</c:when>
						<c:when test="${DiyOrderVO.diyPeriod == 1}">
							<td id="diyPeriod">下午</td>
						</c:when>
						<c:when test="${DiyOrderVO.diyPeriod == 2}">
							<td id="diyPeriod">晚上</td>
						</c:when>
					</c:choose>

					<td id="diyReserveDate">${DiyOrderVO.diyReserveDate}</td>
					<td id="createTime11"><fmt:formatDate value="${DiyOrderVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<c:choose>
						<c:when test="${DiyOrderVO.reservationStatus == 0}">
							<td id="reservationStatus">訂位完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 1}">
							<td id="reservationStatus">訂位已取消，尚未退款完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 2}">
							<td id="reservationStatus">退款完成</td>
						</c:when>
						<c:when test="${DiyOrderVO.reservationStatus == 3}">
							<td id="reservationStatus">當日未到</td>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${DiyOrderVO.paymentStatus == 0}">
							<td id="paymentStatus">已付款</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 1}">
							<td id="paymentStatus">已完成訂單</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 2}">
							<td id="paymentStatus">已失效訂單</td>
						</c:when>
						<c:when test="${DiyOrderVO.paymentStatus == 3}">
							<td id="paymentStatus">已退款訂單</td>
						</c:when>
					</c:choose>
					
					
<%-- 					<c:forEach var="DiyCateEntity" items="${diyCateList}"> --%>
<%-- 						<c:choose> --%>
<%-- 								<c:when test="${DiyOrderVO.diyNo == DiyCateEntity.diyNo}"> --%>
<%-- 									<td id="diyPrice">${DiyCateEntity.amount}</td> --%>
<%-- 								</c:when> --%>
<%-- 						</c:choose>			 --%>
<%-- 					</c:forEach> --%>
					
					<td id="diyPrice">${DiyOrderVO.diyPrice}</td>
				</tr>
			</c:forEach>
		</table>
		<!--====================================================== Modal 1 ====================================================== -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">變更聯絡資訊</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<FORM METHOD="post" action="DiyOrderFrontController">
							<label for="contactPerson">聯絡人: </label> <input type="text"
								name="contactPerson" id="contactPerson1" value="0"> <br>

							<label for="contactPhone">聯絡電話:</label> 
							<input type="text" name="contactPhone" id="contactPhone1" value="1">
							<input type="hidden" name="diyOrderNo" id="diyOrderNo" value="0">
							<input type="hidden" name="action" value="update_contact">
							<input type="hidden" class="period" name="period" value="200">
							<br>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消修改</button>
							<button type="submit" class="btn btn-primary" id="btn btn-primary">確定修改</button>
							<p id="error_msg">     </p>
						</FORM>
					</div>
					
				</div>
			</div>
		</div>


		<!--====================================================== Modal 2 ====================================================== -->
				<div class="modal fade" id="div_light_cancel" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true" style="margin-top:70px;">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">退款確認</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<FORM METHOD="post" action="DiyOrderFrontController" >
						
						<div style="display:inline-block;">
						<label for="diyNo" style="display:inline-block;">DIY品項編號 ： </label><div class="diyNo" id="diyNo" style="display:inline-block;"></div>
						</div>
					
						<div>
						<label for="contactPerson" style="display:inline-block;">聯絡人： </label> 				 
						<div class="contactPerson" id="contactPerson" style="display:inline-block;"></div>
						</div>
						
						<div>
						<label for="contactPhone" style="display:inline-block;">聯絡電話：</label> 	 		
						<div class="contactPhone" id="contactPhone" style="display:inline-block;"></div>
						</div>
						
						<div>
						<label for="reservationNum" style="display:inline-block;">預約人數： </label>   		
						<div class="reservationNum" id="reservationNum" style="display:inline-block;"></div>
						</div>
						
						<div>
						<label for="diyPeriod" style="display:inline-block;">預約時段： </label>   		
						<div class="diyPeriod" id="diyPeriod" style="display:inline-block;"></div>
						</div>
						
						<div>
						<label for="diyReserveDate" style="display:inline-block;">預約日期：</label> 		
						<div class="diyReserveDate" id="diyReserveDate" style=" display:inline-block;"></div>
						<p id="time" style="color:red;font-weight: bold;display:inline-block;"></p>
						</div>
						
						<div>
						<label for="createTime" style="display:inline-block;">預約單建立/更改時間： </label> 		
						<div class="createTime" id="createTime" style="display:inline-block;"></div> 
						</div>
						
						<div>
						<label for="reservationStatus" style="display:inline-block;">預約狀態： </label>			
						<div class="reservationStatus" id="reservationStatus" style="display:inline-block;"></div>
						</div>
						<div>
						
						<label for="paymentStatus" style="display:inline-block;">付款狀態： </label><div class="paymentStatus" id="paymentStatus" style="display:inline-block;"></div>
						</div>
						
						<div>
						<label for="diyPrice" style="display:inline-block;">DIY訂單金額：</label><div class="diyPrice" id="diyPrice" style="display:inline-block;" ></div>
						</div>
							<input type="hidden" name="refund_qual" id="refund_qual" value="0">
							<input type="hidden" name="diyOrderNo" id="diyOrderNo11" value="0">
							<input type="hidden" name="diyReserveDate" id="diyReserveDate" value="0">
							<input type="hidden" name="diyPeriod1" id="diyPeriod1" value="0">
							<input type="hidden" name="action" value="cancel_order">
							<input type="hidden" class="period" name="period" value="200">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">保留訂單</button>
							<button type="submit" class="btn btn-primary" id="btn btn-primary">取消訂單</button>
						</FORM>
					</div>
					
				</div>
			</div>
		</div>
<!--======================================================================================================================== -->
		<li><a href='diyOrder_front.jsp'>回訂單管理</a></li>

		  </div>

		<br>

	</div>


	<div id="annotation1">
		<span> <svg width="25px" height="25px"
				xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
				stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round"
					d="M11.25 4.5l7.5 7.5-7.5 7.5m-6-15l7.5 7.5-7.5 7.5" />
</svg>註1:
		</span>每筆訂單僅能變更聯絡人或是聯絡電話，如需變更其他項目，請點選"取消並退款"，並重新新增訂單。
	</div>
	<div id="annotation2">
		<span> <svg width="25px" height="25px"
				xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
				stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round"
					d="M11.25 4.5l7.5 7.5-7.5 7.5m-6-15l7.5 7.5-7.5 7.5" />
</svg>註2:
		</span>如需取消訂單，需在報到當日前三日申請退款，方能退款成功，如報到三日內申請退款方不予受理退款事宜。
	</div>


	<jsp:include page="/front_footer.jsp" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script type="text/javascript">


	<!--====================================================== Modal 1 ====================================================== -->
	
	
let getOne_For_Update_front_js = document.getElementsByClassName("getOne_For_Update_front_js");
for(let el of getOne_For_Update_front_js){
	el.addEventListener("click", function(e){
		
		
	
		var a = el.closest('tr').querySelector('#contactPerson11').innerText;
		let inputa = document.querySelector('#contactPerson1');
		inputa.value = a;
		
		var b = el.closest('tr').querySelector('#contactPhone11').innerText;
		let inputb = document.querySelector('#contactPhone1');
		inputb.value = b;
		
		var c = el.closest('tr').querySelector('input[name="diyOrderNo"]').value;		
		let inputc = document.querySelector('input#diyOrderNo');
		inputc.value = c;
	});
}


<!--====================================================監聽有無更改、取消訂單、錯誤驗證錯訊====================================================== -->
 window.onload=function(){
	 const period = document.querySelector('.period');
	 console.log(period.value);
	 const uuu = document.querySelector('.uuu');
	 const refund_check = document.querySelector('.refund_check');
	 if(uuu.value === '1'){
		  swal('變更成功!', '已變更聯絡資訊', 'success');
	   }else if(uuu.value === '404'){
		  swal('請更正以下資訊','${errorMsgs.contactPerson} \n ${errorMsgs.contactPhone}' , 'error');
	   }else if(uuu.value === '405'){
		   swal('${errorMsgs.diyOrderList}','${errorMsgs.diyOrderList} ！ 點擊"OK"將導向前頁' , 'error').then(function () {
		        window.location.href = "diyOrder_front.jsp"
		    });
	   }
	 if(refund_check.value === '1'){
		 swal('取消訂單成功!', '${diyReserveDate} ${diyPeriod} 的訂位已取消訂位成功，訂單款項需一至三個工作天退款完成！', 'success');
	 }else if(refund_check.value === '2'){
		 swal('取消訂單成功!', '${diyReserveDate} ${diyPeriod} 的訂位已取消訂位，訂單款項因超過時效而無法退款！', 'success');
	 }
	}
 <!--====================================================== Modal 2 ====================================================== -->

let getOne_For_cancel_front_js = document.getElementsByClassName("getOne_For_cancel_front_js");


for(let el of getOne_For_cancel_front_js){
	el.addEventListener("click", function(e){
		
		var g = el.closest('tr').querySelector('#diyReserveDate').innerText;
		
		// 建立一個新的 Date 物件，它將包含現在的日期和時間
		var currentDate = new Date();

		// 指定比對的日期
		var targetDate = new Date(g);

		// 計算日期差距（以毫秒為單位）
		var timeDifference = targetDate - currentDate;

		// 計算相差的天數
		var dayDifference = Math.ceil(timeDifference / (1000 * 60 * 60 * 24));
		
		// 要塞進去的
		var time = document.querySelector('p#time');
		
		let inputm = document.querySelector('input#refund_qual');
		// 檢查是否相差超過三天
		if(currentDate < targetDate){
			if (dayDifference >= 3) {
				// 三天前退款
				time.innerHTML = '註：已達退款標準，退款需一至三個工作天';
				inputm.value = 1;
				
			} else {
				// 三天後退款
				time.innerHTML = '註：已超過退款時限，如仍需取消訂單將不會收到退款';
				inputm.value = 0;
				console.log(inputm.value);
			}
		}else if (currentDate = targetDate ){
			time.innerHTML = '註：已超過退款時限，如仍需取消訂單將不會收到退款';
		}else{
			time.innerHTML = '註：已失效訂單';
		}
		
		
		
		var d = el.closest('tr').querySelector('#diyNo').innerText;
		let inputd = document.querySelector('div#diyNo');
		inputd.innerHTML = d;
		
		
		var e = el.closest('tr').querySelector('#reservationNum').innerText;
		let inpute = document.querySelector('div#reservationNum');
		inpute.innerHTML = e;
		
		
		var f = el.closest('tr').querySelector('#diyPeriod').innerText;
		let inputf = document.querySelector('div#diyPeriod');
		let inputff = document.querySelector('input#diyPeriod1');
		inputf.innerHTML = f;
		inputff.value = f;
		
		
		let inputg = document.querySelector('div#diyReserveDate');
		let inputgg = document.querySelector('input#diyReserveDate');
		inputg.innerHTML = g;
		//傳預約時間
		inputgg.value = g;
		
		var h = el.closest('tr').querySelector('#reservationStatus').innerText;
		let inputh = document.querySelector('div#reservationStatus');
		inputh.innerHTML = h;
		
		var i = el.closest('tr').querySelector('#paymentStatus').innerText;
		let inputi = document.querySelector('div#paymentStatus');
		inputi.innerHTML = i;
		
		var j = el.closest('tr').querySelector('#diyPrice').innerText;
		let inputj = document.querySelector('div#diyPrice');
		inputj.innerHTML = j;
		
		var k = el.closest('tr').querySelector('#createTime11').innerText;
		let inputk = document.querySelector('div#createTime');
		inputk.innerHTML = k;
		
		
		var a = el.closest('tr').querySelector('#contactPerson11').innerText;
		let inputa = document.querySelector('div#contactPerson');
		inputa.innerHTML = a;
		
		var b = el.closest('tr').querySelector('#contactPhone11').innerText;
		let inputb = document.querySelector('div#contactPhone');
		inputb.innerHTML = b;
		
		var c = el.closest('tr').querySelector('input[name="diyOrderNo"]');		
		let inputc = document.querySelector('input#diyOrderNo11');
		inputc.value = c.value;
		console.log(inputc.value);
		console.log(c.value);
		
		
		var l = el.closest('tr').querySelector('input[name="diyOrderNo"]').value;		
		let inputl = document.querySelector('input#diyOrderNo');
		inputl.value = l;
		
	})	
}
</script>
</body>
</html>