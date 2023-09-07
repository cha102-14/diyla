<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page isELIgnored="false"%>


<%
Integer memId = (Integer)session.getAttribute("memId");
MemberService memSvc = new MemberService();
MemVO memVO =  memSvc.selectMem(memId);
pageContext.setAttribute("memVO", memVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單管理首頁(已接會員session)</title>
</head>
<body>
<jsp:include page="/front_header.jsp"></jsp:include>
--會員編號:${memId}-- 
<br> 
--您好，${memVO.memName}--
<input type="hidden" class="aaa" id="aaa" value="${aaa}">
<!--     ================================================================= -->
		<form method="post" action="DiyOrderFrontController">  
          <input type="hidden" name="memId" value="${memId}">
          <input type="hidden" name="action" value="getAllOrderByMemId_front">
          <input type="submit" value="所有訂單狀態">缺datatable
        </form>
<!--     ================================================================= --> 
        <form method="post" action="DiyOrderFrontController">
          <input type="hidden" name="memId" value="${memId}">
          <input type="hidden" name="action" value="getAllDeleteByMemId_front">
          <input type="submit" value="退款訂單狀態查詢">done
        </form>
<!--     ================================================================= -->        
        <form method="post" action="DiyOrderFrontController">
        
        
        <br> 
		<label for="diyReserveDate">選擇預約日期：</label> 
		<input type="date" id="diyReserveDate" name="diyReserveDate"> 
		
		<br>
		
		<label for="diyPeriod">預約時段: </label> 
		<select name="diyPeriod" id="diyPeriod">
			<option value="0">上午</option>
			<option value="1">下午</option>
			<option value="2">晚上</option>
		</select> 
		<br>
        
        
          <input type="hidden" name="memId" value="${memId}">
          <input type="hidden" name="action" value="getMemIdOrderByPeriod">
          <input type="submit" value="時段訂單">  done
        </form>
        
        <span><a href="${ctxPath}/diyCate/diyCateList">去DIY項目總攬</a> </span>
        
<!--     ================================================================= -->
<jsp:include page="/front_footer.jsp" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

<!--====================================================監聽有無更改、取消訂單、錯誤驗證錯訊====================================================== -->
window.onload=function(){
	 const aaa = document.querySelector('#aaa');
	 if(aaa.value === '404'){
		   swal('${errorMsgs.diyReserveDateNull}','${errorMsgs.diyReserveDateNull}後重新點擊 ！ ' , 'error')
		    }
	   }



</script>
</body>
</html>