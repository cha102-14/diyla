<%@ page import="com.cha102.diyla.diycatemodel.DiyCateEntity" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--JSP 標籤，用於設置網頁的語言和編碼方式-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<%
    DiyCateEntity diyCateEntity = (DiyCateEntity) request.getAttribute("DiyCateEntity");

%>


<head>
    <!-- Basic -->
    <style>
        .custom-popup {
            border: 2px solid orange;
        }

        .custom-popup p {

            font-size: 16px; /* 調整字體大小 */

        }
    </style>
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
    <link rel="stylesheet" href="/diyla_front/diy/css/bootstrap.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/slick.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/nice-select.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/venobox.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/animate.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/jquery.exzoom.css">

    <link rel="stylesheet" href="/diyla_front/diy/css/spacing.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/style.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/responsive.css">
    <!-- 引入 SweetAlert2 的 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.3/dist/sweetalert2.min.css">
    <title>
        DIY訂位
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/css/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="/diyla_front/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="/diyla_front/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="/diyla_front/css/responsive.css" rel="stylesheet"/>
    <link href="//unpkg.com/layui@2.8.15/dist/css/layui.css" rel="stylesheet">


</head>

<body>
<div class="hero_area">
    <!-- header section strats -->
    <jsp:include page="/front_header.jsp"/>
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
                                <label for="name">您選擇的diy項目</label>
                                <textarea readonly rows="1.5" cols="10"
                                          style="height: 60%; text-align: center; resize: none; overflow: hidden;"
                                          placeholder="蛋糕、餅乾...">
        <%=diyCateEntity.getDiyName()%>
    </textarea>

                    </div>
                            <%-- 获取 HttpSession 中的用户对象 --%>
                            <c:set var="memVO" value="${sessionScope.memVO}"/>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="name">姓名</label>
                                        <input type="text" id="name" value="${memVO.memName}" placeholder="Name"
                                               readonly>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="phone">電話</label>
                                        <input type="text" id="phone" value="${memVO.memPhone}" placeholder="Phone"
                                               readonly>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label for="ID-laydate-mark">預約日期</label>
                                        <!--<input type="date" id="date">-->

                                        <input type="text" id="ID-laydate-mark" name="diyReserveDate"
                                               placeholder="yyyy-MM-dd">

                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label>選擇時段</label>
                                        <select id="select_time" class="reservation_input select_js">
                                            <option value="-1">select</option>
                                            <option value="0">09.00 am to 12.00 pm</option>
                                            <option value="1">13.00 pm to 16.00 pm</option>
                                            <option value="2">18.00 pm to 21.00 pm</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="tf__reservation_input_single">
                                        <label>選擇人數</label><br>
                                        <select id="person" class="reservation_input select_js">
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

                                    <label for="name">總金額</label>

                                    <input type="text" id="amount" placeholder="品項總金額" readonly>
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
<jsp:include page="/front_footer.jsp"/>
<!-- end info section -->


