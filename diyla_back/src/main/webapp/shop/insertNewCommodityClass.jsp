<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%-- List<String> productCategories = (List<String>) request.getAttribute("productCategories"); --%>
<!DOCTYPE html>
<html>
<head>
    <title>商品類別管理</title>
    <link rel="stylesheet" type="text/css" href="../css/commodityClass.css">
</head>
<body>
<div class="header">商品類別管理</div>
<div class="container">
    <div class="category-list">
        <%-- for (String category : productCategories) { %>
        <div class="category-item">
          <div class="category-name"><%= category %></div>
          <div class="category-buttons">
            <div class="button">修改</div>
            <div class="button">刪除</div>
          </div>
        </div>
        <% } --%>
    </div>
    <div class="input-container">
        <form action="CommodityClassController" method="post">
            <input type="text" name="action" value="insert" hidden="hidden">
            <input type="text" class="input-field" id="className" name="className" placeholder="新增新的類別">
            <span style="display: block; color: red;">${errMsgs["className"]}</span>
            <input type="submit" id="submitButton" value="提交">
        </form>
    </div>
</div>

</body>
</html>
