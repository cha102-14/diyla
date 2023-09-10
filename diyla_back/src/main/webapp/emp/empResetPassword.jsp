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
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>

    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>


</head>
<body>

    <div class="title">
        <h4>重新設定密碼</h4>
        <div class="">
            <form method="post" action="validCode">
                <label>驗證碼<br>
                <input required type="text" id="valid" name="valid" placeholder="請輸入驗證碼" ></label><br>
                <!-- Email一起帶入做比對? 將驗證碼傳入Controller 調用Service方法至Jedis比對驗證碼 比對成功後將新empPassword寫入DB -->
                <label>修改密碼<br>
                <input required type="password" name="empPassword" placeholder="請輸入6-12字碼英數字"  minlength="6" maxlength="12" ></label><br>
                <label>確認密碼<br>
                <input type="password" name="doubleCheckPassword" placeholder="再次輸入密碼" minlength="6" maxlength="12"></label><br>
                <span  id ="doubleCheck.errors" class="error">${errorMsgMap.empPassword}</span>
                <button required type="submit" value="resetPassword">確認送出</button>
            </form>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>

    window.onload(checkFail());
    function checkFail (){
        // 1. 檢查2次輸入密碼是否一致   
        checkPassword();
        // 2. 檢查驗證碼是否和後端一致
        checkValidCode();
    }

    function checkPassword(){
        if("${password}" != ""){
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