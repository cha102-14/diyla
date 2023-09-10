<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/listCommodity.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body style="margin-left: 280px">
<aside class="topPage">
    <jsp:include page="../index.jsp" />
</aside>
<H1 style="color: #B26021">新增商品</H1>
<a href="${ctxPath}/shop/CommodityController?action=listAll"><button class="button" >返回商品清單</button></a>
</body>
</html>
