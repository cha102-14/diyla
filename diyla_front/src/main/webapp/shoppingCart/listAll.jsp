<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@ page import="com.cha102.diyla.shoppingcart.ShoppingCartVO"%>
<%@ page import="com.cha102.diyla.shoppingcart.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>DIYLA購物車</TITLE>
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="${ctxPath}/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/shoppingcart.css">
<style>
</style>
</HEAD>
<BODY>
	<div class="topPage">
		<jsp:include page="/front_header.jsp" />
	</div>


	<div class="mainContent">
		<h1 class="heading" style="width:250px;">
		<svg width="32px" height="32px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M2.08416 2.7512C2.22155 2.36044 2.6497 2.15503 3.04047 2.29242L3.34187 2.39838C3.95839 2.61511 4.48203 2.79919 4.89411 3.00139C5.33474 3.21759 5.71259 3.48393 5.99677 3.89979C6.27875 4.31243 6.39517 4.76515 6.4489 5.26153C6.47295 5.48373 6.48564 5.72967 6.49233 6H17.1305C18.8155 6 20.3323 6 20.7762 6.57708C21.2202 7.15417 21.0466 8.02369 20.6995 9.76275L20.1997 12.1875C19.8846 13.7164 19.727 14.4808 19.1753 14.9304C18.6236 15.38 17.8431 15.38 16.2821 15.38H10.9792C8.19028 15.38 6.79583 15.38 5.92943 14.4662C5.06302 13.5523 4.99979 12.5816 4.99979 9.64L4.99979 7.03832C4.99979 6.29837 4.99877 5.80316 4.95761 5.42295C4.91828 5.0596 4.84858 4.87818 4.75832 4.74609C4.67026 4.61723 4.53659 4.4968 4.23336 4.34802C3.91052 4.18961 3.47177 4.03406 2.80416 3.79934L2.54295 3.7075C2.15218 3.57012 1.94678 3.14197 2.08416 2.7512Z" fill="#1C274C"></path> <path d="M7.5 18C8.32843 18 9 18.6716 9 19.5C9 20.3284 8.32843 21 7.5 21C6.67157 21 6 20.3284 6 19.5C6 18.6716 6.67157 18 7.5 18Z" fill="#1C274C"></path> <path d="M16.5 18.0001C17.3284 18.0001 18 18.6716 18 19.5001C18 20.3285 17.3284 21.0001 16.5 21.0001C15.6716 21.0001 15 20.3285 15 19.5001C15 18.6716 15.6716 18.0001 16.5 18.0001Z" fill="#1C274C"></path> </g></svg>
		我的購物車
		</h1>
		
		<c:choose>
			<c:when test="${not empty shoppingCartList}">

				<table width="85%" class="cartTable" cellspacing="0"
					cellpadding="10px">
					<tr class="title">
						<td class="subtitle compic">商品圖片</td>
						<td class="subtitle">商品名稱</td>
						<td class="subtitle">單價</td>
						<td class="subtitle">數量</td>
						<td class="subtitle subTotal">小計</td>
						<td class="subtitle">刪除商品</td>
					</tr>
					<c:forEach var="cartItem" items="${shoppingCartList}">
						<tr class="itemrow${cartItem.comNo} itemrow">
							<td class="itemInfo compic"><a
								href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${cartItem.comNo}"
								class="commodityPage"> <img src="${cartItem.showPic}"
									class="comPic"></a></td>
							<td class="itemInfo"><a
								href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${cartItem.comNo}"
								class="commodityPage">${cartItem.comName}</a></td>
							<td class="itemInfo commPri">${cartItem.comPri}</td>
							<td class="itemInfo"><input type="hidden" name="comNo"
								value="${cartItem.comNo}" class="ucomNo"> <input
								type="hidden" name="memId" value="${cartItem.memId}"
								class="umemId"> <input class="quantity-input"
								type="number" name="amount" min="0"
								value="${cartItem.comAmount}"
								data-original-amount="${cartItem.comAmount}" />
								<button type="button" class="updateButton">更新</button></td>
							<td class="itemInfo">${cartItem.comPri*cartItem.comAmount}</td>
							<td class="itemInfo"><input type="hidden" name="comNo"
								value="${cartItem.comNo}" class="dcomNo"> <input
								type="hidden" name="memId" value="${cartItem.memId}"
								class="dmemId">
								<button type="button" class="deleteButton">刪除</button></td>
						</tr>
					</c:forEach>
				</table>
				<div class="handle">
					<button type="button" class="clearButton" id="clearCart">清空購物車</button>
					<input type="hidden" name="action" value="clear"> <a
						href="${ctxPath}/shop/CommodityController?action=listAll"
						class="shopPage">繼續購物</a> <span class="total-price">總金額:${totalPrice}元</span>
						<a href="${ctxPath}/shopR/checkout/${memId}" class="checkout-btn" type="button" id="checkout">結帳</a>
				</div>
			</c:when>

			<c:otherwise>
				<div class="goShopping">
					<p class="tip">🧐你的購物車空空的🧐</p>
					<a class="shopLink"
						href="${ctxPath}/shop/CommodityController?action=listAll"> <span
						style="font-size: 30px;">去商店選購</span> <br> <svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"
							version="1.1" id="Capa_1" width="100px" height="100px"
							viewBox="0 0 902.86 902.86" xml:space="preserve">
					<g>
					<g>
					<path
								d="M671.504,577.829l110.485-432.609H902.86v-68H729.174L703.128,179.2L0,178.697l74.753,399.129h596.751V577.829z     M685.766,247.188l-67.077,262.64H131.199L81.928,246.756L685.766,247.188z" />
					<path
								d="M578.418,825.641c59.961,0,108.743-48.783,108.743-108.744s-48.782-108.742-108.743-108.742H168.717    c-59.961,0-108.744,48.781-108.744,108.742s48.782,108.744,108.744,108.744c59.962,0,108.743-48.783,108.743-108.744    c0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107,12.59-7.928,26.342-7.928,40.742    C469.675,776.858,518.457,825.641,578.418,825.641z M209.46,716.897c0,22.467-18.277,40.744-40.743,40.744    c-22.466,0-40.744-18.277-40.744-40.744c0-22.465,18.277-40.742,40.744-40.742C191.183,676.155,209.46,694.432,209.46,716.897z     M619.162,716.897c0,22.467-18.277,40.744-40.743,40.744s-40.743-18.277-40.743-40.744c0-22.465,18.277-40.742,40.743-40.742    S619.162,694.432,619.162,716.897z" /></g></g>
		</svg></a>
				</div>
			</c:otherwise>
		</c:choose>
		<button class="goTopButton">▲</button>
	</div>

	<div id="footer">
		<jsp:include page="/front_footer.jsp" />
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function() {
							//置頂按鈕
							$(window).scroll(function() {
								if ($(this).scrollTop() > 20) {
									$(".goTopButton").fadeIn();
								} else {
									$(".goTopButton").fadeOut();
								}
							});

							$(".goTopButton").click(function() {
								$("html, body").animate({
									scrollTop : 0
								}, "slow");
								return false;
							});
						});
	</script>
	<script>
	$(document).ready(function(){
		$(".deleteButton").click(function() {
			const button =$(this);
			const comNo = button.closest('tr').find(".dcomNo").val();
			const memId = <%=session.getAttribute("memId")%>;

			console.log(comNo);
			console.log(memId);
			 swal({
		            title: "確定要從購物車刪除嗎？",
		            icon: "warning",
		            buttons: true
			 }).then((removeItem) => {
	            if (removeItem) {
	            	console.log("del");
	                deleteCartItem(comNo,memId);
	            }
	        });
	    });
	
	//刪除
	 function deleteCartItem(comNo,memId){
		 $.ajax({
	            url: "/diyla_front/shopR/delete",
	            type: "POST",
	            data: {
	                comNo: comNo,
	                memId: memId
	            },
	            dataType: "json",
	            success: function(data) {
	                if (data.success) {
	                	 swal("成功刪除", "", "success");
	                     // 延遲 1 秒後刷新
	                     setTimeout(function() {
	                         window.location.reload("#mainContent");
	                     }, 1500);
	                } else {
	                	window.location.href="${ctxPath}/error.jsp"
	                }
	            },
	            error: function() {
	            	window.location.href="${ctxPath}/error.jsp"
	            }
	        });
	    }
	 
	 //修改
	 $('.updateButton').click(function(){
		 	const button = $(this);
		    const inputField = button.closest('tr').find('.quantity-input'); 
	        const originalAmount = parseInt(inputField.data('original-amount'));
	        const amount =  inputField.val(); 
	        const comNo = button.closest('tr').find(".ucomNo").val();
			const memId = <%=session.getAttribute("memId")%>;
			console.log(amount);
			console.log(inputField);
			console.log(comNo);
	        if (amount === "0") {
	            swal({
	                title: "數量為 0，確定要從購物車移除嗎？",
	                icon: "warning",
	            	buttons : true
	            }).then((removeItem) => {
	                if (removeItem) {
	                	deleteCartItem(comNo,memId);
	                } else {
	                	inputField.val(originalAmount); // 恢復到原始數量
	                }
	            });
	        }
	        else{
	        	updateCartItem(comNo,memId,amount);
	        }
	    });
	 function updateCartItem(comNo,memId,amount) {
		fetch("/diyla_front/shopR/update",{
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
               memId:memId,
               comNo:comNo,
               comAmount:amount
            })
        }).then(response => response.json())
          .then(data => {
            if (data.success) {
                swal("成功修改", "", "success");
                // 延遲 1 秒後刷新
                setTimeout(function () {
                	window.location.reload("#mainContent");
                }, 1500);
            } else {
            	window.location.href="${ctxPath}/error.jsp"
            }
        })
        .catch(error => {
        	window.location.href="${ctxPath}/error.jsp"
        });
	}
	 

	    
	    //清空購物車用
		 $('#clearCart').on('click',function(e){
				const memId = <%=session.getAttribute("memId")%>;
			 swal({
				 title: "確認將購物車清空？",
	                icon: "warning",
	            	buttons : true
			 }).then((deleteItem)=>{
				 if(deleteItem){
					 clearCartItem(memId);
				 }
			 });
			  
			 });
		 
		    //清空購物車用
		 function clearCartItem(memId){
			 $.ajax({
		            url: "/diyla_front/shopR/clear/"+${memId},
		            type: "DELETE",
		            data: {
		                memId: memId
// 		                action: "clear"
		            },
		            dataType: "json",
		            success: function(data) {
		                if (data.success) {
		                	 swal("成功清空購物車", "", "success");
		                     // 延遲 1 秒後刷新
		                     setTimeout(function() {
		                         window.location.reload("#mainContent");
		                     }, 1500);
		                } else {
		                	window.location.href="${ctxPath}/error.jsp"
		                    
		                }
		            },
		            error: function() {
		            	window.location.href="${ctxPath}/error.jsp"
		            }
		        });
		    }

		//選取所有數量input
		 const quantityInputs = document.querySelectorAll('.quantity-input');

		 // 計算小計更新總額
		 function updateTotals() {
		   let totalPrice = 0;

		   // foreach每個數量input
		   quantityInputs.forEach(input => {
		     const originalAmount = parseFloat(input.getAttribute('data-original-amount'));
		     const currentAmount = parseFloat(input.value);
		     const price = parseFloat(input.parentElement.previousElementSibling.textContent);

		     // 計算小計並更新
		     const subTotal = currentAmount * price;
		     input.parentElement.nextElementSibling.textContent = subTotal;

		     totalPrice += subTotal;
		   });

		   // 更新totalprice
		   document.querySelector('.total-price').textContent = '總金額:$'+totalPrice+'元';
		 }

		 // 監聽所有數字變化
		 quantityInputs.forEach(input => {
		   input.addEventListener('input', updateTotals);
		 });

		 // 初始化算總金額
		 updateTotals();

	 
	});
	</script>
</BODY>
</HTML>