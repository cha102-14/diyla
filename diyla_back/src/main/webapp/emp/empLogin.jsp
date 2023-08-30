<!--刷淡背景圖-->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.empmodel.*" %>
<%  EmpVO empVO=(EmpVO)   request.getAttribute("empVO");
%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>管理員登入</title>

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

        div.loginTitle {
            font-family: "微軟正黑體", Arial, sans-serif;
            font-weight: bold;
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
        h5{
            font-family: "微軟正黑體", Arial, sans-serif;
            font-size:20px;
            font-weight: bold;
            margin-top:30px;
            margin-bottom:15px
        }

        div.error {
            padding: 10px;
            background-color: #FCE5CD;
        }

        div.backStageLogin {
            padding: 10px;
            font-size: 1rem;
            width: 400px;
            height: 400px;
            position: relative;
        }

        label.empAccount {
            position: absolute;
            top: 22px;
            left: 100px;
            letter-spacing: 3px;
        }
        label.password {
            position: absolute;
            top: 110px;
            left: 100px;
            letter-spacing: 3px;
        }

        input.inputLogin {
            border: 1px solid #B26021;
            margin: 15px;
            border-radius: 0.5rem;
            font-size: 1rem;
            color: #B26021;
            height: 35px;
            letter-spacing: 1px;
        }
        input.inputLogin:focus {
              outline: 1.5px solid #B26021;
              box-shadow: 2px;
        }

        /* 移除瀏覽器預設藍色背景 */
        input.inputLogin:-webkit-autofill,
        input.inputLogin:-webkit-autofill:focus {
               -webkit-box-shadow: 0 0 0 30px white inset;
               -webkit-text-fill-color:#B26021;
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

</head>
<body>


    <div class="loginTitle">
        <h5>員工登入</h5>
        <span class="error">${loginErrorMsgMap.errorMsg}</span>
        <div class="backStageLogin">
            <form method="post" action="login">
                <label class="empAccount">員工帳號</label><br>
                <input type="text" class="inputLogin" name="empAccount" placeholder="請輸入員工帳號" value="${(empVO==null)?"":empVO.empAccount()}"}><br>
                <label class="password">密碼</label><br>
                <input type="password" class="inputLogin" name="empPassword" placeholder="請輸入6-12碼英數字"minlength="6" maxlength="12">
                <br>
                </label>
                <button type="submit">登入</button><br>
                <br>
                <a href="${ctxPath}/emp/empForgetPassword.jsp" class="forgetPassword">忘記密碼</a>

            </form>
        </div>
    </div>




</body>
</html>