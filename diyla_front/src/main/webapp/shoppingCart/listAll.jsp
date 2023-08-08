<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.shoppongcart.*"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>




<%
List<ShoppingCartVO> scvList = (List) session.getAttribute("shoppingCartList");
ShoppingCartService shoppingCartService = new ShoppingCartService();
CommodityService commodityService = new CommodityService();
CommodityVO comVo = null;
%>
<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>查詢結果</TITLE>
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="${ctxPath}/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/shoppingcart.css">
</head>
<style>

</style>
</HEAD>
<BODY>
<div class="topPage">
	<jsp:include page="../front_header.jsp" />
</div>
	<div class="mainContent">
		<h1 class="heading">我的購物車</h1>

		<%
		if (scvList != null && !scvList.isEmpty()) {
		%>

		<table width="85%" class="cartTable" cellspacing="0"
			cellpadding="10px">
			<tr class="title">
				<td class="subtitle compic">商品圖片</td>
				<td class="subtitle">商品名稱</td>
				<td class="subtitle">單價</td>
				<td class="subtitle">數量</td>
				<td class="subtitle">小計</td>
				<td class="subtitle">刪除商品</td>
			</tr>

			<%
			for (ShoppingCartVO cartItem : scvList) {
				int comNo = cartItem.getComNo();
				comVo = commodityService.findByID(comNo);
			%>
			<tr class="itemrow">
				<td class="itemInfo compic" ><a href="${ctxPath}/shop/CommodityController?action=findByID&comNO=<%=comVo.getComNO() %>" class="commodityPage"><img
					src="<%=comVo.getShowPic()%>" class="comPic"></a></td>
				<td class="itemInfo"><a href="${ctxPath}/shop/CommodityController?action=findByID&comNO=<%=comVo.getComNO() %>" class="commodityPage"><%=comVo.getComName()%></a></td>
				<td class="itemInfo"><%=comVo.getComPri()%></td>
				<td class="itemInfo">
					<form action="ShoppingCartServlet" method="post">
						<input type="hidden" name="comNo" value="<%=cartItem.getComNo()%>">
						<input type="hidden" name="memId" value="<%=cartItem.getMemId()%>">
						<input class="quantity-input" type="number" name="amount" min =0
							value="<%=cartItem.getComAmount()%>" data-original-amount="<%=cartItem.getComAmount()%>" /> <input type="hidden"
							name="action" value="changeAmount" />
						<button type="submit" class="updateButton">更新</button>
					</form>
				<td class="itemInfo"><%=(comVo.getComPri() * cartItem.getComAmount())%></td>
				<td class="itemInfo">
					<form action="ShoppingCartServlet" method="post" id="deleteForm">
						<input type="hidden" name="comNo" value="<%=cartItem.getComNo()%>">
						<input type="hidden" name="memId" value="<%=cartItem.getMemId()%>">
						<input type="hidden" name="action" value="delete" id="delaction">
						<button type="submit" class="deleteButton">刪除</button>
					</form>
				</td>
			</tr>
			<%
			}
			%>
			
		</table>

		<div class="handle">
			<form action="ShoppingCartServlet" method="post">
				<button type="submit" class="clearButton">清空購物車 </button>
				<input type="hidden"
					name="action" value="clear">
			</form>
			<a href="${ctxPath}/shop/CommodityController?action=listAll" class="shopPage">繼續購物</a>
			<span class="total-price">總金額: ${totalPrice}元</span> 
			<a class="checkout-btn" href="checkout">結帳</a>
		</div>
		<%
		} else {
		%>
		<div class="goShopping">
			<p class="tip">🧐你的購物車空空的🧐</p>
			<a class="shopLink" href="${ctxPath}/shop/CommodityController?action=listAll"><p style="font-size: 30px;">去商店選購</p><br>
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000" version="1.1" id="Capa_1" width="100px" height="100px" viewBox="0 0 902.86 902.86" xml:space="preserve"><g><g><path d="M671.504,577.829l110.485-432.609H902.86v-68H729.174L703.128,179.2L0,178.697l74.753,399.129h596.751V577.829z     M685.766,247.188l-67.077,262.64H131.199L81.928,246.756L685.766,247.188z"/><path d="M578.418,825.641c59.961,0,108.743-48.783,108.743-108.744s-48.782-108.742-108.743-108.742H168.717    c-59.961,0-108.744,48.781-108.744,108.742s48.782,108.744,108.744,108.744c59.962,0,108.743-48.783,108.743-108.744    c0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107,12.59-7.928,26.342-7.928,40.742    C469.675,776.858,518.457,825.641,578.418,825.641z M209.46,716.897c0,22.467-18.277,40.744-40.743,40.744    c-22.466,0-40.744-18.277-40.744-40.744c0-22.465,18.277-40.742,40.744-40.742C191.183,676.155,209.46,694.432,209.46,716.897z     M619.162,716.897c0,22.467-18.277,40.744-40.743,40.744s-40.743-18.277-40.743-40.744c0-22.465,18.277-40.742,40.743-40.742    S619.162,694.432,619.162,716.897z"/></g></g>
		</svg></a>
		</div>
		<%
		}
		%>
	</div>
	<jsp:include page="../front_footer.jsp" />

	<script src="../js/jquery-3.4.1.min.js"></script>
	<script>
	  $(document).ready(function() {
	        $('.updateButton').on('click', function() {
	            const inputField = $(this).closest('form').find('.quantity-input');
	            const originalAmount = parseInt(inputField.data('original-amount'));
	            const amount = parseInt(inputField.val());

	            if (amount === 0) {
	                const confirmDelete = confirm('數量為 0，確定要從購物車移除嗎？');
	                if (!confirmDelete) {
	                    inputField.val(originalAmount); // 恢復到原始數量
	                }
	            } 
	        });
	    });
	</script>
</BODY>
</HTML>