<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%-- List<String> productCategories = (List<String>) request.getAttribute("productCategories"); --%>
<!DOCTYPE html>
<html>
<head>
    <title>商品類別管理</title>
    <link rel="stylesheet" type="text/css" href="../css/commodityClass.css">
    <script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="${ctxPath}/vendors/axios/axios.min.js"></script>
</head>
<body>
<div class="header">商品類別管理</div>
<div class="container">
    <div class="category-list">
    </div>
    <div class="input-container">
        <form action="CommodityClassController" method="post">
            <input type="text" name="action" value="insert" hidden="hidden">
            <input type="text" class="input-field" id="className" name="className" placeholder="新增新的類別">
            <span style="display: block; color: red;">${errMsgs["className"]}</span>
            <input type="submit" id="submitButton" value="提交">
        </form>
    </div>
    <div id="commodityClasses">

    <div class="category-item">
        <span class="category-name">類別2</span>
        <button class="edit-button">修改</button>
    </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        axios.get("${ctxPath}/shop/commodityClass/getAll").then((res)=>{
            console.log(res);
            let commodityClasses = res.data;

            for (i = 0; i < commodityClasses.length; i++) {

                $('#commodityClasses').append(
                    `<div class="category-item">
        <span class="category-name">`+commodityClasses[i].comClassName+
                    `   <button class="edit-button">修改</button>
    </div>`

                )

            }

        })

    });
</script>
</body>
</html>
