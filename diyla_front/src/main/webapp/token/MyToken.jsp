<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.articleModel.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.tokenModel.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    TokenService tokenSvc = new TokenService();
    Integer memId = (Integer)session.getAttribute("memId");
    List<TokenVO> list = tokenSvc.getAllTokenByMemId(memId);
    Integer total = tokenSvc.getTokenTotalByMemId(memId);
    pageContext.setAttribute("list", list);
    pageContext.setAttribute("total", total);
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>我的代幣紀錄</title>

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

        </style>


</head>
<body>
    <jsp:include page="../front_header.jsp"/>
        <div class="title">
            <h4>代幣紀錄</h4>
                 <table>
                     <thead>
                         <tr>
                             <th>代幣計算</th>
                             <th>代幣紀錄</th>
                             <th>時間</th>
                         </tr>
                     </thead>
                     <tbody>
                         <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="list" items="${list}">
                                    <tr>
                                        <td>${list.tokenCount}</td>
                                        <td>${list.tokenGetUse}</td>
                                        <td>${list.tokenTime}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                    <tr>
                                        <td>查無資料</td>
                                        <td>查無資料</td>
                                        <td>查無資料</td>
                                    </tr>
                            </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

        </div>



    </body>


    </html>