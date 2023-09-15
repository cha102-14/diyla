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
            background-color:snow;
        }
        h4.member{
            margin-top:30px;
            margin-bottom:20px;
            font-weight:bold;
        }

        div.error {
            padding: 10px;
            background-color: #FCE5CD;
        }

        div.member {
            padding: 10px;
            font-size: 1rem;
            width: 400px;
            height: 400px;
            position: relative;
        }

        label.user {
            position: absolute;
            top: 95px;
            left: 95px;
            letter-spacing: 3px;
        }
        label.pw {
            position: absolute;
            top: 180px;
            left: 95px;
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
            padding: 0 8px 0 8px;
            width:220px;
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


        button.member {
            border-radius: 0.5rem;
            background-color: #B26021;
            color: #FCE5CD;
            border: 1px #B26021;
            width: 220px;
            height: 35px;
            letter-spacing: 3px;
            margin-top: 40px;
            font-size: 1rem;
        }
        button.member:hover {
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
         button.member:focus{
             outline: none;
         }
</head>
<body>
    <jsp:include page="../front_header.jsp"/>
    <div class="title">
        <h4 class="member">忘記密碼</h4>
        <c:if test="${not empty exMsgs}">
             <div style="color:red" class="error">
                  <c:forEach var="message" items="${exMsgs}">
                       ${message}
                  </c:forEach>
            </div>
        </c:if>
        <div class="member">
            請輸入您的Email帳號，系統將會寄送新密碼到您的Email信箱。<br><br>
                <label class="user">帳號</label><br>
                <input class="inputform" type="email" name="email" id="email" placeholder="請輸入信箱"  value="<%= (memVO==null)? "" : memVO.getMemEmail()%>"><br>
                <label class="pw">電話</label><br>
                <input class="inputform" type="tel" name="phonenumber" id="phonenumber" placeholder="請輸入註冊時填的手機"  value="<%= (memVO==null)? "" : memVO.getMemPhone()%>"><br>
                <input type="hidden" name="action" value="forgetPw">
                <button type="submit" value=""　id="sub" onclick="test()" class="member">送出重製密碼信件</button><br>
                <span id="response">若仍未收到請至<a href="${ctxPath}/contactus/contactus.jsp">聯絡我們</a></span>

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
            phonenumber: phonenumber.value,
            action: action.value
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