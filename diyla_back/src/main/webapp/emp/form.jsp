<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.jsp"/>
<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<link rel="stylesheet" href="../css/style.css">
<TITLE>form1.jsp</TITLE>
<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>
</HEAD>
<BODY>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
         <!--ACTION送資料到指定路徑-->
<FORM METHOD="get" ACTION="empFun">

    請輸入員工編號 :
    <INPUT TYPE="TEXT" NAME="id" VALUE="">
    <INPUT TYPE="HIDDEN" NAME="action" VALUE="getOne">
    <INPUT TYPE="SUBMIT">
 </FORM>




</BODY>
</HTML>
