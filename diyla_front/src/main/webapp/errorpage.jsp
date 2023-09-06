<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Oops!</title>
<style>
.maincontent {
	text-align: center;
	justify-content: center;
	min-height: 450px;
	margin: 50px 25px 50px 25px;
	display: flex;
	flex-direction: column;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border: 1px solid gray;
	border-radius: 5px;
	box-shadow: 5px 8px 2px rgba(0, 0, 0, 0.7);
}

p.gomainpage {
	width: 150px;
	height: 75px;
	background-color: red;
	border-radius: 5px;
	color: white;
	text-align: center;
	box-sizing: content-box;
	vertical-align: baseline;
	display: inline-block;
	margin-top: 20px;
	display: flex;
	/* 水平置中 */
	justify-content: center;
	/* 垂直置中 */
	align-content: center;
}

.mainlink {
	color: white;
	font-size: 20px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="./front_header.jsp" />
	</div>
	<div class="maincontent">
		<h1>發生錯誤! 請稍再試或聯絡管理員</h1>
		<svg width="126px" height="126px" viewBox="0 0 36 36"
			xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
			role="img" class="iconify iconify--twemoji"
			preserveAspectRatio="xMidYMid meet" fill="#000000">
			<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
			<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
				stroke-linejoin="round"></g>
			<g id="SVGRepo_iconCarrier">
			<path fill="#FFCC4D"
				d="M36 15a4 4 0 0 1-4 4H4a4 4 0 0 1-4-4V7a4 4 0 0 1 4-4h28a4 4 0 0 1 4 4v8z"></path>
			<path
				d="M6 3H4a4 4 0 0 0-4 4v2l6-6zm6 0L0 15c0 1.36.682 2.558 1.72 3.28L17 3h-5zM7 19h5L28 3h-5zm16 0L35.892 6.108A3.995 3.995 0 0 0 33.64 3.36L18 19h5zm13-4v-3l-7 7h3a4 4 0 0 0 4-4z"
				fill="#292F33"></path>
			<path fill="#99AAB5" d="M4 19h5v14H4zm23 0h5v14h-5z"></path></g></svg>
		<p class="gomainpage">
			<a href="${ctxPath}/index.jsp" class="mainlink">回首頁</a>
		</p>
	</div>
	<jsp:include page="./front_footer.jsp" />

</body>
</html>