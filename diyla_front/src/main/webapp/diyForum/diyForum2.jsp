<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSP 標籤，用於設置網頁的語言和編碼方式-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-Hant">

<!-- 網頁的設定和樣式 css -->
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi">
<!-- 頁面標題 -->
<title>DIYLA! || 美好的體驗</title>

<!-- 引入不同的CSS樣式表 -->
<link rel="stylesheet" href="/diyla_front/diy/css/all.min.css">
<link rel="stylesheet" href="/diyla_front/diy/css/bootstrap.min.css">
<link rel="stylesheet" href="/diyla_front/diy/css/slick.css">
<link rel="stylesheet" href="/diyla_front/diy/css/nice-select.css">
<link rel="stylesheet" href="/diyla_front/diy/css/venobox.min.css">
<link rel="stylesheet" href="/diyla_front/diy/css/animate.css">
<link rel="stylesheet" href="/diyla_front/diy/css/jquery.exzoom.css">

<link rel="stylesheet" href="/diyla_front/diy/css/spacing.css">
<link rel="stylesheet" href="/diyla_front/diy/css/style.css">
<link rel="stylesheet" href="/diyla_front/diy/css/responsive.css">
</head>

<body>
	<!-- 主要的網頁內容 js html-->
	<!--
=============================	
    MENU DETAILS START
