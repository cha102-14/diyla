<%@ page import="com.cha102.diyla.commodityModel.CommodityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>


<html>
<head>
    <title>修改商品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F5;
            font-size: 16pt;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #FFFFFF;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .header {
            background-color: #B26021;
            color: #FFFFFF;
            padding: 10px;
            text-align: center;
            font-size: 24px;
            border-radius: 5px;
            font-weight: bold;
        }

        label {
            color: #B26021;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            border: 1px solid #B26021;
            margin: 10px 0;
        }

        .button {
            background-color: #B26021;
            color: #FFFFFF;
            border: none;
            padding: 10px 20px;
            margin: 15px 0;
            border-radius: 5px;
            cursor: pointer;
        }

        .commodityPhoto {
            width: 300px;
            height: 300px;
            margin-bottom: 10px;
        }

        #product_description {
            width: 300px;
            height: 100px;
            margin-bottom: 10px;
            resize: both;
            overflow: auto;
        }
    </style>
</head>

<body style="margin-left: 280px">
<aside class="topPage">
    <jsp:include page="../index.jsp"/>
</aside>
<div class="container">
    <div class="header">修改商品</div>
    <div id="CONTENT">
        <!--商品欄開始-->

        <form action="${ctxPath}/shop/CommodityController" method="post" enctype="multipart/form-data">
            <input type="text" value="update" name="action" hidden="hidden">
            <input type="text" value="${commodity.comNO}" name="comNO" hidden="hidden">

            <div class="img">
                <img src="${commodity.showPic}" class="commodityPhoto">
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
					<textarea id="product_description" name="commodityDes">${commodity.comDes}</textarea>
                    <br>
                    <span style="display: block; color: red;">${errMsg["commodityPri"]}</span>
					<label>價格：</label>
                    <input type="number" id="price" name="commodityPri" value="${commodity.comPri}">
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
                <a href="${ctxPath}/shop/CommodityController?action=listAll">
                    <button class="button" style="background-color: darkgray">返回商品清單</button>
                </a>
            </div>
        </form>

    </div>
</div>

</body>
</html>
