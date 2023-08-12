<%@ page import="com.cha102.diyla.commodityModel.CommodityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>


<html>
<head>
    <title>修改商品</title>
    <link rel="stylesheet" type="text/css" href="../css/commodityPage.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
</head>

<body>
<h1>修改商品</h1>
<div id="CONTENT">
    <!--商品欄開始-->
    <div class="prod">
        <form action="${ctxPath}/shop/CommodityController" method="post" enctype="multipart/form-data">
            <input type="text" value="update" name="action" hidden="hidden">
            <input type="text" value="${commodity.comNO}" name="comNO" hidden="hidden">

            <div class="img">
                <img src="${commodity.showPic}" class="commodityPhoto" style="width: 100%">
            </div>
            <label for="product_image">商品圖片:</label>
            <input type="file" id="product_image" name="commodityPic" accept="image/*">

            <div class="commodityPage">
				<span class="commodityDescription">
                    <span style="display: block; color: red;">${errMsg["commodityName"]}</span>
                    <label for="product_name">商品名稱:</label>
                    <input type="text" id="product_name" name="commodityName" value="${commodity.comName}">
					<br>

					<label>商品類別：</label>
                    <select id="category_id" name="comClassNo">
                  <c:forEach var="i" begin="1" end="${classNameMapSize}">
                      <option value="${i}"  ${commodity.comClassNo == i?"selected":""}>${classNameMap[i]}</option>
                  </c:forEach>
                    </select>
					<br>
                    <span style="display: block; color: red;">${errMsg["commodityDes"]}</span>
					<label>商品描述：</label>
					<input type="text" id="product_description" name="commodityDes" value="${commodity.comDes}"
                           style="resize: both;">
                    <br>
                    <span style="display: block; color: red;">${errMsg["commodityPri"]}</span>
					<label>價格：</label>
                    <input type="text" id="price" name="commodityPri" value="${commodity.comPri}">
					<br>
                    <span style="display: block; color: red;">${errMsg["commodityQua"]}</span>
                    <label for="quantity">數量:</label>
                    <input type="number" id="quantity" name="commodityQua" value="${commodity.comQua}">
                    <br>
					<label>商品狀態：</label>
                    <select id="product_status" name="commodityStatus"> ${commodityState[commodity.comState]}
                        <option value="0" selected>下架</option>
                        <option value="1">上架中</option>
                        <option value="2">完售</option>
                    </select>
                    <br>

					<button type="submit" class="button">完成修改</button>
                </span>
            </div>
        </form>
    </div>
</div>

</body>
</html>
