<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
</head>

<body>
<jsp:include page="front_header.jsp"/>
<!-- slider section -->
<div class="slider_section">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" style="background-image: url('images/index_cake01.jpg');">
                <div class="slider_container container-fluid">
                    <div class="row">
                        <div class="col-md-12 custom-left-align">
                            <div class="detail-box">
                                <h1>
                                    來DIYLA！自己動手做
                                </h1>
                                <p>
                                    使用DIYLA精選的食材，親自做出自己喜愛的甜點吧！
                                </p>
                                <a href="#" class="btn btn-primary">
                                    立即跟上
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item" style="background-image: url('images/index_cake02.jpg');">
                <div class="slider_container container-fluid">
                    <div class="row">
                        <div class="col-md-12 custom-left-align">
                            <div class="detail-box">
                                <h1>
                                    限時特惠體驗
                                </h1>
                                <p>
                                    DIY蛋糕限時大特惠，名額有限，蛋糕控別錯過
                                </p>
                                <a href="#" class="btn btn-primary">
                                    立即搶購
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item" style="background-image: url('images/index_cake03.jpg');">
                <div class="slider_container container-fluid">
                    <div class="row">
                        <div class="col-md-12 custom-left-align">
                            <div class="detail-box">
                                <h1>
                                    新品上市！
                                </h1>
                                <p>
                                    獨創小豆沙餐包，早餐、下午餐必備！
                                </p>
                                <a href="#" class="btn btn-primary">
                                    立即體驗
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 控制按鈕部分不變 -->
        <div class="carousel_btn-box">
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <i class="fa fa-arrow-left" aria-hidden="true"></i>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <i class="fa fa-arrow-right" aria-hidden="true"></i>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
<!-- end slider section -->



<section class="latest_news ">
    <div class="heading_container heading_center " style="margin-top: 60px;">
        <h2>
            最新消息
        </h2>
    </div>
        <div class="container container-bg">
            <div class="row client_info">
                <div>
                    <jsp:include page="latestnews/latBanner.jsp"/>
                </div>
            </div>
        </div>
</section>




<!-- contact section -->

<section class="contact_section ">
    <div class="container">
        <div class="heading_container heading_center " style="margin-top: 60px;">
            <h2 class="">
                我們的位置
            </h2>
        </div>
    </div>
    <div class="container container-bg">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="map_container">
                    <div class="map-responsive">
                        <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=tibame+中壢"
                                width="600" height="300" style="border:0; width: 100%; height:100%"
                                allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- end contact section -->

<!-- client section -->
<section class="client_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>
                會員回饋
            </h2>
        </div>
    </div>
    <div class="container px-0">
        <div id="customCarousel2" class="carousel  carousel-fade" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="box">
                        <div class="client_info">
                            <div class="client_name">
                                <h5>
                                    小玟
                                </h5>
                                <h6>
                                    DIY體驗
                                </h6>
                            </div>
                            <i class="fa fa-quote-left" aria-hidden="true"></i>
                        </div>
                        <p>
                            在烘培教室裡，我感受到環境的整潔與用具的齊全，讓我的烘焙體驗更加愉快順利。這裡準備的食材品質優秀，讓我能夠輕鬆地製作出超好吃的蛋糕。
                            這種高品質的食材不僅保證了蛋糕的口感和味道，也讓我在學習過程中更加有信心。整個過程中，讓我能夠更熟悉烘焙的技巧與要點。
                            這次的烘焙經驗讓我收獲滿滿，不僅學會了製作美味的蛋糕，也獲得滿滿成就感。
                            我期待著將來能夠繼續參加這樣的DIY課程，不斷提升自己的烘焙技能。感謝DIY教室提供如此棒的學習機會，讓我度過了一個愉快且充實的時光。
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="box">
                        <div class="client_info">
                            <div class="client_name">
                                <h5>
                                    小靚
                                </h5>
                                <h6>
                                    甜點課程
                                </h6>
                            </div>
                            <i class="fa fa-quote-left" aria-hidden="true"></i>
                        </div>
                        <p>
                            甜點師傅的細心教學和專業建議及指導，讓我在製作甜點的過程中獲益良多。
                            除了分享豐富的經驗，還耐心地解答我的疑問，使我更深刻地理解甜點製作的精髓。
                            每一步指導都充滿耐心與熱情，讓我在不確定的地方能夠得到及時的協助，從而完成美味的點心。
                            師傅的專業知識令我受益匪淺，他們不僅傳授技巧，還分享了一些獨門的訣竅，使我的甜點在口感和外觀上都達到了更高水準。
                            他的建議貼近實際，讓我能夠更好地掌握食材的特性和使用方法，從而更有自信地展示創意。
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="box">
                        <div class="client_info">
                            <div class="client_name">
                                <h5>
                                    小李
                                </h5>
                                <h6>
                                    商店
                                </h6>
                            </div>
                            <i class="fa fa-quote-left" aria-hidden="true"></i>
                        </div>
                        <p>
                            在家中購置了一些點心食材和器具。食材的品質超出預期，每一種原料都散發出誘人的香氣，讓創作的渴望湧現。
                            同樣令人滿意的是，器具的完整性和質量，它們無縫地融入了烘焙過程。這份愉快的體驗不僅讓我期待著展開甜點之旅，也啓發了我更深的烘焙熱情。
                            無論是獨自享受創作的樂趣，還是邀請親朋好友一同分享美味，這些點心食材和器具都將成為我烘焙路上最美好的助力。
                        </p>
                    </div>
                </div>
            </div>
            <div class="carousel_btn-box">
                <a class="carousel-control-prev" href="#customCarousel2" role="button" data-slide="prev">
                    <i class="fa fa-angle-left" aria-hidden="true"></i>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#customCarousel2" role="button" data-slide="next">
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</section>
<!-- end client section -->

<jsp:include page="front_footer.jsp"/>


<script src="${ctxPath}/js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="${ctxPath}/js/custom.js"></script>

</body>

</html>