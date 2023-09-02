<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.commodityOrder.*"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.*"%>
<%@ page import="java.util.*"%>
<%
    CommodityOrderService comSvc = new CommodityOrderService();
    Integer memId = (Integer)session.getAttribute("memId");
    List<CommodityOrderVO> comList = comSvc.getAllByMemId(memId);
    pageContext.setAttribute("comList", comList);

    ClassOrderService classSvc = new ClassOrderService();
    List<ClassOrderDTO> classList = classSvc.getAllByMemId(memId);
    pageContext.setAttribute("classList",classList);
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>我的訂單</title>
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
    <h4>我的訂單</h4>
    <c:forEach var="comList" items="${comList}">
             商店：<br>
             訂單狀態：${comList.orderStatus}<br>
             訂單名稱：${comList.orderNO}<br>
             訂單時間：${comList.orderTime}<br>
             訂單金額：${comList.actualPrice}<br>

    </c:forEach>
    <c:forEach var="diyList" items="${diyList}">
             DIY：<br>
             訂單狀態：${diyList.reservationStatus}<br>
             訂單名稱：${diyList.diyCateName}<br>
             訂單時間：${diyList.diyReserveDate}<br>
             訂單金額：${diyList.diyPrice}<br>

    </c:forEach>
    <c:forEach var="classList" items="${classList}">
                 課程：<br>
                 訂單狀態：${classList.status}<br>
                 訂單名稱：${classList.className}<br>
                 訂單時間：${classList.classDate}<br>
                 訂單金額：${classList.totalPrice}<br>

    </c:forEach>


</body>


</html>