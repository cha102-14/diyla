<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後臺訂單搜尋</title>
</head>
<body>

後臺訂單管理訂單:
<form action="${ctxPath}/orderManage/OrderManageController" method="post">
            <input type="hidden" name="action" value="listAllOrder">
            <input type="submit" value="送出">

</form>
<a href="${ctxPath}/orderManage/OrderManageController?action=listAllOrder">訂單管理</a>
</body>
</html>