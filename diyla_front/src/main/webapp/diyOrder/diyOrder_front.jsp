<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/front_header.jsp" />
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人訂單_給會員編號用</title>
</head>
<body>
		<form method="post" action="DiyOrderFrontController">
          <b>輸入會員編號 (如1):</b><input type="text" name="memId">
          <input type="hidden" name="action" value="getOne_For_Display_front">
          <input type="submit" value="查詢所有訂單狀態">
        </form>

</body>
</html>