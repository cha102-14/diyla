<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.member.*"%>
<% MemVO memVO = (MemVO) request.getAttribute("memVO");%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>忘記密碼</title>

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
        <div class="updatePw">
            <form method="post" action="updatePw">
                <label>帳號</label><br>
                <input type="email" name="upemail" placeholder="請輸入信箱" id="mail" value="<%= (memVO==null)? "" : memVO.getMemEmail()%>"><br>
                <label>臨時密碼</label><br>
                <input type="password" name="temPw" placeholder="請輸入重置信件中的密碼" minlength="6" maxlength="12"><br>
                <label>新密碼</label><br>
                <input type="password" name="upPw" placeholder="請輸入6-12字(含英數字)" minlength="6" maxlength="12"><br>
                <label>重新確認密碼</label><br>
                <input type="password" name="upPwcheck" placeholder="再次輸入密碼" ></label><br>
                <input type="hidden" name="action" value="updatePw">
                <button type="submit" value="">修改密碼</button><br>
            </form>
        </div>
    </div>



</body>


</html>