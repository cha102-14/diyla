<%@ page import="com.cha102.diyla.commodityClassModel.CommodityClassService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cha102.diyla.commodityClassModel.CommodityClassVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%--<%--%>
<%--    CommodityClassService classService = new CommodityClassService();--%>
<%--    List<CommodityClassVO> commodityClasses = classService.getAll(); // 取回所有商品類別--%>
<%--    pageContext.setAttribute("commodityClasses",commodityClasses);--%>
<%--%>--%>
<html>
<head>
    <title>新增商品表單</title>
    <link rel="stylesheet" type="text/css" href="../css/listCommodity.css">
    <link rel="stylesheet" type="text/css" href="../css/commodity.css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body style="margin-left: 280px">
<aside class="topPage">
    <jsp:include page="../index.jsp"/>
</aside>
<div class="container">
    <div class="header" style="margin-bottom: 20px">新增商品表單</div>
    <form action="${ctxPath}/shop/CommodityController" method="post" enctype="multipart/form-data">
        <input type="text" value="insert" hidden="hidden" name="action">
        <span style="display: block; color: red;">${errMsg["comClassNo"]}</span>
        <label for="category_id">商品類別編號:</label>
        <select id="category_id" name="comClassNo">
            <option value="" selected disabled>請選擇商品類別</option>
            <c:forEach var="commodityClass" items="${commodityClasses}">
                <option value="${commodityClass.comClassNo}">${commodityClass.comClassName}</option>
            </c:forEach>
            <%--        <option value="1">烘焙器材</option>--%>
            <%--        <option value="2">食材原料</option>--%>
            <%--        <option value="3">精緻點心</option>--%>
        </select>

        <br>
        <span style="display: block; color: red;">${errMsg["commodityName"]}</span>
        <label for="product_name">商品名稱:</label>
        <input type="text" id="product_name" name="commodityName">

        <span style="display: block; color: red;">${errMsg["commodityPic"]}</span>
        <label for="product_image">商品圖片:</label>
        <input type="file" id="product_image" name="commodityPic" accept="image/*">

        <span style="display: block; color: red;">${errMsg["commodityDes"]}</span>
        <label for="product_description">商品描述:</label>
        <textarea id="product_description" name="commodityDes"></textarea><br>

        <span style="display: block; color: red;">${errMsg["commodityPri"]}</span>
        <label for="price">價格:</label>
        <input type="number" id="price" name="commodityPri"><br>

        <span style="display: block; color: red;">${errMsg["commodityQua"]}</span>
        <label for="quantity">數量:</label>
        <input type="number" id="quantity" name="commodityQua">


        <label for="product_status">商品狀態:</label>
        <select id="product_status" name="commodityStatus">
            <option value="0" selected>下架</option>
            <option value="1">上架中</option>
            <option value="2">完售</option>
        </select><br>

        <input type="submit" value="提交">
        <button type="reset" id="reset-btn">清除</button>
    </form>
    <a href="${ctxPath}/shop/CommodityController?action=listAll"><button class="button" >返回商品清單</button></a>
</div>
</body>
</html>
