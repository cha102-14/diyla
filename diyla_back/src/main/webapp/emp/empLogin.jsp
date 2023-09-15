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
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>

    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
    <style>
        * {
            box-sizing: border-box;
            font-family:"jf open 粉圓 1.1";

        }

        body {
            margin: 0;
            background-image: url('../img/login.png'); /* 背景图像的URL，注意路径 */
            background-size: cover; /* 按照视口大小覆盖整个屏幕 */
            background-repeat: no-repeat; /* 不重复平铺背景图像 */
            background-attachment: fixed; /* 固定背景图像 */
            background-position: center center; /* 居中显示背景图像 */
        }

        div.loginTitle {
            font-family: "微軟正黑體", Arial, sans-serif;
            font-weight: bold;
            border: 2px solid #B26021;
            text-align: center;
            width: 400px;
            color: #B26021;
            position: relative;
            top:50%;
            left:50%;
            transform: translateX(-50%);
            border-radius: 25px;
            letter-spacing: 3px;
            margin:50px 0;
        }
        h5{
            font-family: "微軟正黑體", Arial, sans-serif;
            font-size:30px;
            font-weight: bold;
            margin-top:30px;
            margin-bottom:15px
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

        .error {
             color:red ;
             font-family: "微軟正黑體", Arial, sans-serif;
             font-weight: bold;
                             }
    </style>

</head>
<body>


    <div class="loginTitle">
        <h5>員工登入</h5>
        <!-- <label class="error">${errorMsgMap.empLoginError}</label> -->
        <div class="backStageLogin">
            <form method="post" action="login">
            <span>
                <label class="empAccount">員工帳號</label><br>
            <br>
                <!-- <label class="error">${errorMsgMap.empAccount}</label><br> -->
            </span>
                <input type="text" class="inputLogin" name="empAccount" placeholder="請輸入員工帳號" value="${(empVO==null)?"":empVO.empAccount()}"}><br>
            <div>
            
                <label class="password">密碼</label><br>
                <!-- <p class="error">${errorMsgMap.empPassword}</p> -->
                <input type="password" class="inputLogin" name="empPassword" placeholder="請輸入6-12碼英數字"minlength="6" maxlength="12">
            </div>
                <button type="submit">登入</button><br>
            <br>
                <a href="${ctxPath}/emp/empForgetPassword.jsp" class="forgetPassword">忘記密碼</a>

            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
        window.onload(checkIsLogin());
        function checkIsLogin(){
            if("${empId}" !== ""){
               location.href = "welcome.jsp";
            }else{
                checkNewPassword();
                checkTypeIsEmpty();
            }

        }


        function checkNewPassword(){
        if("${newPassword}" == "succes"){
            Swal.fire('更新成功！');
        }
    }

    function checkTypeIsEmpty(){
            if("${empAccount}" == "account" && "${empPassword}" == "password" ){
                Swal.fire('請輸入員工帳號及密碼 !');
            }else if("${empAccount}" == "account"){
                Swal.fire('請輸入員工帳號 !');
            }else if("${empPassword}" == "password"){
                Swal.fire('請輸入員工密碼 !');
            }
            checkEmpLoginInformation();

        }
        function checkempAccount(){
            if("${empAccount}" == "account"){
                Swal.fire('請輸入員工帳號 !');
            }
        }

        function checkempPassword(){
            if("${empPassword}" == "password"){
                Swal.fire('請輸入員工密碼 !');
            }
        }

        function checkEmpLoginInformation(){
            if("${empAccount}" == "false" && ("${empPassword}" == "false") ){
                Swal.fire('員工帳號密碼不匹配,請重新確認 !');
            }

        }


    </script>
</body>
</html>