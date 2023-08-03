<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>購物車搜尋</title>
</head>
<body>
<h1>購物車清單搜尋</h1>

輸入會員編號:
<form action="ShoppingCartServlet" method="post">
           	<input type="text" name="memId" value="">
            <input type="hidden" name="action" value="getAll">
            <input type="submit" value="送出">

</form>
新增購物車商品:
<form action="ShoppingCartServlet" method="post">
           	<input type="text" name="comId" value="">
            <input type="hidden" name="action" value="addItem">
            <input type="submit" value="送出">

</form>

</body>
</html>