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
<title>會員登入</title>

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
        * {
            box-sizing: border-box;
            font-family:"jf open 粉圓 1.1";

        }

        body {
            margin: 0;
        }

        div.title {
            border: 1px solid #B26021;
            text-align: center;
            width: 400px;
            color: #B26021;
            position: relative;
            top:50%;
            left:50%;
            transform: translateX(-50%);
            border-radius: 5px;
            letter-spacing: 3px;
            margin:50px 0;
        }
        h4{
            margin-top:30px;
            margin-bottom:20px
        }

        div.error {
            padding: 10px;
            background-color: #FCE5CD;
        }

        div.login {
            padding: 10px;
            font-size: 1rem;
            width: 400px;
            height: 400px;
            position: relative;
        }

        label.user {
            position: absolute;
            top: 22px;
            left: 100px;
            letter-spacing: 3px;
        }
        label.pw {
            position: absolute;
            top: 110px;
            left: 100px;
            letter-spacing: 3px;
        }

        input.inputform {
            border: 1px solid #B26021;
            margin: 15px;
            border-radius: 0.5rem;
            font-size: 1rem;
            color: #B26021;
            height: 35px;
            letter-spacing: 1px;
        }
        input.inputform:focus {
              outline: 1.5px solid #B26021;
              box-shadow: 2px;
        }

        /* 移除瀏覽器預設藍色背景 */
        input.inputform:-webkit-autofill,
        input.inputform:-webkit-autofill:focus {
               -webkit-box-shadow: 0 0 0 30px white inset;
               -webkit-text-fill-color:#B26021;
        }


        label.remember {
               font-size: 0.85rem;
               text-align: center;
               position: absolute;
               top: 190px;
               left: 103px;
               letter-spacing: 1px;

        }

        button {
            border-radius: 0.5rem;
            background-color: #B26021;
            color: #FCE5CD;
            border: 1px #B26021;
            width: 199.33px;
            height: 35px;
            letter-spacing: 3px;
            margin-top: 40px;
            font-size: 1rem;
        }
        button:hover {
            background-color: #FCE5CD;
            color:  #B26021;
            transition: all 0.3s;
        }


        p {
            margin-top: 5px;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            font-size: 0.9rem;
        }

        a:hover {
            text-decoration: underline;
            font-size: 1rem;
            color: #B26021;
        }
    </style>
>>>>>>> member
</head>
<body>

	<jsp:include page="../front_header.jsp"/>
<<<<<<< HEAD
	<h4>會員登入</h4>
	<div>
    <c:if test="${not empty exMsgs}">
        <div style="color:red">
        <c:forEach var="message" items="${exMsgs}">
        ${message}
        </c:forEach>
        </div>
    </c:if>
	<form method="post" action="login">
		<label>請輸入帳號：</label>
		<input type="email" name="user" placeholder="請輸入信箱"><br>
		<label>請輸入密碼：</label>
		<input type="password" name="password" placeholder="請輸入6-12字(含英數字)"><br>
		<button type="submit" value="login">登入</button>
		<button type="button">前往註冊</button><br>
		<a href="">忘記密碼

	</form>
    </div>

	<jsp:include page="../front_footer.jsp"/>
=======
    <div class="title">
        <h4>會員登入</h4>
        <c:if test="${not empty exMsgs}">
            <div style="color:red" class="error">
                <c:forEach var="message" items="${exMsgs}">
                    ${message}
                </c:forEach>
            </div>
        </c:if>
        <div class="login">
            <form method="post" action="login">
                <label class="user">帳號</label><br>
                <input type="email" name="user" placeholder="請輸入信箱" class="inputform"><br>
                <label class="pw">密碼</label><br>
                <input type="password" name="password" placeholder="請輸入6-12字(含英數字)" minlength="6" maxlength="12"
                    class="inputform"><br>
                <label for="remember" class="remember">
                    <input type="checkbox" class="remember" name="remember" style="vertical-align:middle;">
                    <span style="vertical-align:middle;">記住我</span><br>
                </label>
                <button type="submit" value="login">登入</button><br>
                <br>
                <p>or</p>
                <a href="" class="forget">忘記密碼</a>
                <span>|</span>
                <a href="" class="reg">前往註冊</a><br>

            </form>
        </div>
    </div>



>>>>>>> member
</body>
</html>