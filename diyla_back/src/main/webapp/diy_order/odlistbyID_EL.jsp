<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diycatemodel.*"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
    <title>查詢單筆訂單資料-EL_Ver.</title>
        <style>
        /* Reset default styles */
        body, h1, ul, li {
            margin: 0;
            padding: 0;
        }

        body {
            margin-left: 280px;
            height: 100%;
            text-align: center;
            line-height: 50px;
        }
        
        li { 
 	font-size: 1rem; 
 	text-decoration: none; 
 	list-style-type: none;
 } 
 
 a {
    font-size: 1rem;
    text-decoration: none;
    color: #333; /* 设置链接文本颜色为灰色 */
}

/* 鼠标悬停时的链接样式 */
a:hover {
    color: red; /* 设置鼠标悬停时的文本颜色为红色 */
    font-weight: bold; /* 设置文本粗体 */
    font-size: 1.3rem;
}

        header {
            background-color: #f8a229;
            color: white;
            padding: 20px 0;
            position: relative; /* 添加相对定位 */
        }

        /* Style the h1 element */
        .header-title {
            font-size: 2rem;
            font-weight: bold;
            margin-top: 10px;
        }

        /* Style the "返回DIY首頁" link */
        #header-title2 {
            font-size: 1.3rem;
            text-decoration: none;

            position: absolute; /* 添加绝对定位 */
            top: 20px; /* 调整顶部距离 */
            right: 20px; /* 调整右侧距离 */
            margin-top: 40px;
        }

        /* Center the table */
        .center-div {
            text-align: center;
            margin-top: 20px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            font-family: Arial, sans-serif;
            border: 1px solid black;
            font-size: 0.8rem;
            text-align: center;
            margin: 50px auto;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<header>
    <span>
        <h1 class="header-title">訂單編號：${diyOrderVO.diyOrderNo} 之訂單結果</h1>
    </span>
    <li><a href='diyorderfront.jsp' id="header-title2">> 返回DIY首頁</a></li>
</header>
<div class="center-div">
    <table>
        <tr>
            <th>會員編號</th>
            <th>DIY品項名稱</th>
            <th>聯絡人</th>
            <th>聯絡電話</th>
            <th>預約人數</th>
            <th>預約時段</th>
            <th>DIY預約日期</th>
            <th>預約單建立時間</th>
            <th>預約狀態</th>
            <th>付款狀態</th>
            <th>DIY訂單金額</th>
        </tr>
        <tr>
            <td>${diyOrderVO.memId}</td>
            <c:forEach var="DiyCateEntity" items="${diyCateList}">
                <c:choose>
                    <c:when test="${diyOrderVO.diyNo == DiyCateEntity.diyNo}">
                        <td>${DiyCateEntity.diyName}</td>
                    </c:when>
                </c:choose>
            </c:forEach>
            <td>${diyOrderVO.contactPerson}</td>
            <td>${diyOrderVO.contactPhone}</td>
            <td>${diyOrderVO.reservationNum}</td>
            <c:choose>
                <c:when test="${diyOrderVO.diyPeriod == 0}">
                    <td>上午</td>
                </c:when>
                <c:when test="${diyOrderVO.diyPeriod == 1}">
                    <td>下午</td>
                </c:when>
                <c:when test="${diyOrderVO.diyPeriod == 2}">
                    <td>晚上</td>
                </c:when>
            </c:choose>
            <td>${diyOrderVO.diyReserveDate}</td>
            <td><fmt:formatDate value="${diyOrderVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <c:choose>
                <c:when test="${diyOrderVO.reservationStatus == 0}">
                    <td>訂位完成</td>
                </c:when>
                <c:when test="${diyOrderVO.reservationStatus == 1}">
                    <td>訂位已取消，尚未退款完成</td>
                </c:when>
                <c:when test="${diyOrderVO.reservationStatus == 2}">
                    <td>退款完成</td>
                </c:when>
                <c:when test="${diyOrderVO.reservationStatus == 3}">
                    <td>當日未到</td>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${diyOrderVO.paymentStatus == 0}">
                    <td>已付款</td>
                </c:when>
                <c:when test="${diyOrderVO.paymentStatus == 1}">
                    <td>已完成訂單</td>
                </c:when>
                <c:when test="${diyOrderVO.paymentStatus == 2}">
                    <td>已失效訂單</td>
                </c:when>
                <c:when test="${diyOrderVO.paymentStatus == 3}">
                    <td>已退款訂單</td>
                </c:when>
            </c:choose>
            <td>${diyOrderVO.diyPrice}</td>
        </tr>
    </table>
</div>
</body>
</html>
