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
<title>訂單查詢</title>

<link rel="shortcut icon" href="${ctxPath}/ima/DIYLA_LOGO.png"
	type="image/x-icon">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
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
	padding: 8px;
	text-align: center;
	justify-content: center;
}

.btn {
	cursor: pointer;
}

#main_content {
box-sizing:border-box;
	float: inherit;
	height: 800px;
	margin: 0px auto;
	background-color: #fff;
	padding: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	padding: 0px;
	float: right;
	width: 960px;
	overflow: scoll;
}

.heading {
	width: 960px;
	text-align: center;
	margin-bottom: 20px;
	font-size: 30px;
	padding: 10px 30px;
	background-color: #FFEEDD;
	border-radius: 5px;
	background-color: #FFEEDD;
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

.status-shipping {
	background-color: #FF79BC;
}

.status-completed {
	background-color: #66FF66; /* 已完成的顏色 */
}

.status-canceled {
	background-color: #FF3333; /* 已取消的顏色 */
}

@media ( max-width :767.98px) {
	aside.topPage {
		top: 0;
		height: 100%;
		transform: translateX(-100%);
		transition: all 1s;
	}
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.tr_title {
	background-color: #ECECFF;
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

.cancel_order {
	/* 	color: white; */
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

#main_content {
	/* 	padding-bottom: 150px; */
	/* 	padding-left: 300px; */
	
}

.dataTables_wrapper no-footer {
	padding: 5px 10px;
}

#orderTable {
	padding: 5px 12px;
}

table {
	width: 100%;
}

aside.topPage {
	height: 100%;
	width: 25%; /* 或任何您認為合適的寬度百分比 */
	/* ... 其他樣式 */
}

.container {
	display: flex;
}

aside.topPage {
	flex: 1; /* 可以使用其他數值調整彈性佈局比例 */
	/* ... 其他樣式 */
}

table {
	flex: 3; /* 可以使用其他數值調整彈性佈局比例 */
	/* ... 其他樣式 */
}

@media ( max-width : 768px) {
	aside.topPage {
		position: relative; /* 或其他您認為適當的定位屬性 */
		z-index: 1; /* 將 aside 設定為比表格更高的 z-index 值 */
	}
}
</style>
</head>
<body>
	<aside class="topPage">
		<jsp:include page="../index.jsp" />
	</aside>
	<div id="main_content">
		<h1 class="heading">訂單一覽</h1>

		<div id="orderTable">
			<table id="allOrder">
				<thead>
					<tr class="tr_title">
						<th class="title" style="width: 10%;">訂單編號</th>
						<th class="title" style="width: 10%;">會員編號</th>
						<th class="title" style="width: 10%;">訂單金額</th>
						<th class="title" style="width: 8%;">訂單狀態</th>
						<th class="title" style="width: 12%;">下單時間</th>
						<th class="title" style="width: 12%;">收件人姓名</th>
						<th class="title" style="width: 16%;">收件地址</th>
						<th class="title" style="width: 8%;">查看明細</th>
						<th class="title" style="width: 8%;">訂單處理</th>
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
									<button type="submit" id="showDetail">查看明細</button>

								</form>
							</td>

							<td>
								<form action="${ctxPath}/orderManage/OrderManageController"
									method="post" id="form${loop.index}">
									<input name="action" value="editOrder" type="hidden"> <input
										name="orderNO" value="${orderVO.orderNO}" type="hidden">
									<input name="memId" value="${orderVO.memId}" type="hidden">
									<input name="actualPrice" value="${orderVO.actualPrice}"
										type="hidden"> <input name="orderStatus"
										value="${orderVO.orderStatus}" type="hidden">
									<button type="submit" class="cancel_order"
										data-order-status="${orderVO.orderStatus}
											form="form${loop.index}">
										<svg width="24px" height="24px" viewBox="0 -0.5 25 25"
											fill="none" xmlns="http://www.w3.org/2000/svg">
											<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
											<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
											<g id="SVGRepo_iconCarrier"> <path
												d="M13.2942 7.95881C13.5533 7.63559 13.5013 7.16358 13.178 6.90453C12.8548 6.64549 12.3828 6.6975 12.1238 7.02072L13.2942 7.95881ZM6.811 14.8488L7.37903 15.3385C7.38489 15.3317 7.39062 15.3248 7.39623 15.3178L6.811 14.8488ZM6.64 15.2668L5.89146 15.2179L5.8908 15.2321L6.64 15.2668ZM6.5 18.2898L5.7508 18.2551C5.74908 18.2923 5.75013 18.3296 5.75396 18.3667L6.5 18.2898ZM7.287 18.9768L7.31152 19.7264C7.36154 19.7247 7.41126 19.7181 7.45996 19.7065L7.287 18.9768ZM10.287 18.2658L10.46 18.9956L10.4716 18.9927L10.287 18.2658ZM10.672 18.0218L11.2506 18.4991L11.2571 18.491L10.672 18.0218ZM17.2971 10.959C17.5562 10.6358 17.5043 10.1638 17.1812 9.90466C16.8581 9.64552 16.386 9.69742 16.1269 10.0206L17.2971 10.959ZM12.1269 7.02052C11.8678 7.34365 11.9196 7.81568 12.2428 8.07484C12.5659 8.33399 13.0379 8.28213 13.2971 7.95901L12.1269 7.02052ZM14.3 5.50976L14.8851 5.97901C14.8949 5.96672 14.9044 5.95412 14.9135 5.94123L14.3 5.50976ZM15.929 5.18976L16.4088 4.61332C16.3849 4.59344 16.3598 4.57507 16.3337 4.5583L15.929 5.18976ZM18.166 7.05176L18.6968 6.52192C18.6805 6.50561 18.6635 6.49007 18.6458 6.47532L18.166 7.05176ZM18.5029 7.87264L19.2529 7.87676V7.87676L18.5029 7.87264ZM18.157 8.68976L17.632 8.15412C17.6108 8.17496 17.5908 8.19704 17.5721 8.22025L18.157 8.68976ZM16.1271 10.0203C15.8678 10.3433 15.9195 10.8153 16.2425 11.0746C16.5655 11.3339 17.0376 11.2823 17.2969 10.9593L16.1271 10.0203ZM13.4537 7.37862C13.3923 6.96898 13.0105 6.68666 12.6009 6.74805C12.1912 6.80943 11.9089 7.19127 11.9703 7.60091L13.4537 7.37862ZM16.813 11.2329C17.2234 11.1772 17.5109 10.7992 17.4552 10.3888C17.3994 9.97834 17.0215 9.69082 16.611 9.74659L16.813 11.2329ZM12.1238 7.02072L6.22577 14.3797L7.39623 15.3178L13.2942 7.95881L12.1238 7.02072ZM6.24297 14.359C6.03561 14.5995 5.91226 14.9011 5.89159 15.218L7.38841 15.3156C7.38786 15.324 7.38457 15.3321 7.37903 15.3385L6.24297 14.359ZM5.8908 15.2321L5.7508 18.2551L7.2492 18.3245L7.3892 15.3015L5.8908 15.2321ZM5.75396 18.3667C5.83563 19.1586 6.51588 19.7524 7.31152 19.7264L7.26248 18.2272C7.25928 18.2273 7.25771 18.2268 7.25669 18.2264C7.25526 18.2259 7.25337 18.2249 7.25144 18.2232C7.2495 18.2215 7.24825 18.2198 7.24754 18.2185C7.24703 18.2175 7.24637 18.216 7.24604 18.2128L5.75396 18.3667ZM7.45996 19.7065L10.46 18.9955L10.114 17.536L7.11404 18.247L7.45996 19.7065ZM10.4716 18.9927C10.7771 18.9151 11.05 18.7422 11.2506 18.499L10.0934 17.5445C10.0958 17.5417 10.0989 17.5397 10.1024 17.5388L10.4716 18.9927ZM11.2571 18.491L17.2971 10.959L16.1269 10.0206L10.0869 17.5526L11.2571 18.491ZM13.2971 7.95901L14.8851 5.97901L13.7149 5.04052L12.1269 7.02052L13.2971 7.95901ZM14.9135 5.94123C15.0521 5.74411 15.3214 5.6912 15.5243 5.82123L16.3337 4.5583C15.4544 3.99484 14.2873 4.2241 13.6865 5.0783L14.9135 5.94123ZM15.4492 5.7662L17.6862 7.6282L18.6458 6.47532L16.4088 4.61332L15.4492 5.7662ZM17.6352 7.58161C17.7111 7.6577 17.7535 7.761 17.7529 7.86852L19.2529 7.87676C19.2557 7.36905 19.0555 6.88127 18.6968 6.52192L17.6352 7.58161ZM17.7529 7.86852C17.7524 7.97604 17.7088 8.07886 17.632 8.15412L18.682 9.22541C19.0446 8.87002 19.2501 8.38447 19.2529 7.87676L17.7529 7.86852ZM17.5721 8.22025L16.1271 10.0203L17.2969 10.9593L18.7419 9.15928L17.5721 8.22025ZM11.9703 7.60091C12.3196 9.93221 14.4771 11.5503 16.813 11.2329L16.611 9.74659C15.0881 9.95352 13.6815 8.89855 13.4537 7.37862L11.9703 7.60091Z"
												fill="#000000"></path> </g></svg>
									</button>
								</form>
							</td>
						</tr>

					</c:forEach>
				</tbody>

			</table>
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
				"1" : "備貨中",
				"2" : "已出貨",
				"3" : "已完成",
				"4" : "已取消"
			};
			// 找到所有的訂單狀態欄位
			$(".orderStatus").each(function() {
				const orderStatus = $(this).text().trim(); // 取得表格內容的文字，並移除前後空白
				const textStatus = statusMapping[orderStatus]; // 取得對應的文字狀態
				$(this).text(textStatus); // 將文字狀態設定回表格欄位
				if (orderStatus === "0") {
					$(this).addClass("status-unpaid");

				} else if (orderStatus === "1") {
					$(this).addClass("status-processing");
				} else if (orderStatus === "2") {
					$(this).addClass("status-shipping");
				} else if (orderStatus === "3") {
					$(this).addClass("status-completed");
				} else if (orderStatus === "4") {
					$(this).addClass("status-canceled");
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

</body>
</html>
