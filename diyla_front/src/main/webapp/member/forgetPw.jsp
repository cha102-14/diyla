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
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

</head>
<body>
    <jsp:include page="../front_header.jsp"/>
    <div class="title">
        <h4>忘記密碼</h4>
        <c:if test="${not empty exMsgs}">
             <div style="color:red" class="error">
                  <c:forEach var="message" items="${exMsgs}">
                       ${message}
                  </c:forEach>
            </div>
        </c:if>
        <div class="forget">
            請輸入您的Email帳號，系統將會寄送新密碼到您的Email信箱。
                <label>帳號</label><br>
                <input type="email" name="email" id="email" placeholder="請輸入信箱"  value="<%= (memVO==null)? "" : memVO.getMemEmail()%>"><br>
                <label>電話</label><br>
                <input type="tel" name="phonenumber" id="phonenumber" placeholder="請輸入註冊時填的手機號碼"  value="<%= (memVO==null)? "" : memVO.getMemPhone()%>"><br>
                <input type="hidden" name="action" value="forgetPw">
                <button type="submit" value=""　id="sub" onclick="test()">送出重製密碼信件</button><br>
                <span id="response">若仍未收到請至聯絡我們</span>
        </div>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script>
        var email = document.getElementById('email');
        var phonenumber = document.getElementById('phonenumber');
        var sub = document.getElementById('sub');


        function test(){

            var obj ={
            email: email.value,
            phonenumber: phonenumber.value
            }
            let formDataUrlEncoded = new URLSearchParams();
            for (let key in obj){
            formDataUrlEncoded.append(key,obj[key])
            }

            fetch("updatePw",{
            method:"post",
            headers:{
                "content-type": "application/json"
            },
            body:JSON.stringify(obj)
            }).then(function(response){
            console.log(response);
                return response.text();
            }).then(function(data){
                if(data.indexOf("success") === 0){
                    Swal.fire('發信成功！');
                } else {
                    Swal.fire('請重新輸入');
                }
            })
            .catch(function(error){
                console.log("error");
            })


        }






        </script>

</body>

</html>