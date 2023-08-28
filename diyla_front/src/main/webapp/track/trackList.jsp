<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cha102.diyla.track.*"%>
<%@ page import="java.util.*"%>

<%
    CommodityTrackService service = new CommodityTrackService();
    Integer memId = (Integer) session.getAttribute("memId");
    List<CommodityTrackDTO> track = service.findById(memId);


%>

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
            <c:when test="${not empty track}">
              <c:forEach var="track" items="${track}">
                   ${track.comNO}
                   ${track.comName}
              </c:forEach>
            </c:when>
            <c:otherwise>
                 <span>您目前還沒有追蹤的商品</span>
            </c:otherwise>
        </c:choose>
    </div>



</body>


</html>