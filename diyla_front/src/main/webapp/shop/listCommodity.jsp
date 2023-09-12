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
        商店
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
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/shop/listCommodity.css">
</head>

<body>
<jsp:include page="../front_header.jsp"/>
<!-- shop section -->

<section class="shop_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center" style="display: flex;justify-content: space-between;align-items: center;">
            <div class="left-align" style="text-align: left;">
                <form action="${ctxPath}/shop/CommodityController" method="get"
                      enctype="application/x-www-form-urlencoded" id="findByClassNOForm">
                    <input type="text" name="action" value="findByClassNO" hidden="hidden">
                    <select id="comClassNo" name="comClassNo">
                        <option value="" selected disabled>請選擇商品類別</option>
                        <c:forEach var="i" begin="1" end="${classNameMapSize}">
                            <option value="${i}">${classNameMap[i]}</option>
                        </c:forEach>
                    </select>
                </form>
            </div>
            <div class="right-align" style="text-align: left;">
                <form action="${ctxPath}/shop/CommodityController" method="get"
                      enctype="application/x-www-form-urlencoded">
                    <input type="text" name="action" value="search" hidden="hidden" style="color:#B26021">
                    <input type="text" class="search-box" value="請輸入關鍵字" name="keyword"
                           onfocus="if (this.value=='請輸入關鍵字') this.value='';"
                           onblur="if (this.value=='') this.value='請輸入關鍵字';">
                    <button type="submit" style="height:43px;width:100px;border-radius: 4px;background-color:#B26021;color:#FCE5CD;border:none;">搜尋</button>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <c:forEach items="${commodityList}" var="commodity">
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="box">
                    <a href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${commodity.comNO}">
                        <div class="img-box">
                            <img src="${commodity.showPic}" alt="">
                        </div>
                        <div class="detail-box">
                            <h6>
                                    ${commodity.comName}
                            </h6>
                            <h6>
                    <span>
                        NT$${commodity.comPri}元
                  </span>
                            </h6>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

<!-- end shop section -->

<jsp:include page="../front_footer.jsp"/>


<script src="${ctxPath}/js/jquery-3.4.1.min.js"></script>
<script src="${ctxPath}/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="${ctxPath}/js/custom.js"></script>
<script>
    $(document).ready(function () {

        $('#comClassNo').change(() => {
            $('#findByClassNOForm').submit();

        })

    });
</script>
</body>

</html>