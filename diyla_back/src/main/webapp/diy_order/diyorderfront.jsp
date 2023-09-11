<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>DIY管理後台首頁</title>

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
  
    <jsp:include page="../index.jsp" />
</div>
  <div class="center-div">
    <h1>DIY管理後台首頁</h1>
    <input type="hidden" class="uuu"  value="${uuu}">
    <ul>
      <form method="post" action="DiyOrderController">
         <input type="hidden" name="action" value="getAllOrder">
         <input type="submit" value="查詢所有訂單">  (已串DiyCate 差DATATABLE)
      </form>
      
      
      <li><a href='getodByPeriod_front.jsp'>時段參加會員及訂單(點名系統for現場管理員)</a><br><br></li>      

      
      
      <form method="post" action="DiyOrderController">
         <input type="hidden" name="action" value="getAllRefund">
         <input type="submit" value="查詢未退款完成訂單"> 
         <p style="color:red;font-weight: bold;">${errorMsgs.refundNot}</p>
      </form>
      
      <li>
        <form method="post" action="DiyOrderController">
          <b>輸入訂單編號 (如1):</b>
		<c:choose>
				<c:when test="${uuu == 404}">
					<input type="text" name="diyOrderNo" value="${diyorderNo} ">
				</c:when>
				<c:otherwise>
					<input type="text" name="diyOrderNo">
				</c:otherwise>
		</c:choose>	
          <input type="hidden" name="action" value="getOne_For_Display">
          <input type="submit" value="查詢單筆訂單資料">
          <p style="color:red;font-weight: bold;">${errorMsgs.diyOrderNo}${errorMsgs.diyOrderVO}</p>
        </form>
      </li>
      
      <li>
        <form method="post" action="DiyOrderController">
          <b>輸入會員編號 (如1):</b>
          <c:choose>
				<c:when test="${uuu == 405}">
					<input type="text" name="memId" value="">
				</c:when>
				<c:otherwise>
					<input type="text" name="memId">
				</c:otherwise>
		</c:choose>		
          
          <input type="hidden" name="action" value="getOneMemId_For_Display">
          <input type="submit" value="查詢該會員所有訂單資料">
          <p style="color:red;font-weight: bold;">${errorMsgs.memId}${errorMsgs.diyOrderList}</p>
        </form>
      </li>
      
      
    </ul>
  </div>
  
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">


window.onload=function(){
	 const uuu = document.querySelector('.uuu');
	 if(uuu.value === '40'){
		  swal('請更正以下資訊','${errorMsgs.diyOrderVO1}' , 'error');
	 }	 	 
}


</script>
  
  
  
  
</body>
</html>
