<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page import="java.util.*"%>

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
<title>修改密碼</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>

    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-straight/css/uicons-thin-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <style>
        * {
            box-sizing: border-box;
            font-family:"jf open 粉圓 1.1";

        }
        body {
            margin: 0;
        }
        div.title {
            width: 800px;
            height: 700px;
            color: #B26021;
            position: relative;
            top:50%;
            left:50%;
            transform: translateX(-50%);
            letter-spacing: 3px;
            margin:50px 0;
            display:flex;
        }
        aside{
            width: 200px;
            border: 1px solid #B26021;
            margin-right:1.5rem;
            border-radius: 6px;
            background-color:snow;
        }
        h4.member{
            margin-top:30px;
            margin-bottom:20px;
            font-weight:bold;
        }
        span.error {
            color:red;
            font-weight:bold;
        }
        div.member {
            border: 1px solid #B26021;
            flex:1;
            padding: 10px 10px 10px 1.5rem;
            font-size: 1rem;
            width: 400px;
            height: 700px;
            position: relative;
            border-radius: 6px;
            background-color:snow;
        }
        input.inputform,input.read {
            border: 1px solid #B26021;
            border-radius: 0.3rem;
            font-size: 1rem;
            color: #B26021;
            height: 35px;
            letter-spacing: 1px;
            padding: 0 8px;
            margin-top:5px;
            width:220px;
        }
        input.inputform:focus {
              outline: 1.5px solid #B26021;
              box-shadow: 2px;
        }
        select {
            border: 1px solid #B26021;
            border-radius: 0.3rem;
            font-size: 1rem;
            color: #B26021;
            height: 35px;
            letter-spacing: 1px;
            padding: 0 25px 0 8px;
            margin-top:5px;

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
            position:relative;
            left:58%;
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
        aside > ul{
            margin-top:2rem;
            padding-left:0
        }
        aside > ul >li{
            margin-bottom:1rem;
            list-style:none;
            padding:1rem;
            position:relative;
            width:198px;
            display:block;
        }
        aside > ul >li:hover {

            background:#F1F1F1;
        }
        aside > ul >li>a {
            display:block;
            text-decoration: none;
            color:#B26021;
            width:100%;
            height:100%;
        }
        aside > ul >li>a:hover {
            text-decoration: none;
            color:#B26021;
        }
        i{
            padding-right:0.3rem;
        }
        form > div{
            display:inline-block;
        }
        div.gender{
            position:relative;
            left:25%;
            vertical-align:top;
            line-height: 2.1rem;
        }
        input#address{
            width:283px;
        }
        input[type="radio"]{
            margin-right: 10px;
        }
        input#f{
            margin-left: 40px;
        }
        #a1::before {
            content: "";
            position: absolute;
            top:7px;
            left:0px;
            height: 40px;
            width: 4px;
            background-color: #B26021;
        }
        #a1{
            font-weight:bold;
        }
       input.read{
            background-color:rgba(239, 239, 239, 0.3);
        }
        input.read:focus{
            background-color:rgba(239, 239, 239, 0.3);
            outline:none;
        }
        .success{
            position:absolute;
            right:80px;
            margin-top:5px;
        }
         button.member:focus{
             outline: none;
         }
        </style>

</head>
<body>

    <jsp:include page="../front_header.jsp"/>
    <div class="title">
        <aside>
        <ul>
            <li><a  href="${ctxPath}/member/update?action=select&memId=${memId}"><i class="fi fi-ts-user-gear"></i>會員資訊管理</a></li>
            <li><a  id="a1" href="${ctxPath}/member/updatePw.jsp"><i class="fi fi-tr-key-skeleton-left-right"></i>修改密碼</a></li>
            <li><a  href="${ctxPath}/allOrder/allOrder?memId=${memId}"><i class="fi fi-ts-ballot"></i>我的訂單</a></li>
            <li><a  href="${ctxPath}/track/track?memId=${memId}"><i class="fi fi-tr-hand-love"></i>我的商品追蹤</a></li>
            <li><a  href="${ctxPath}/token/MyToken.jsp"><i class="fi fi-ts-piggy-bank"></i>我的代幣</a></li>
            <li><a  href="${ctxPath}/member/login?action=logout"><i class="fi fi-tr-hand-wave"></i>登出</a></li>
        </ul>
        </aside>
        <div class="member">
        <h4 class="member">修改密碼</h4>
            <form method="post" action="update" class="member">
                <br>
                <label>帳號<br>
                <input class="read" type="email" name="upemail" value="${memVO.memEmail}" readonly ></label><br>
                <br>
                <label>修改密碼<br>
                <input type="password" name="upPw" placeholder="請輸入6-12字(含英數字)"  minlength="6" maxlength="12" class="inputform"></label><br>
                <span  class="error">${exMap.password}<br/></span>
                <label>確認密碼<br>
                <input type="password" name="upPwcheck" placeholder="再次輸入密碼" class="inputform"></label><br>
                <span  class="error">${exMap.pwcheck}<br/></span>
                <input type="hidden" name="action" value="updatePw">
                <button type="submit" value="updatePw" class="member">送出修改</button><br>
                <div class="success">${successMap.successMap}</div>
            </form>
        </div>
    </div>



</body>


</html>