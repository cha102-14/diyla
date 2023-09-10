<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="../css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="../css/responsive.css" rel="stylesheet" />
<title>交易發生錯誤</title>
<style>


.message {
padding:100px;
	font-size: 30px;
	margin-bottom: 100px;
}

.try-again {
	color: #007bff;
	text-decoration: none;
	border: 1px soild gray;
	padding:100px 120px;
	color: black;
}

.try-again:hover {
	text-decoration: underline;
}
.failcontainer{
height:500px;
text-align: center;
top:200px;
}
</style>
</head>
<body>
	<jsp:include page="/front_header.jsp" />
	<div class="failcontainer">
		<p class="message">交易發生問題，請稍後再試。</p>
		<a href="${ctxPath}/index.jsp" class="try-again">回首頁</a>
	</div>
	<jsp:include page="/front_footer.jsp" />

</body>
</html>
