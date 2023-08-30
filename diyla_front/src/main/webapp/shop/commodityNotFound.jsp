<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html lang="zh-Hant">

<head>
    <!-- Basic -->

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png" type="image/x-icon">
    <title>
        商品已下架
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../css/shop/commodityPage.css">
</head>
<body>
<jsp:include page="../front_header.jsp"/>

<div style="display: flex;justify-content: center;align-items: center;height: 100vh;margin: 0;">
    <h1>商品已下架</h1>
    <a href="${ctxPath}/shop/CommodityController?action=listAll">
        <button type="submit" class="button">返回商店</button>
    </a>
</div>


<jsp:include page="../front_footer.jsp"/>
</body>
</html>
