<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cha102.diyla.track.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>我的追蹤清單</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>

    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>
    <style>
         body {
             display: flex;
             -webkit-box-orient: vertical;
             -webkit-box-flex: normal;
             flex-direction: column;
             }
    </style>

</head>
<body>

    <jsp:include page="../front_header.jsp"/>


    <h4>追蹤清單</h4>
    <section class="shop_section layout_padding">
    <div class="row">
        <c:choose>
            <c:when test="${not empty trackList}">
              <c:forEach var="CommodityTrackDTO" items="${trackList}">
              <div class="col-sm-6 col-md-4 col-lg-3">
                  <div class="box">
                    <a href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${CommodityTrackDTO.comNO}">
                        <div class="img-box">
                            <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(CommodityTrackDTO.comPic)}" alt="商品圖片">
                        </div>
                        <div class="detail-box">
                            <h6>
                                ${CommodityTrackDTO.comName}
                            </h6>
                            <h6>
                                <span>
                                NT$${CommodityTrackDTO.comPri}元
                                </span>
                            </h6>

                        </div>
                    </a>
                  </div>
              </div>
              </c:forEach>
        </div>
    <div>
            </c:when>
            <c:otherwise>
                 <span>您目前還沒有追蹤的商品</span>
            </c:otherwise>
        </c:choose>
    </div>
</section>


<jsp:include page="../front_footer.jsp"/>

</body>


</html>