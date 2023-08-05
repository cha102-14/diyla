<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="../css/listCommodity.css">
</head>
<body>
<div class="container">
    <div class="header">商品列表</div>
    <a href="${ctxPath}/shop/CommodityController?action=insertPage"><button class="add-button">新增商品</button></a>
    <div class="search-bar">
    </div>
    <table>
        <tr>
            <th>商品類別</th>
            <th>商品名稱</th>
            <th>價格</th>
            <th>數量</th>
            <th>狀態</th>
        </tr>
        <c:forEach items="${commodityList}" var="commodity"  >
            <tr>
                <td>${classNameMap[commodity.comClassNo]}</td>
                <td><a href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${commodity.comNO}">${commodity.comName}</a></td>
                <td>${commodity.comPri}</td>
                <td>${commodity.comQua}</td>
                <td>${commodityState[commodity.comState]}</td>
            </tr>
        </c:forEach>

    </table>
</div>

</body>
</html>
