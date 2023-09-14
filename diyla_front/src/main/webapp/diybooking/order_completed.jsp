<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>訂位成功</title>
    <link rel="shortcut icon" type="image/x-icon" href="static/picture/favicon.png">
    <link rel="stylesheet" href="/diyla_front/diy/css/bootstrap1.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/style3.css">
    <script>
        function navigateToDIYList() {
            window.location.href = '${ctxPath}/diyCate/diyCateList';
        }
    </script>
</head>

<body>
<main>
    <section class="breadcrumb-area breadcrumb-bg" data-background="static/picture/breadcrumb_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content text-center">
                        <h2></h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="order-complete-area pattern-bg pt-100 pb-100" data-background="static/picture/pattern_bg.jpg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-10">
                    <div class="order-complete-bg" data-background="img/bg/order_comp_bg.png">
                        <div class="order-complete-content">
                            <h3><span>DIYLA</span> 預約成功!</h3>
                            <div class="check mb-25"><img src="/diyla_front/diy/image/check.png" alt=""></div>
                            <p>取消/修改訂位，可於[我的訂單]自行完成。
                                座位保留10分鐘，遲到須現場重新候位。</p>
                            <a href="javascript:void(0);" onclick="navigateToDIYList();" class="btn"
                               style="font-size: 18px;">繼續瀏覽DIY品項</a>
                            <a href="/diyla_front/diyOrder/diyOrder_front.jsp" class="btn" style="font-size: 18px;">查詢我的訂單</a>
                            <p class="get-ans">Get answers to all your <a href="/diyla_front/pbm/pbm.jsp">Questions</a> you might have.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>

</html>
