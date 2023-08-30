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

		<form method="post" action="DiyOrderFrontController">  
          <input type="hidden" name="memId" value="${memId}">
          <input type="hidden" name="action" value="getAllOrderByMemId_front">
          <input type="submit" value="查詢所有訂單狀態">done
        </form>
        
        <form method="post" action="DiyOrderFrontController">
          <input type="hidden" name="memId" value="${memId}">
          <input type="hidden" name="action" value="getAllDeleteByMemId_front">
          <input type="submit" value="查詢所有取消訂單">done
        </form>
        
        <form method="post" action="DiyOrderFrontController">
          <input type="hidden" name="memId" value="${memId}">
          <input type="hidden" name="action" value="getOne_For_Display_front">
          <input type="submit" value="查詢所有訂單狀態">
        </form>
<jsp:include page="/front_footer.jsp" />
</body>
</html>