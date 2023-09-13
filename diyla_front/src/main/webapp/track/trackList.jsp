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
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-straight/css/uicons-thin-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <style>
        * {
            box-sizing: border-box;
            font-family: "jf open 粉圓 1.1";

        }
         body {
             display: flex;
             -webkit-box-orient: vertical;
             -webkit-box-flex: normal;
             flex-direction: column;
             margin:0;
             }
        div.title {
            width: 800px;
            height: 700px;
            color: #B26021;
            position: relative;
            top: 50%;
            left: 50%;
            transform: translateX(-50%);
            letter-spacing: 3px;
            margin: 50px 0;
            display: flex;
        }

        aside {
            width: 200px;
            border: 1px solid #B26021;
            margin-right: 1.5rem;
            border-radius: 6px;
            background-color: snow;
        }

        h4.member {
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        div.member {
            border: 1px solid #B26021;
            flex: 1;
            padding: 10px 1.5rem 10px 1.5rem;
            font-size: 1rem;
            width: 400px;
            height: 700px;
            position: relative;
            border-radius: 6px;
            background-color: snow;
            overflow-y:auto;
        }

        aside>ul {
            margin-top: 2rem;
            padding-left: 0;
        }

        aside>ul>li {
            margin-bottom: 1rem;
            list-style: none;
            padding: 1rem;
            position: relative;
            width: 198px;
            display: block;
        }

        aside>ul>li:hover {

            background: #F1F1F1;
        }

        aside>ul>li>a {
            display: block;
            text-decoration: none;
            color: #B26021;
            width: 100%;
            height: 100%;
        }
        .order>a{
            display: block;
            color: #B26021;
        }

        aside>ul>li>a:hover {
            text-decoration: none;
            color: #B26021;
        }
        .order>a:hover{
            color: #B26021;
        }
        .order:hover{
            border:1.5px solid #B26021;
            box-shadow:0 0 10px lightgray;
        }

        i {
            padding-right: 0.4rem;
        }

        #a1::before {
            content: "";
            position: absolute;
            top: 7px;
            left: 0px;
            height: 40px;
            width: 4px;
            background-color: #B26021;
        }

        #a1 {
            font-weight: bold;
        }
        .box{
            margin:10px 14px 10px 18px !important;
            width:230px !important;
            border-radius:8px !important;
            background-color:white !important;
        }
        .box:hover{
            box-shadow:0 0 10px lightgray;
        }
        input[type="submit"] {
            cursor: pointer;
            border: 0;
            background-color:white;
        }
        .shop_section layout_padding{
            padding:0;
            margin-left:10px;
        }
        span.member{
            margin:18px;
        }


    </style>

</head>
<body>

    <jsp:include page="../front_header.jsp"/>
    <div class="title">
        <aside>
            <ul>
                <li><a href="${ctxPath}/member/update?action=select&memId=${memId}"><i
                            class="fi fi-ts-user-gear"></i>會員資訊管理</a></li>
                <li><a href="${ctxPath}/member/updatePw.jsp"><i class="fi fi-tr-key-skeleton-left-right"></i>修改密碼</a>
                </li>
                <li><a href="${ctxPath}/allOrder/allOrder?memId=${memId}"><i class="fi fi-ts-ballot"></i>我的訂單</a></li>
                <li><a id="a1" href="${ctxPath}/track/track?memId=${memId}"><i class="fi fi-tr-hand-love"></i>我的商品追蹤</a>
                </li>
                <li><a href="${ctxPath}/token/MyToken.jsp"><i class="fi fi-ts-piggy-bank"></i>我的代幣</a></li>
                <li><a href="${ctxPath}/member/login?action=logout"><i class="fi fi-tr-hand-wave"></i>登出</a></li>
            </ul>
        </aside>
        <div class="member">
            <h4 class="member">我的商品追蹤</h4>
            <section class="shop_section layout_padding" style="padding:0;">
                <div class="row">
                    <c:choose>
                        <c:when test="${not empty trackList}">
                            <c:forEach var="CommodityTrackDTO" items="${trackList}">
                                <div class="">

                                    <div class="box">
                                        <a
                                            href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${CommodityTrackDTO.comNO}">
                                            <div class="img-box">
                                                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(CommodityTrackDTO.comPic)}"
                                                    alt="商品圖片">
                                            </div>
                                            <div class="detail-box">
                                                <h6 style="font-size:14px;margin-left:6px;margin-bottom:0;">
                                                    ${CommodityTrackDTO.comName}<br>
                                                    ${CommodityTrackDTO.comPri}元
                                                </h6>
                                                <form method="post" action="<spring:url value='/track/del'/>">
                                                    <input type="hidden" name="memId"
                                                        value="${CommodityTrackDTO.memId}">
                                                    <input type="hidden" name="trackId"
                                                        value="${CommodityTrackDTO.trackId}">
                                                    <input type="submit" value="💔" >
                                                </form>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <span class="member">您目前還沒有追蹤的商品</span>
                        </c:otherwise>
                    </c:choose>

                </div>
            </section>
        </div>
    </div>


<jsp:include page="../front_footer.jsp"/>

</body>


</html>