<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>Insert title here</title>

<style>
/* 將 body 設置為 flex 容器，水平置中 */


/* 使用 flex 排列兩個 div */
/* .flex-container { */
/*   display: flex; */
/* } */
body{
/* margin-left : 300px; */
border : 1px solid red;
height: 100%;
text-decoration:center;
line-height:50px;
}


/* 第二個 div，固定寬度 */
.center-div {
float: right;
min-height: 600px;
min-width: calc(100% - 300px);
/* height: 150px; */
/*   width: 300px; */
   text-align: center;
/* padding: 200px 300px 20px 0px; */
}
</style>

</head>
<body>
<div class="flex-container">
  
    <jsp:include page="../backendpage.jsp" />
</div>
  <div class="center-div">
    <h1>DIY首頁</h1>
    <ul>
      <li><a href='getallorderlist.jsp'>查詢所有訂單</a><br><br></li>
      <li><a href='addorderlist.jsp'>新增訂單</a><br><br></li>
      <li>
        <form method="post" action="DiyOrderController">
          <b>輸入訂單編號 (如1):</b><input type="text" name="diyorderno">
          <input type="hidden" name="action" value="getOne_For_Display">
          <input type="submit" value="查詢單筆資料">
        </form>
      </li>
    </ul>
  </div>
</body>
</html>