==============================
-->
	<section class="tf__menu_details mt_100 xs_mt_75 mb_95 xs_mb_65">
		<div class="container">
			<div class="row">

				<div class="col-12 wow fadeInUp" data-wow-duration="1s">
					<div class="tf__menu_description_area mt_100 xs_mt_70">
						<ul class="nav nav-pills" id="pills-tab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pills-home-tab"
									data-bs-toggle="pill" data-bs-target="#pills-home"
									type="button" role="tab" aria-controls="pills-home"
									aria-selected="true">訂位須知</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="pills-contact-tab"
									data-bs-toggle="pill" data-bs-target="#pills-contact"
									type="button" role="tab" aria-controls="pills-contact"
									aria-selected="false">評論區</button>
							</li>
						</ul>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade" id="pills-home" role="tabpanel"
								aria-labelledby="pills-home-tab" tabindex="0">
								<div class="menu_det_description">
									<p>﻿﻿﻿﻿﻿﻿﻿﻿訂位前請詳讀資訊以確保您的權益﻿﻿﻿﻿﻿﻿. Doloribus consectetur
										ullam in? Beatae, dolorum ad ea deleniti ratione voluptatum
										similique omnis voluptas tempora optio soluta vero veritatis
										reiciendis blanditiis architecto. Debitis nesciunt inventore
										voluptate tempora ea incidunt iste, corporis, quo cumque
										facere doloribus possimus nostrum sed magni quasi, assumenda
										autem! Repudiandae nihil magnam provident illo alias vero odit
										repellendus, ipsa nemo itaque. Aperiam fuga, magnam quia illum
										minima blanditiis tempore. vero veritatis reiciendis
										blanditiis architecto. Debitis nesciunt inventore voluptate
										tempora ea incidunt iste, corporis, quo cumque facere
										doloribus possimus nostrum sed magni quasi</p>
									<ul>
										<li>● 因安全考量，無論是否有大人陪同，都無法接待12歲以下小朋友。
											(為避免小朋友年齡爭議，請攜帶可證明年齡之相關證件，供必要時核對)</li>
										<li>● 訂位『僅保留15分鐘』須全員到齊，逾時請現場候位。 (晚上最後一場，逾時15分鐘就無法入場)</li>
										<li>● 甜點製作環境，寵物無法入店。</li>
										<li>● 店內嚴禁：外食、菸、酒、檳榔。</li>
										<li>● 每一場製作時間為3小時。(包含：製作、烘烤、清洗、裝飾、包裝)</li>
										<li>● 甜點製作為：平板教學+自助取材料。 (無老師教學、無販售成品、需自行清洗用具)</li>
										<li>● 費用依『甜點價格』收費。(無服務費)</li>
										<li>● 一份甜點價格限一人製作，其餘人數皆加收陪同費$100/人。</li>
									</ul>
									<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
										Earum itaque nesciunt dolor laudantium placeat sed velit
										aspernatur, nobis quos quibusdam distinctio voluptatum officia
										vel sapiente enim, reprehenderit impedit beatae molestias
										dolorum. A laborum consectetur sed quis exercitationem optio
										consequatur, unde neque est odit, pariatur quae incidunt quasi
										dolorem nihil aliquid ut veritatis porro eaque cupiditate
										voluptatem vel ad! Asperiores, praesentium. sit amet
										consectetur adipisicing elit. Doloribus consectetur ullam in?
										Beatae, dolorum ad ea deleniti ratione voluptatum similique
										omnis voluptas tempora optio soluta</p>

									<ul>
										<li>Reiciendis blanditiis architecto. Debitis nesciunt
											inventore voluptate
										<li>Lorem ipsum dolor sit amet consectetur adipisicing
											elit Doloribus.</li>
										<li>Dolor sit amet consectetur adipisicing elit. Earum
											itaque nesciunt.</li>
										<li>Corporis quo cumque facere doloribus possimus nostrum
											sed magni quasi.</li>
										<li>Incidunt iste corporis quo cumque facere doloribus
											possimus nostrum sed.</li>
										<li>Incidunt iste corporis quo cumque facere doloribus
											possimus nostrum sed.</li>
									</ul>
									<p>Lorem ipsum dolor, sit amet consectetur adipisicing
										elit. Doloribus consectetur ullam in? Beatae, dolorum ad ea
										deleniti ratione voluptatum similique omnis voluptas tempora
										optio soluta vero veritatis reiciendis blanditiis architecto.
										Debitis nesciunt inventore voluptate tempora ea incidunt iste,
										corporis, quo cumque facere doloribus possimus nostrum sed
										magni quasi, assumenda autem! Repudiandae nihil magnam
										provident illo alias vero odit repellendus, ipsa nemo itaque.
										Aperiam fuga, magnam quia illum minima blanditiis tempore.</p>
								</div>
							</div>

							<div class="tab-pane fade show active" id="pills-contact"
								role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
								<div class="tf__review_area">
									<div class="row">
										<div class="col-lg-8">
											<h4 id="count"></h4>
											<div id="commentContainer" class="tf__comment pt-0 mt_20">


											</div>

										</div>
										<div class="col-lg-4">
											<div class="tf__post_review">
												<h4>新增評論</h4>
												<form id="myForm" onsubmit="submitForm(event)"
													action="/diyla_back/diy/DiyForumController" method="GET">
													<p class="rating">
														<span>選擇評分數 : </span> <i class="fas fa-star"></i> <i
															class="fas fa-star"></i> <i class="fas fa-star"></i> <i
															class="fas fa-star"></i> <i class="fas fa-star"></i>
													</p>
													<div class="row">
														<%--<div class="col-xl-12">--%>
														<%--    <input type="text" placeholder="Name">--%>
														<%--</div>--%>
														<%--<div class="col-xl-12">--%>
														<%--    <input type="email" placeholder="Email">--%>
														<%--</div>--%>
														<input type="hidden" name="action" value="add">

														<%--  TODO 整合項目後可以使用商品詳情頁面No --%>
														<input type="hidden" name="diyNo" value="4"> <input
															type="hidden" name="diyGrade" value="0">

														<div class="col-xl-12">
															<textarea rows="3" placeholder="請輸入評論內容" name="artiCont"></textarea>
														</div>
														<div class="col-12">
															<button class="common_btn" type="submit">提交</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!--=============================
    MENU DETAILS END
==============================-->


	<!--=============================
    FOOTER START
==============================-->

	<!--=============================
    FOOTER END
