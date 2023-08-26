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
    <a href="${ctxPath}/shop/commodityClassManage.jsp">
        <button class="add-button">商品類別管理</button>
    </a>
    <a href="${ctxPath}/shop/CommodityController?action=insertPage">
        <button class="add-button">新增商品</button>
    </a>
    <div class="search-bar">
    </div>
    <form action="${ctxPath}/shop/CommodityController" method="get" enctype="application/x-www-form-urlencoded"
          id="findByClassNOForm">
        <input type="text" name="action" value="findByClassNO" hidden="hidden">
        <select id="comClassNo" name="comClassNo">
            <option value="" selected disabled>請選擇商品類別</option>
            <c:forEach var="i" begin="1" end="${classNameMapSize}">
                <option value="${i}">${classNameMap[i]}</option>
            </c:forEach>
        </select>
    </form>

    <div>
        <form action="${ctxPath}/shop/CommodityController" method="get"
              enctype="application/x-www-form-urlencoded">
            <input type="text" name="action" value="search" hidden="hidden">
            <input type="text" class="search-box" value="請輸入關鍵字" name="keyword"
                   onfocus="if (this.value=='請輸入關鍵字') this.value='';"
                   onblur="if (this.value=='') this.value='請輸入關鍵字';">
            <button type="submit">搜尋</button>
        </form>

    </div>
    <table>
        <tr>
            <th>商品類別</th>
            <th>商品名稱</th>
            <th>價格</th>
            <th>數量</th>
            <th>狀態</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${commodityList}" var="commodity">
            <tr>
                <td>${classNameMap[commodity.comClassNo]}</td>
                <td>
                    <a href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${commodity.comNO}">${commodity.comName}</a>
                </td>
                <td>${commodity.comPri}</td>
                <td>${commodity.comQua}</td>
                <td>${commodity.comQua==0?"完售":commodityState[commodity.comState]}</td>
                <td>
                    <button type="submit" form="changeState${commodity.comNO}" class="add-button">${commodity.comState==0?"上架":"下架"}</button>
                    <form action="${ctxPath}/shop/CommodityController" method="post" enctype="application/x-www-form-urlencoded" id="changeState${commodity.comNO}">
                        <input type="text" name="action" value="changeState" hidden="hidden">
                        <input type="text" name="comState" value="${commodity.comState==0?1:0}" hidden="hidden">
                        <input type="text" value="${commodity.comNO}" name="comNO" hidden="hidden">
                    </form>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
<script src="../vendors/jquery/jquery-3.7.0.min.js"></script>
<script>
    $(document).ready(function () {

        $('#comClassNo').change(() => {
            $('#findByClassNOForm').submit();

        })

    });
</script>
</body>
</html>
