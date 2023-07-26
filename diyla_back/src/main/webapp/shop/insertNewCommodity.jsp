<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>新增商品表單</title>
    <link rel="stylesheet" type="text/css" href="../css/commodity.css">
</head>
<body>
<h1>新增商品表單</h1>
<form action="CommodityController" method="post">
    <input type="text" value="insert" hidden="hidden" name="action">
    <label for="category_id">商品類別編號:</label>
    <select id="category_id" name="categoryId" >
        <option value="" selected disabled>請選擇商品類別</option>
        <%-- <c:forEach var="categoryId" items="categoryIds" >
            <option value="${categoryId}">${categoryId}</option>
        </c:forEach> --%>
        <option value="1">烘焙器材</option>
        <option value="2">食材原料</option>
        <option value="3">精緻點心</option>
    </select><br>

    <label for="product_name">商品名稱:</label>
    <input type="text" id="product_name" name="product_name" ><br>

    <label for="product_image">商品圖片:</label>
    <input type="file" id="product_image" name="product_image" accept="image/*" ><br>

    <label for="product_description">商品描述:</label>
    <textarea id="product_description" name="product_description" ></textarea><br>

    <label for="price">價格:</label>
    <input type="number" id="price" name="price"  value="0"><br>

    <label for="quantity">數量:</label>
    <input type="number" id="quantity" name="quantity"  value="0"><br>

    <label for="product_status">商品狀態:</label>
    <select id="product_status" name="product_status"  >
        <option value="下架" selected>下架</option>
        <option value="上架中" >上架中</option>
        <option value="完售">完售</option>
    </select><br>

    <input type="submit" value="提交"> <button type="reset" id="reset-btn">清除</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js">
    document.addEventListener('DOMContentLoaded', function() {
        // 這裡是你要執行的function或代碼
    });

    function getCategory() {
    }
</script>
</body>
</html>
