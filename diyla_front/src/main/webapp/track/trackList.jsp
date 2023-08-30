<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cha102.diyla.track.*"%>
<%@ page import="java.util.*"%>


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


</head>
<body>

    <jsp:include page="../front_header.jsp"/>
    <div class="title">
        <h4>追蹤清單</h4>
        <c:choose>
            <c:when test="${not empty trackList}">
              <c:forEach var="CommodityTrackDTO" items="${trackList}">
              <c:out value="${CommodityTrackDTO.comName}" />
              <c:out value="${CommodityTrackDTO.comNO}" />
              <div id="show_img">
                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(CommodityTrackDTO.comPic)}" alt="公告圖片">
              </div>
              <c:out value="${CommodityTrackDTO.comPri}" />
              <c:out value="${CommodityTrackDTO.comQua}" />
              </c:forEach>
            </c:when>
            <c:otherwise>
                 <span>您目前還沒有追蹤的商品</span>
            </c:otherwise>
        </c:choose>
    </div>



</body>


</html>