==============================-->


	<!--=============================
    SCROLL BUTTON START
==============================-->
	<!-- 捲動按鈕 -->

	<div class="tf__scroll_btn">
		<i class="fas fa-hand-pointer"></i>
	</div>
	<!--=============================
    SCROLL BUTTON END
==============================-->

	<!-- 引入必要的 JavaScript  -->
	<!--jquery library js-->
	<script src="/diyla_front/diy/js/jquery-3.6.0.min.js"></script>
	<!--bootstrap js-->
	<script src="/diyla_front/diy/js/bootstrap.bundle.min.js"></script>
	<!--font-awesome js-->
	<script src="/diyla_front/diy/js/Font-Awesome.js"></script>
	<!-- slick slider -->
	<script src="/diyla_front/diy/js/slick.min.js"></script>
	<!-- isotop js -->
	<script src="/diyla_front/diy/js/isotope.pkgd.min.js"></script>
	<!-- counter up js -->
	<script src="/diyla_front/diy/js/jquery.waypoints.min.js"></script>
	<script src="/diyla_front/diy/js/jquery.countup.min.js"></script>
	<!-- nice select js -->
	<script src="/diyla_front/diy/js/jquery.nice-select.min.js"></script>
	<!-- venobox js -->
	<script src="/diyla_front/diy/js/venobox.min.js"></script>
	<!-- sticky sidebar js -->
	<script src="/diyla_front/diy/js/sticky_sidebar.js"></script>
	<!-- wow js -->
	<script src="/diyla_front/diy/js/wow.min.js"></script>
	<!-- ex zoom js -->
	<script src="/diyla_front/diy/js/jquery.exzoom.js"></script>

	<!--main/custom js-->
	<script src="/diyla_front/diy/js/main.js"></script>


	<!-- 自訂的 JavaScript 腳本 -->

	<script>

	// 自訂的 JavaScript 腳本，處理評論和表單相關的操作

	function getList(s) {
	    // 使用 AJAX 請求從伺服器端獲取 JSON 數據
	    var xhr = new XMLHttpRequest();
	    var url = 'http://localhost:8081/diyla_back/diy/DiyForumController'; // Servlet URL
	    // 後期需要傳入當前 diyNo，目前預設值為4
	    var params = 'action=list&diyNo=4'; // 請求參數，以鍵值對形式拼接

	    if (s == null || s == "") {
	        params += "&page=1&commentSort=DESC";
	    } else {
	        params += s;
	    }

	    xhr.open('GET', url + '?' + params, true);
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            var jsonData = JSON.parse(xhr.responseText);
	            renderComments(jsonData);
	        }
	    };
	    xhr.send();
	}
	getList(null);

	// 渲染評論列表
	function renderComments(data) {
	    var commentContainer = document.getElementById('commentContainer');
	    if (data.length === 0) {
	        commentContainer.innerHTML = '<p>評論列表為空。</p>';
	    } else {
	        var html = '';
	        for (var i = 0; i < data.data.length; i++) {
	            var item = data.data[i];
	            html += '<div class="tf__single_comment">';
	            html += '<img src="/diy/picture/client_1.png" alt="review" class="img-fluid">';
	            html += '<div class="tf__single_comm_text">';
	            html += '<h3>' + item.memName + '</h3>';
	            html += '<span class="rating">';
	            for (var j = 0; j < item.diyGrade; j++) {
	                html += '<i class="fas fa-star"></i>';
	            }
	            html += '</span>';
	            html += '<p>' + item.artiCont + '</p>';
	            html += '</div>';
	            html += '</div>';
	        }
	        document.getElementById("count").innerText = data.total + " 評論";
	        // commentContainer.innerHTML = html;

	        // 添加分頁
	        // var paginationContainer = document.querySelector(".tf__pagination");
	        var currentPage = data.page;   // 當前頁數
	        var totalPages = Math.ceil(data.total / data.rows);    // 總頁數

	        //&page=1&commentSort=DESC
	        var preParams = "";
	        if (currentPage != 1) {
	            preParams = "&page=" + (currentPage - 1) + "&commentSort=DESC";
	        }

	        var nextParams = "";
	        if (currentPage != totalPages) {
	            nextParams = "&page=" + (currentPage + 1) + "&commentSort=DESC";
	        }

	        var paginationHtml = '';
	        paginationHtml += '<div class="tf__pagination mt_30">';
	        paginationHtml += '<div class="row">';
	        paginationHtml += '<div class="col-12">';
	        paginationHtml += '<nav aria-label="...">';
	        paginationHtml += '<ul class="pagination">';
	        paginationHtml += '<li class="page-item">';
	        paginationHtml += '<a class="page-link" onclick="getList(\'' + preParams +'\')"><i class="fas fa-long-arrow-alt-left" style="margin-top: 16px"></i></a>';
	        paginationHtml += '</li>';
	        for (var page = 1; page <= totalPages; page++) {
	            if (page === currentPage) {
	                paginationHtml += '<li class="page-item active"><a class="page-link" href="#">' + page + '</a></li>';
	            } else {
	                var params = "&page=" + page + "&commentSort=DESC";
	                paginationHtml += '<li class="page-item"><a class="page-link" onclick="getList(\'' + params +'\')">' + page + '</a></li>';
	            }
	        }

	        paginationHtml += '<li class="page-item">';
	        paginationHtml += '<a class="page-link" onclick="getList(\''+ nextParams +'\')"><i class="fas fa-long-arrow-alt-right" style="margin-top: 16px"></i></a>';
	        paginationHtml += '</li>';
	        paginationHtml += '</ul>';
	        paginationHtml += '</nav>';
	        paginationHtml += '</div>';
	        paginationHtml += '</div>';
	        paginationHtml += '</div>';
	        paginationHtml += '</div>';

	        commentContainer.innerHTML = html + paginationHtml;
	    }
	}

	// 獲取所有星星
	var stars = document.querySelectorAll('.rating i');
	// 遍歷每個星星元素，為其添加點擊事件監聽器
	stars.forEach(function(star) {
	    star.addEventListener('click', function() {
	        console.log(stars)

	        // 移除所有星星元素的選中樣式
	        stars.forEach(function(s) {
	            s.classList.remove('selected');
	        });

	        // 將當前點擊的星星元素添加選中樣式
	        this.classList.add('selected');

	        // 其他未點擊的星星元素恢復原來的顏色
	        stars.forEach(function(s) {
	            if (!s.classList.contains('selected')) {
	                s.style.color = ''; // 回到原來的顏色
	            }
	        });
	    });
	});

	function submitForm(event) {
	    // 阻止預設提交表單行為
	    event.preventDefault();

	    // 獲取表單數據
	    var formData = new FormData(event.target);
	    var diyNo = formData.get("diyNo");
	    var action = formData.get("action");
	    var diyGrade = formData.get("diyGrade");
	    var artiCont = formData.get("artiCont");

	    var xhr = new XMLHttpRequest();
	    var url = 'http://localhost:8081/diyla_back/diy/DiyForumController'; // Servlet URL
	    var params = 'action=add&diyNo=' + diyNo + "&diyGrade=" + diyGrade + "&artiCont=" + artiCont; // 請求參數，以鍵值對形式拼接
	    xhr.open('GET', url + '?' + params, true);
	    xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            // 請求成功後處理邏輯
	            var r = JSON.parse(xhr.responseText);
	            console.log(r);

	            if (r.code === '200') {
	                getList(null);
	            } else {
	                alert(r.msg);
	            }
	        }
	    };
	    xhr.send();
	}
	</script>
	<style>
.rating i.selected {
	color: red !important;
	//
	選中時的顏色，可根據需要自行修改
}
</style>

</body>

</html>
