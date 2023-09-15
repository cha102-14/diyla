<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.empmodel.*" %>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page isELIgnored="false" %>


<%  EmpVO empVO=(EmpVO)   request.getAttribute("empVO"); %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>設定密碼</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css"/>

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

        div.reset {
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
            letter-spacing: 4px;
            padding: 40px;
            margin:50px 0;
        }
        h4{
            font-family: "微軟正黑體", Arial, sans-serif;
            font-size:30px;
            font-weight: bold;
            margin-top:30px;
            margin-bottom:15px
        }

        .inputtext{
            font-family: "微軟正黑體", Arial, sans-serif;
            text-align: center;
            font-size: 15px; /*文字大小*/
            border-radius: 10px;
            font-weight: bold;
        }

        .sendbutton{
            margin-top: 20px;
            width: 90px;
            height: 30px;
            border-width: 3px;
            border-radius: 10px;
            background-color: #A3816A;
            cursor: pointer;
            outline: none;
            font-family: "微軟正黑體", Arial, sans-serif;
            color: #F8F1F1;
            font-size: 16px;
            font-weight: bold;
        }
</style>
</head>
<body>

    <div class="reset">
        <h4>重新設定密碼</h4>
        <div class="">
            <form method="post" action="validCode">
                <label class="valid">驗證碼<br>
                <br>   
                <input class="inputtext" required type="text" id="valid" name="valid" placeholder="請輸入驗證碼" ></label><br>
                <br>
                <!-- Email一起帶入做比對? 將驗證碼傳入Controller 調用Service方法至Jedis比對驗證碼 比對成功後將新empPassword寫入DB -->
                <label class="reset">修改密碼<br>
                <br>
                <input class="inputtext" required type="password" name="empPassword" placeholder="請輸入6-12字碼英數字"  minlength="6" maxlength="12" ></label><br>
                <br>
                <label class="check">確認密碼<br>
                <br>  
                <input class="inputtext" type="password" name="doubleCheckPassword" placeholder="再次輸入密碼" minlength="6" maxlength="12"></label><br>
                <br>
                <!-- <span  id ="doubleCheck.errors" class="error">${errorMsgMap.empPassword}</span> -->
                <button class="sendbutton" required type="submit" value="resetPassword">送出</button>
            </form>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
// 1. 前端輸入資料後送至後端
// 2. Filter 驗證加密前的密碼是否為空及是否相符
// 3. 將密碼寫入DB
// 4. 寫入成功 返回前端提示訊息並跳轉
// 5. 寫入失敗 返回前端提示訊息


    window.onload(checkFail());
    function checkFail (){
        // 1. 檢查2次輸入密碼是否一致
        checkPassword();
        // 2. 檢查驗證碼是否和後端一致
        checkValidCode();
    }

    function checkPassword(){
        if("${password}" != "" ){
            // console.log(${password})
            Swal.fire('密碼不相符,請重新確認密碼！');
        }
    }

    function checkValidCode(){
        if("${validcode}" != ""){
            Swal.fire('驗證碼不相符,請重新確認！');
        }        
    }

</script>
</body>


</html>