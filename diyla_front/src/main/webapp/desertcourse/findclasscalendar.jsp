<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang='en'>

    <head>
        <meta charset='utf-8' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="/diyal_front/images/DIYLA_cakeLOGO.png" type="image/x-icon">
        <!-- slider stylesheet -->
        <link rel="stylesheet" type="text/css"
            href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="/diyla_front/css/bootstrap.css" />

        <!-- Custom styles for this template -->
        <link href="/diyla_front/css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="/diyla_front/css/responsive.css" rel="stylesheet" />

        <script src="/diyla_front/js/bootstrap.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <script src="/diyla_front/js/custom.js"></script>
        <script>

            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    events: 'getclass.jsp',
                    eventClick: function (info) {
                        var courseId = info.event.id;
                        window.location.href = 'classdetail.jsp?id=' + courseId;
                    }
                });
                calendar.render();
            });

        </script>
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
                            <a class="nav-link" href="shop/shop.jsp">
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
        <div id='calendar'></div>
<section class="info_section  layout_padding2-top">

    <div class="info_container ">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <h6>
                        營業時間
                    </h6>
                    <p>
                        08：00 ～ 12：00
                        <br>
                        13：00 ～ 20：00
                    </p>
                </div>

                <div class="col-md-6 col-lg-3">
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
                            <span> service@tibame.com</span>
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
    </body>

    </html>