<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailVO"%>
<%@page import="com.cha102.diyla.commodityOrder.*"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
CommodityOrderService service = new CommodityOrderService();
List<CommodityOrderVO> commodityOrderVOList = service.getAll();
%>
<!DOCTYPE html>
<html>
<head>
<title>訂單管理</title>

<link rel="shortcut icon" href="${ctxPath}/ima/DIYLA_LOGO.png"
	type="image/x-icon">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
<style>
body {
	font-family: Arial, sans-serif;
	margin-left: 280px;
	padding: 0;
	background-color: #f4f4f4;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
	text-align: center;
	justify-content: center;
}

th, td {
	border: 1px solid #ccc;
	padding: 5px;
	text-align: center;
	justify-content: center;
}

.btn {
	cursor: pointer;
}

.o-detail {
	height: 35px;
	padding: 8px;
	text-align: center;
	justify-content: center;
	vertical-align: baseline;
}

#main_content {
	box-sizing: border-box;
/* 	float: inherit; */
	height: 800px;
	margin: 0px auto;
	background-color: white;
	padding: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	padding: 0px;
/* 	float: right; */
	width: 980px;
	overflow: scoll;
}

.heading {
	width: 960px;
	text-align: center;
	margin: 20px 0px;
	font-size: 30px;
	padding: 30px 0px;
	background-color: #b45f06;
	color: #fce5cd;
	border-radius: 5px;
}

.status {
	visibility: hidden;
}

.status-unpaid {
	background-color: #FFCC00; /* 未結帳的顏色 */
}

.status-processing {
	background-color: #3399FF; /* 備貨中的顏色 */
}

.status-paid {
	background-color: #A6FFA6; /*已付款的顏色*/
}

.status-shipping {
	background-color: #FF79BC; /*出貨*/
}

.status-completed {
	background-color: #66FF66; /* 已完成的顏色 */
}

.status-canceled {
	background-color: #FF3333; /* 已取消的顏色 */
}

/* @media ( max-width :767.98px) { */
/* 	aside.topPage { */
/* 		top: 0; */
/* 		height: 100%; */
/* 		transform: translateX(-100%); */
/* 		transition: all 1s; */
/* 	} */
/* } */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.tr_title {
	box-sizing: border-box;
	background-color: #8080C0;
	color: white;
	font-size: 12px;
}

/* .title th { */
/* 	padding: 10px; */
/* 	font-weight: bold; */
/* 	text-align: center; */
/* } */
.order_content_title td {
	font-size: 16px;
	padding: 4px;
	text-align: center;
}

.order_content {
	padding: 6px;
	text-align: center;
}

.noneOrder {
	font-size: 40px;
	text-align: center;
}

.status {
	padding: 5px 10px;
	background-color: #e0e0e0;
	border-radius: 5px;
	font-weight: bold;
}

form {
	display: inline;
}

.edit-order {
	/* 	color: white; */
	border: none;
	border-radius: 5px;
	cursor: pointer;
	justify-content: center;
	text-align: center;
	opacity: 1;
}

#main_content {
	size: 10px;
}

.dataTables_wrapper no-footer {
	padding: 5px 10px;
}

#orderTable {
	padding: 25px 12px 60px 12px;;
	margin: 35px 0px;
	border: 1px solid rgba(128, 128, 128, 0.5);
	border-radius: 8px;
	box-shadow: 12px;
}

table {
	width: 100%;
}

aside.topPage {
	height: 100%;
	width: 25%; /* 或任何您認為合適的寬度百分比 */
}

.container {
	display: flex;
}

aside.topPage {
	flex: 1; /* 可以使用其他數值調整彈性佈局比例 */
	z-index: 1;
}

#allOrder_filter {
	margin: 10px;
}

table {
	flex: 3; /* 可以使用其他數值調整彈性佈局比例 */
}

@media ( max-width : 1266px) {
	aside.topPage {
		position: relative; /
		z-index: 1; /* 將 aside 設定為比表格更高的 z-index 值 */
	}
	table#allOrder {
		
	}
}
/* 燈箱外部容器 */
.lightbox {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7);
	z-index: 9999;
}

/* 燈箱內容區域 */
.lightbox-content {
	width: 250px;
	height: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	position: absolute;
}

/* 關閉按鈕 */
#close-lightbox {
	background: #333;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	position: absolute;
	top: 10px;
	right: 10px;
}

/* 燈箱容器 */
/* .lightbox { */
/*     display: none; */
/*     position: fixed; */
/*     top: 0; */
/*     left: 0; */
/*     width: 100%; */
/*     height: 100%; */
/*     background-color: rgba(0, 0, 0, 0.7); */
/*     z-index: 1000; */
/* } */

