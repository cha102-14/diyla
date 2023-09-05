<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <meta charset="UTF-8">
  <meta name="viewport" content="initial-scale=1.0">
  <title>ADARI INSTITUTE</title>
  <style>
    * {
      margin: 0px;
      padding: 0px;
    }

    body,
    html {
      margin: 0px;
      padding: 0px;
    }

    .nav-nav {
      width: 100%;
      background-color: peachpuff;
      border: 0px;
      display: flex;
      list-style-type: none;
    }

    .nav-nav li {
      height: 2.5em; /* 固定高度为2.5倍字体高度 */
      width: 33.33%;
      color: brown;
      font-family: 'Poppins', sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: 1.25s ease-in-out;
      position: relative;
      font-size: 1.2em; /* 调整字体大小 */
    }

    .nav-nav li a {
      text-decoration: none;
      color: brown;
    }

    .nav-nav li .circle {
      height: 1.5em; /* 调整圆圈大小 */
      width: 1.5em; /* 调整圆圈大小 */
      background-color: gold;
      position: absolute;
      border-radius: 50%;
      opacity: 0;
      transition: 0.95s ease-in-out;
      top: 0;
    }

    .nav-nav li p {
      cursor: pointer;
      transition: 1s ease-in-out;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    .nav-nav li span {
      cursor: pointer;
      z-index: 10;
      transition: 1s ease-in-out;
      opacity: 0;
      position: absolute;
      top: 70%;
      left: 50%;
      transform: translateX(-50%);
    }

    li:hover span {
      opacity: 1;
      cursor: pointer;
      margin-top: 0;
    }

    li:hover .circle {
      opacity: 100;
      margin-top: 0;
    }

    li:hover.three {
      background-color: white;
    }

    li:hover.two {
      background-color: white;
    }

    li:hover.one {
      background-color: white;
    }
  </style>
</head>

<body>
  <ul class="nav-nav" id="customNavBar">
    <li class="one"><a href="${ctxPath}/desertcourse/findclasslist.jsp">課程列表</a></li>
    <li class="two"><a href="${ctxPath}/desertcourse/findclasscalendar.jsp">課程日曆表</a></li>
    <li class="three"><a href="${ctxPath}/desertcourse/findteacher.jsp">師傅列表</a></li>
  </ul>
</body>

</html>
