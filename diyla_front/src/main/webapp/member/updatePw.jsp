<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page isELIgnored="false" %>

<%
    MemVO memVO = (MemVO)session.getAttribute("memVO");
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>信箱驗證</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>

    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>


</head>
<body>

    <jsp:include page="../front_header.jsp"/>
    <div class="title">
        <h4>修改密碼</h4>
        <c:if test="${not empty exMsgs}">
             <div style="color:red" class="error">
                  <c:forEach var="message" items="${exMsgs}">
                       ${message}
                  </c:forEach>
             </div>
        </c:if>
        <div class="">
            <form method="post" action="updatePw">
                <label>姓名<br>
                <input type="text" name="memName" value="${memVO.memName}" disabled></label><br>
                <br>
                <label>帳號<br>
                <input type="email" name="upemail" value="${memVO.memEmail}" disabled></label><br>
                <br>
                <label>修改密碼<br>
                <input type="password" name="upPw" placeholder="請輸入6-12字(含英數字)"  minlength="6" maxlength="12" ></label><br>
                <span  id ="memPassword.errors" class="error">${exMsgs.memPassword}<br/></span>
                <label>確認密碼<br>
                <input type="password" name="upPwcheck" placeholder="再次輸入密碼" ></label><br>
                <span  id ="pwcheck.errors" class="error">${exMsgs.pwcheck}<br/></span>
                <input type="hidden" name="memId" value="${memVO.memId}"><br>
                <button type="submit" value="updatePw">送出修改</button>
            </form>
        </div>
    </div>



</body>


</html>