<script src="/diyla_front/js/jquery-3.4.1.min.js"></script>
<script src="/diyla_front/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="/diyla_front/js/custom.js"></script>
<script src="//unpkg.com/layui@2.8.15/dist/layui.js"></script>
<!-- 引入 SweetAlert2 的 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.3/dist/sweetalert2.min.js"></script>
<script>
    $(document).ready(function () {

        let currentCount = 0;

        let map = new Map();
        // 取得專案路徑
        layui.use(['laydate', 'layer'], function () {
            let laydate = layui.laydate;
            let layer = layui.layer;

            // 監聽點擊事件
            $('#ID-laydate-mark').on('click', function () {
                $.ajax({
                    url: "/diyla_front/api/diy-reserve/peoCountReport",
                    data: {
                        period: 0
                    },
                    success: function (data) {
                        let mar = {};
                        let mars = [];

                        for (let x in data) {
                            let peoCount = 0;
                            let diyReserveDate = "";
                            for (let xx in data[x]) {
                                mars.push(data[x][xx]);
                                peoCount += data[x][xx].peoCount;
                                diyReserveDate = data[x][xx].diyReserveDate;
                            }
                            if (peoCount >= 60) {
                                mar[diyReserveDate] = '已滿';
                            }
                        }

                        // 處理接收到的 JSON 資料並更新日期選擇框的內容
                        laydate.render({
                            elem: '#ID-laydate-mark',
                            min: 0,
                            max: 60,
                            mark: mar, // 使用接收到的資料來標記日期
                            done: function (value, date) {
                                for (let key in mar) {
                                    if (key === value) {
                                        layer.msg("無法選擇該日期！", {icon: 2});
                                        $('#ID-laydate-mark').val("");
                                    }
                                }

                                let values = [];
                                for (let i = 0; i < mars.length; i++) {
                                    if (value === mars[i].diyReserveDate) {
                                        values.push(mars[i])
                                    }
                                }
                                $("#select_time option").each(function () {
                                    let value = $(this).val();
                                    $(this).prop("disabled", false);
                                    for (let i = 0; i < values.length; i++) {
                                        map.set(values[i].diyPeriod, values[i].peoCount);
                                        if (values[i].diyPeriod == value && (values[i].peoCount >= 20 || values[i].reserveStatus === 1)) {
                                            $(this).prop("disabled", true);
                                        }
                                    }
                                });
                            }
                        });
                    },
                    error: function (error) {
                        console.log("取得資料時發生錯誤:", error);
                        layer.msg("取得資料時發生錯誤：" + error.responseText, {icon: 2});
                    }
                });
            });
        });

        $('.common_btn').on('click', function () {
            const name = $('#name').val();
            const phone = $('#phone').val();
            const amount = $('#amount').val();
            const selectedDate = $('#ID-laydate-mark').val();
            const selectedPeriod = $('#select_time option:selected').text();
            const period = $('#select_time option:selected').val();
            const selectedPeople = $('.select_js').last().val();

            // 驗證是否完整選擇了時段、人數、日期
            if (!selectedDate || !selectedPeriod || !selectedPeople || period == "-1") {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: '請選擇完整的日期、時段和人數！',
                });
                return;
            }

            let p = parseInt(period, 10);
            if (map.has(p)) {
                let residue = 20 - map.get(p);
                if (residue < selectedPeople) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: '此時段只剩下 ' + residue + ' 人數可選！',
                    });
                    return;
                }
            }


            let diyName = '<%=diyCateEntity.getDiyName()%>';

            const formHtml =
                '<form method="post" action="/diyla_front/diy/checkout/ecpay">' +
                '<div id="pop">' +
                '<p>姓名: ' + name + '</p>' +
                '<p>電話: ' + phone + '</p>' +
                '<p>訂位日期: ' + selectedDate + '</p>' +
                '<p>訂位時段: ' + selectedPeriod + '</p>' +
                '<p>您選擇的DIY項目: ' + diyName + '</p>' +
                '<p>人數: ' + selectedPeople + '</p>' +
                '<p>總金額:' + amount + '</p>' +
                '<input type="hidden" name="tradeDesc" value="' + diyName + '" >' +
                '<input type="hidden" name="totalPrice" value="' + amount + '" >' +
                '<input type="hidden" name="itemName" value="' + diyName + '" >' +
                '<input type="hidden" name="period" value="' + period + '" >' +
                '<input type="hidden" name="count" value="' + selectedPeople + '" >' +
                '<input type="hidden" name="diyNo" value="' + '<%=diyCateEntity.getDiyNo()%>' + '" >' +
                '<input type="hidden" name="cardrecipient" value="' + name + '" >' +
                '<input type="hidden" name="cardrecipientAddress" value="" >' +
                '<input type="hidden" name="cardphone" value="' + phone + '" >' +
                '<input type="hidden" name="tokenUse" value="0" >' +
                '<input type="hidden" name="selectedDate" value="' + selectedDate + '" >' +
                '</div>' +
                '<div class="buttons">' +
                '<button type="submit" id="payButton" class="btn btn-primary">付款</button>' +
                '<button id="cancelButton" type="button" class="btn btn-secondary">取消</button>' +
                '</div>' +
                '</form>';

            var popup = layer.open({
                type: 1,
                title: '<span style="font-size: 24px; font-weight: bold;">訂位確認</span>', // 使用 <span> 标签包裹标题，并添加自定义样式
                content: formHtml,
                area: ['400px', '450px'],
                shadeClose: true,
            });

            $('#cancelButton, .layui-layer-close').on('click', function () {
                layer.close(popup);
            });

            $('#payButton').on('click', function () {
                // 添加付款邏輯
                // ...
            });
        });

        // 獲取對<select>元素的引用
        $("#person").change(function () {
            // 獲取選中的值
            var selectedValue = $(this).val();
            // 計算總金額
            let amount = '<%=diyCateEntity.getAmount()%>';
            $("#amount").val(amount * selectedValue);
        });
    });


</script>


</body>

</html>
