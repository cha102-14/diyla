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
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css" />

  <!-- Custom styles for this template -->
  <link href="${ctxPath}/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
</head>

<body>
<jsp:include page="../front_header.jsp"/>
  <!-- shop section -->

  <section class="shop_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          所有商品
        </h2>
      </div>
      <div class="row">
        <c:forEach items="${commodityList}" var="commodity"  >
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
    </div>
  </section>

  <!-- end shop section -->

  <jsp:include page="../front_footer.jsp"/>


  <script src="../js/jquery-3.4.1.min.js"></script>
  <script src="../js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="../js/custom.js"></script>

</body>

</html>