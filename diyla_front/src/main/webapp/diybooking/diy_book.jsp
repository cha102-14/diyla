<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--JSP 標籤，用於設置網頁的語言和編碼方式-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
    <link rel="stylesheet" href="/diyla_front/diy/css/all.min.css">
    <link rel="stylesheet" href="diy/css/bootstrap.min.css">
    <link rel="stylesheet" href="diy/css/slick.css">
    <link rel="stylesheet" href="diy/css/nice-select.css">
    <link rel="stylesheet" href="diy/css/venobox.min.css">
    <link rel="stylesheet" href="diy/css/animate.css">
    <link rel="stylesheet" href="diy/css/jquery.exzoom.css">

    <link rel="stylesheet" href="diy/css/spacing.css">
    <link rel="stylesheet" href="diy/css/style.css">
    <link rel="stylesheet" href="diy/css/responsive.css">

    <title>
        商店
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/css/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet"/>
    <link href="//unpkg.com/layui@2.8.15/dist/css/layui.css" rel="stylesheet">

</head>

<body>
<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="index.jsp">
                <img src="./images/DIYLA_LOGO.png" alt="DIYLA!" class="logo-image">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class=""></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  ">
                    <li class="nav-item ">
                        <a class="nav-link" href="about_us.html">關於我們
                            <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="diy.html">DIY體驗

                        </a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dessert_course.html">
                            甜點課程
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="shop/listCommodity.jsp">
                            商店
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="community_sharing.html">
                            社群分享
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="problem.html">
                            常見問題
                        </a>
                    </li>
                </ul>
                <div class="user_option">
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
<section class="tf__reservation mt_100 xs_mt_70 mb_100">
    <div class="container">
        <div class="tf__reservation_bg"
             style="background: url(https://images.unsplash.com/photo-1593558159516-d0be2a960c52?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80);">
            <div class="row">
                <div class="col-xl-6 ms-auto">
                    <div class="tf__reservation_form wow fadeInRight" data-wow-duration="1s">
                        <h2>DIY訂位</h2>
                        <form>
                            <style>
                                textarea {
                                    white-space: pre-wrap;
                                    resize: both;
                                }
                            </style>
                            <div class="tf__reservation_input_single">
                                <label for="name">Food items</label>
                                <!--<input type="text" style="height: 110px;" id="name" placeholder="蛋糕、餅乾...">-->
                                <textarea rows="4" cols="10" style="height: 110px; text-align: left"
                                          placeholder="蛋糕、餅乾...">

                                    </textarea>


                            </div>

                            <div class="row">
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="name">name</label>
                                        <input type="text" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="email">email</label>
                                        <input type="email" id="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="phone">phone</label>
                                        <input type="text" id="phone" placeholder="Phone">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="date">select date</label>
                                        <!--<input type="date" id="date">-->
                                        <input type="text" id="ID-laydate-mark" placeholder="yyyy-MM-dd">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label>select time</label>
                                        <select id="select_time" class="reservation_input select_js">
                                            <option value="" disabled="true">select</option>
                                            <option value="0">09.00 am to 12.00 pm</option>
                                            <option value="1">13.00 pm to 16.00 pm</option>
                                            <option value="2">18.00 pm to 21.00 pm</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label>select person</label><br>
                                        <select class="reservation_input select_js">
                                            <option value="">select</option>
                                            <option value="1">1 person</option>
                                            <option value="2">2 person</option>
                                            <option value="3">3 person</option>
                                            <option value="4">4 person</option>
                                            <option value="5">5 person</option>
                                            <option value="6">6 person</option>
                                            <option value="7">7 person</option>
                                            <option value="8">8 person</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="tf__reservation_input_single">
                                    <label for="name">Total</label>
                                    <input type="text" id="name" placeholder="品項總金額+人頭費用(100/人)">
                                </div>
                                <div class="col-xl-12">
                                    <button type="button" class="common_btn">訂位確認</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer section -->
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
<!-- footer section -->

</section>

<!-- end info section -->


<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="js/custom.js"></script>
<script src="//unpkg.com/layui@2.8.15/dist/layui.js"></script>
<script>
    // 获取项目路径
    <%--var projectPath = '<%= request.getContextPath() %>';--%>
    layui.use(['laydate', 'layer'], function () {
        var laydate = layui.laydate;
        var layer = layui.layer;

        // 监听点击事件
        $('#ID-laydate-mark').on('click', function () {
            var selectedDate = $(this).val(); // Get the selected date


            // 发送 AJAX 请求获取数据并渲染日期选框的内容
            $.ajax({
                url: "http://localhost:8081/diyla_back/api/diy-reserve/peoItemQuantityReport",
                data: {
                    // endDate: selectedDate, // Use the selected date as endDate
                    period: 0 // Replace with the desired period
                },
                success: function (data) {

                    let mar = {};

                    let mars = [];


                    for (let x in data) {
                        let itemQuantity = 0;
                        let diyReserveDate = "";
                        for (let xx in data[x]) {
                            mars.push(data[x][xx]);


                            itemQuantity += data[x][xx].itemQuantity;
                            diyReserveDate = data[x][xx].diyReserveDate;

                        }
                        if (itemQuantity >= 30) {
                            mar[diyReserveDate] = '已满';
                        }

                    }
                    // Handle the received JSON data here and update the datepicker's content
                    // For example, you can use mark: {} to customize marked dates
                    laydate.render({
                        elem: '#ID-laydate-mark',
                        min: 0,
                        max: 60,
                        mark: mar, // Use the received data to mark dates
                        done: function (value, date) {
                            // Your done function logic
                            for (let key in mar) {
                                if (key === value) {
                                    layer.msg("无法选择该日期！", {icon: 2});
                                    $('#ID-laydate-mark').val("");
                                }
                            }

                            let values = [];
                            for (let i = 0; i < mars.length; i++) {
                                if (value === mars[i].diyReserveDate) {
                                    values.push(mars[i].diyPeriod)
                                }
                            }

                            // 移除所有选项的 disabled 属性
                            $("#select_time option").prop("disabled", false);

                            // 设置是否不可选
                            $("#select_time option").each(function() {
                                let value = $(this).val();

                                for (let i = 0; i < values.length; i++) {

                                    if (values[i] == value) {
                                        $(this).prop("disabled", true);
                                    }
                                }
                            });

                        }
                    });
                },
                error: function (error) {
                    console.log("Error fetching data:", error);
                    layer.msg("Error fetching data: " + error.responseText, {icon: 2});
                }
            });
        });
    });


</script>

</body>

</html>