/* 燈箱內容區域 */
.lightbox-content {
	position: relative;
	width: 425px;
	height: 400px;
	background-color: #fff;
	border-radius: 5px;
	padding: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	/*     max-width: 80%; */
	/*     max-height: 80%; */
	overflow-y: auto;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	width: 425px;
}

p.orderNO {
	font-size: 18px;
	padding: 10px 4px;
}

/* 關閉按鈕 */
#close-lightbox {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	background-color: red;
	color: white;
	padding: 15px 20px;
	border-radius: 3px;
}

/* 表格樣式 */
.detailTable {
	width: 100%;
	border-collapse: collapse;
}

.detailTable th, .detailTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.detailTable th {
	background-color: #f2f2f2;
}

.priceblock {
	border:1px solid rgb(107,107,107,0.5);
	position: static;
	bottom: 30px;
	/* display:flex; */
	/* justify-content:flex; */
	flex-direction: column;
	white-space: no-wrap;
	padding:5px 1px;
	margin:5px 1px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	
}

.Pri {
	padding: 3px;
	margin: 3px;
}

.subtitle {
	color: white;
	background-color: black;
	border-radius: 4px;
}

.title {
	font-size: 16px;
	padding: 30px 0px 30px 3px !important;
	vertical-align: baseline;
	text-align: center;
}

.view-details-link {
	border: none;
	background-color: #2894FF;
	color: white;
	padding: 4px 5px;
}
.view-details-link:hover {
	cursor: pointer;
	background-color:#003060;
}

.header {
    background-color: #B26021;
    color: #FFFFFF;
    padding: 10px;
    text-align: center;
    font-size: 24px;
    border-radius: 5px;
}

