<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>商品詳情</title>
    <link rel="stylesheet" type="text/css" href="../css/alterCommodity.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
</head>

<body>
<h1>商品詳情</h1>
<div id="CONTENT">
    <!--商品欄開始-->
    <div class="prod">
        <div class="img">
            <img src="1.jpg" class="commodityPhoto" style="width: 100%">
        </div>
        <div class="commodityPage">
				<span class="commodityDescription">
					<label>商品名稱：</label>
					<span>${commodity.comName}</span>
					<br>
					<label>商品類別：</label>
					<span>${commodity.comClass}</span>
					<br>
					<label>商品描述：</label>
					<span>${commodity.comContent}</span> <br>
					<br>
					<label>價格：</label><span id="price">${commodity.comPri}</span>
					<br>
					<label>商品狀態：</label><span>${commodity.launch==1?"上架中" : "未上架"}</span>
					<br>
					<label>更新時間：</label>
				<fmt:formatDate value="${commodity.updateTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/> <br>
					<button type="submit" form="form1" class="button">修改資料</button>
        </div>
    </div>
</div>

</body>
</html>
