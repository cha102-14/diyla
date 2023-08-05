<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <!-- Basic -->
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">

    <title>
        DIYLA
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet"/>
</head>

<body>
<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="${ctxPath}/index.jsp">
                <img src="${ctxPath}/images/DIYLA_LOGO.png" alt="DIYLA!" class="logo-image">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  ">
                    <li class="nav-item ">
                        <a class="nav-link" href="about_us.html">關於我們
                            <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            DIY體驗
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            甜點課程
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctxPath}/shop/CommodityController?action=listAll">
                            商店
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            社群分享
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            常見問題
                        </a>
                    </li>
                </ul>
                <div class="user_option">
                    <%--可自行更改href連結--%>
                    <a href="">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <span>登入</span>
                    </a>
                    <form class="form-inline ">
                    </form>
                </div>
            </div>
        </nav>
    </header>

    <!-- end header section -->
</div>
<script src="js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="js/custom.js"></script>

</body>

</html>
