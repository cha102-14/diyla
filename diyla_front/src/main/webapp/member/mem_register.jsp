<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>註冊會員</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
    
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>
    
    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>
    <style>

    </style>


</head>
<body>

	<jsp:include page="../front_header.jsp"/>
	<h4>會員註冊</h4>
	<div>
    <c:if test="${not empty exMsgs}">
        <div style="color:red">
        <c:forEach var="message" items="${exMsgs}">
        ${message}
        </c:forEach>
        </div>
    </c:if>
            <form method="post" action="register">
                <label>姓名<br>
                <input type="text" name="newName"></label><br>
                <label>帳號<br>
                <input type="email" name="user" placeholder="請輸入信箱"></label><br>
                <label>密碼<br>
                <input type="password" name="password" placeholder="請輸入6-12字(含英數字)"  minlength="6" maxlength="12"></label><br>
                <label>確認密碼<br>
                <input type="password" name="pwcheck" placeholder="再次輸入密碼" ></label><br>
                <label for="gender" required="required">性別
                <input type="radio" name="gender" value="0" >男
                <input type="radio" name="gender" value="1" >女</label><br>
                <label >生日
                <input type="date" name="birthday" id="birthday" max=""></label><br>
                <label>聯絡電話<br>
                <input type="tel" name="phone" minlength="10" ></label><br>
                <label>聯絡地址</label><br>
                <input type="text" name="address" ><br>
                <label for="agree" class="agree">
                    <input type="checkbox" class="agree" name="agree" style="vertical-align:middle;"  required="required">
                    <span style="vertical-align:middle;">我同意DIYLA使用者條款和隱私權政策</span><br>
                </label><br>
                <label for="notice" class="notice">
                    <input type="checkbox" class="notice" name="notice" style="vertical-align:middle;">
                    <span style="vertical-align:middle;">我想收到DIYLA的最新消息和活動優惠</span><br>
                </label><br>
                <button type="submit" value="register">註冊</button>
            <!-- 滑到最底下才能打勾 or 另跳頁面-->
            <!-- 地址要選擇區郵遞區號 -->
            </form>
    </div>
    <script>

        window.addEventListener("load",function(){
            let today = new Date().toISOString().split('T')[0];
            document.getElementById('birthday').setAttribute('max',today);
        })

    </script>
	<jsp:include page="../front_footer.jsp"/>
</body>
</html>