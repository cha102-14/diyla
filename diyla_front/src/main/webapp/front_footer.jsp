<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png" type="image/x-icon">

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
<section class="info_section  layout_padding2-top">

    <div class="info_container ">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-4 col-centered">
                    <img src="${ctxPath}/images/LOGO_white.png" alt="DIYLA">
                </div>
                <div class="col-md-6 col-lg-4 col-centered">
                    <h6>
                        營業時間
                    </h6>
                    <p>
                        09：00 ～ 12：00
                        <br>
                        13：00 ～ 21：00
                    </p>
                </div>

                <div class="col-md-6 col-lg-4">
                    <h6>
                        聯絡我們
                    </h6>
                    <div class="info_link-box">
                        <div id="address">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <span>320 桃園市中壢區復興路46號8樓</span>
                        </div>
                        <div>
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <span>03 425 1108</span>
                        </div>
                        <div>
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <span> tibame515@google.com</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer section -->
    <footer class=" footer_section">
        <div class="container">
            <p>
                Copyright © 2023 DIYLA. All rights reserved.
                <br>
                本網站為緯育TibaMe_java雲端服務開發技術養成班學員專題成果作品，本平台僅供學習、展示之用。
                <br>
                若有侵權疑慮，您可以私訊<a href="https://www.facebook.com/TibaMe/?locale=zh_TW">「緯育TibaMe」</a>，後續會由專人協助處理。
            </p>
        </div>
    </footer>
    <!-- footer section -->

</section>

<!-- end info section -->



<script src="${ctxPath}/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="${ctxPath}/js/custom.js"></script>
<jsp:include page="front_chat_page.jsp"/>

</body>

</html>


</body>
</html>