.add-button {
    background-color: #B26021;
    color: #FFFFFF;
    border: none;
    padding: 10px 20px;
    margin: 15px 0;
    border-radius: 5px;
    cursor: pointer;
}
.Info{
margin:5px 0px;
border: 1px solid rgb(107,107,107,.3);
padding: 5px 3px;
box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.orderInfo{
margin: 3px;
}
.actuPrice{
font-weight:bold;


}
</style>
</head>
<body>
	<aside class="topPage">
		<jsp:include page="../index.jsp" />
	</aside>
	<div id="main_content">
	<div class="header">商品列表</div>
    <a href="${ctxPath}/shop/commodityClassManage.jsp">
        <button class="add-button">商品類別管理</button>
    </a>
    <a href="${ctxPath}/shop/CommodityController?action=insertPage">
        <button class="add-button">新增商品</button>
    </a>
    <a href="${ctxPath}/orderManage/OrderManageController?action=listAllOrder">
        <button class="add-button">訂單管理</button>
    </a>
		<hr>
		<div id="orderTable">
			<table id="allOrder">
				<thead>
					<tr class="tr_title" style="height: 75px;">
						<th class="title" style="width: 9%;">訂單編號</th>
						<th class="title" style="width: 9%;">會員編號</th>
						<th class="title" style="width: 10%;">訂單金額</th>
						<th class="title" style="width: 9%;">訂單狀態</th>
						<th class="title" style="width: 12%;">下單時間</th>
						<th class="title" style="width: 11%;">收件人姓名</th>
						<th class="title" style="width: 16%;">收件地址</th>
						<th class="title" style="width: 9%;">查看明細</th>
						<th class="title" style="width: 9%;">訂單處理</th>
					</tr>
				</thead>

				<tbody id="order-list">
					<c:forEach var="orderVO" items="${commodityOrderVOList}"
						varStatus="loop">
						<tr class="order_content_title">
							<td class="order_content">${orderVO.orderNO}</td>
							<td class="order_content">${orderVO.memId}</td>
							<td class="order_content">${orderVO.actualPrice}</td>
							<td class="order_content orderStatus"><span class="status">${orderVO.orderStatus}</span></td>
							<td class="order_content"><fmt:formatDate
									value="${orderVO.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td class="order_content">${orderVO.recipient}</td>
							<td class="order_content">${orderVO.recipientAddress}</td>
							<td class="order_content" class="orderAction">
								<form action="${ctxPath}/orderManage/OrderManageController"
									method="post">
									<input name="action" value="showDetail" type="hidden">
									<input name="orderNO" value="${orderVO.orderNO}" type="hidden">
									<button type="button" id="showDetail"
										data-order-id="${orderVO.orderNO}" class="view-details-link">查看明細</button>

								</form>
							</td>

							<td class="order_content">
								<form action="${ctxPath}/orderManage/OrderManageController"
									method="post" id="form${loop.index}">
									<input name="action" value="editOrder" type="hidden"> <input
										name="orderNO" value="${orderVO.orderNO}" type="hidden">
									<input name="memId" value="${orderVO.memId}" type="hidden">
									<input name="actualPrice" value="${orderVO.actualPrice}"
										type="hidden"> <input name="orderStatus"
										value="${orderVO.orderStatus}" type="hidden">
									<button type="submit" class="edit-order"
										data-order-status="${orderVO.orderStatus}
											form="form${loop.index}">
										<svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M21.1938 2.80624C22.2687 3.88124 22.2687 5.62415 21.1938 6.69914L20.6982 7.19469C20.5539 7.16345 20.3722 7.11589 20.1651 7.04404C19.6108 6.85172 18.8823 6.48827 18.197 5.803C17.5117 5.11774 17.1483 4.38923 16.956 3.8349C16.8841 3.62781 16.8366 3.44609 16.8053 3.30179L17.3009 2.80624C18.3759 1.73125 20.1188 1.73125 21.1938 2.80624Z" fill="#ce9f73"></path> <path d="M14.5801 13.3128C14.1761 13.7168 13.9741 13.9188 13.7513 14.0926C13.4886 14.2975 13.2043 14.4732 12.9035 14.6166C12.6485 14.7381 12.3775 14.8284 11.8354 15.0091L8.97709 15.9619C8.71035 16.0508 8.41626 15.9814 8.21744 15.7826C8.01862 15.5837 7.9492 15.2897 8.03811 15.0229L8.99089 12.1646C9.17157 11.6225 9.26191 11.3515 9.38344 11.0965C9.52679 10.7957 9.70249 10.5114 9.90743 10.2487C10.0812 10.0259 10.2832 9.82394 10.6872 9.41993L15.6033 4.50385C15.867 5.19804 16.3293 6.05663 17.1363 6.86366C17.9434 7.67069 18.802 8.13296 19.4962 8.39674L14.5801 13.3128Z" fill="#ce9f73"></path> <path d="M20.5355 20.5355C22 19.0711 22 16.714 22 12C22 10.4517 22 9.15774 21.9481 8.0661L15.586 14.4283C15.2347 14.7797 14.9708 15.0437 14.6738 15.2753C14.3252 15.5473 13.948 15.7804 13.5488 15.9706C13.2088 16.1327 12.8546 16.2506 12.3833 16.4076L9.45143 17.3849C8.64568 17.6535 7.75734 17.4438 7.15678 16.8432C6.55621 16.2427 6.34651 15.3543 6.61509 14.5486L7.59235 11.6167C7.74936 11.1454 7.86732 10.7912 8.02935 10.4512C8.21958 10.052 8.45272 9.6748 8.72466 9.32615C8.9563 9.02918 9.22032 8.76528 9.57173 8.41404L15.9339 2.05188C14.8423 2 13.5483 2 12 2C7.28595 2 4.92893 2 3.46447 3.46447C2 4.92893 2 7.28595 2 12C2 16.714 2 19.0711 3.46447 20.5355C4.92893 22 7.28595 22 12 22C16.714 22 19.0711 22 20.5355 20.5355Z" fill="#ce9f73"></path> </g></svg>
									</button>
								</form>
							</td>
						</tr>

					</c:forEach>
				</tbody>

			</table>
			<div id="lightbox" class="lightbox">
				<div class="lightbox-content">
					<!-- 		內容 -->

				</div>
			</div>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			const statusMapping = {
				"0" : "訂單成立",
				"1" : "已付款",
				"2" : "備貨中",
				"3" : "已出貨",
				"4" : "已完成",
				"5" : "已取消"
			};
			// 找到所有的訂單狀態欄位
			$(".orderStatus").each(function() {
				const orderStatus = $(this).text().trim(); // 取得表格內容的文字，並移除前後空白
				const textStatus = statusMapping[orderStatus]; // 取得對應的文字狀態
				$(this).text(textStatus); // 將文字狀態設定回表格欄位
				if (orderStatus === "0") {
					$(this).addClass("status-unpaid");

				} else if (orderStatus === "1") {
					$(this).addClass("status-paid");
				} else if (orderStatus === "2") {
					$(this).addClass("status-processing");
				} else if (orderStatus === "3") {
					$(this).addClass("status-shipping");
				} else if (orderStatus === "4") {
					$(this).addClass("status-completed");
				} else if (orderStatus === "5") {
					$(this).addClass("status-canceled");
				}
			});

			$(".edit-order").on("click", function(e) {
				let form = $(this).closest("form"); // 找到最近的父級 form
				var orderStatus = parseInt($(this).data('order-status'));
				console.log(orderStatus);
				if (orderStatus >= 4) {
					e.preventDefault();
					swal({
						title : "訂單已結案",
						icon : "warning",
						buttonsStyling : false,
						confirmButtonClass : 'btn btn-primary btn-block'
					});
					return;
				}

			});
		});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$('#allOrder')
									.DataTable(
											{
												"lengthMenu" : [ 5, 10 ],
												"searching" : true, //搜尋功能, 預設是開啟
												"paging" : true, //分頁功能, 預設是開啟
												"ordering" : true, //排序功能, 預設是開啟
												"language" : {
													"processing" : "處理中...",
													"loadingRecords" : "載入中...",
													"lengthMenu" : "顯示 _MENU_ 筆結果",
													"zeroRecords" : "沒有符合的結果",
													"info" : "顯示第 _START_ 至 _END_ 筆結果，共<font color=red> _TOTAL_ </font>筆",
													"infoEmpty" : "顯示第 0 至 0 筆結果，共 0 筆",
													"infoFiltered" : "(從 _MAX_ 筆結果中過濾)",
													"infoPostFix" : "",
													"search" : "搜尋:",
													"paginate" : {
														"first" : "第一頁",
														"previous" : "上一頁",
														"next" : "下一頁",
														"last" : "最後一頁"
													},
													"aria" : {
														"sortAscending" : ": 升冪排列",
														"sortDescending" : ": 降冪排列"
													}
												}

											});
						});
	</script>
	<script>
	// 獲取元素
	const lightbox = document.getElementById("lightbox");
	const closeLightbox = document.getElementById("close-lightbox");
	const viewDetailsLinks = document.querySelectorAll(".view-details-link");

	viewDetailsLinks.forEach(link => {
	    link.addEventListener("click", function (event) {
	    	console.log("嗨");
	        const orderId = this.getAttribute("data-order-id");
	    	console.log(orderId);
	        fetch("http://localhost:8081/diyla_back/orderManage/OrderManageController?action=showDetail&orderNo="+orderId)
	        .then(response => response.json())
            .then(data => {
                // 從json拿到值並填入
                console.log(data);
	        const lightboxContent = document.querySelector(".lightbox-content");
	        const orderNo = data.orderNo;
	        console.log(lightboxContent)
	        console.log("Order number:", orderNo);
	        let htmlContent = '<p class="orderNO">訂單編號: ' + orderNo + '</p>';
	        htmlContent += '<div class="Info"><p class="orderInfo">收件人: ' + data.recipient + '</p>';
	        htmlContent += '<p class="orderInfo">收件地址: ' + data.recipientAddress + '</p>';
	        htmlContent += '<p class="orderInfo">收件人電話: ' + data.phone + '</p></div>';
            htmlContent += '<table class="detailTable">';
            htmlContent += '<tr class="title o-detail">';
            htmlContent += '<td class="subtitle o-detail">商品名稱</td>';
            htmlContent += '<td class="subtitle o-detail">單價</td>';
            htmlContent += '<td class="subtitle o-detail">數量</td>';
            htmlContent += '<td class="subtitle o-detail">小計</td>';
            htmlContent += '</tr>';

            // 迭代訂單詳細資料加到HTML裡
            data.commodityOrderDetailList.forEach(orderDetail => {
                htmlContent += '<tr>';
                htmlContent += '<td class="o-detail">' + orderDetail.comName + '</td>';
                htmlContent += '<td class="o-detail">' + orderDetail.unitPrice + '</td>';
                htmlContent += '<td class="o-detail">' + orderDetail.comQuantity + '</td>';
                htmlContent += '<td class="o-detail">' + (orderDetail.unitPrice * orderDetail.comQuantity) + '</td>';
                htmlContent += '</tr>';
            });
            const orderVO = data.commodityOrderVO;
			

            htmlContent += '</table>';
            htmlContent += '<div class="priceblock">';
            htmlContent += '<span class="orderPrice Pri">總金額:$'+data.orderPri+'元</span>';
            htmlContent += '<span class="orderPrice Pri">折抵金額:$'+data.orderDisActPri+'元</span>';
            htmlContent += '<span class="actuPrice Pri">實付金額:$'+data.orderActPri+'元</span>';
            htmlContent += '</div>';
            
			htmlContent+='<button id="close-lightbox">關閉</button>'
            // 設定燈箱內容
            lightboxContent.innerHTML = htmlContent;

                lightbox.style.display = "block";
                
                const closeLightboxButton = document.getElementById("close-lightbox");
                closeLightboxButton.addEventListener("click", function () {
                    lightbox.style.display = "none"; // 關閉燈箱
                });
            })
	    });
	});

	// 關閉燈箱
	lightbox.addEventListener("click", function (event) {
    if (event.target === lightbox) {
        lightbox.style.display = "none"; // 關閉燈箱
    }
});

	</script>
</body>
</html>
