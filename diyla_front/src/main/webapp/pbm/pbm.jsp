<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.commonproblemmodel.*"%>
<%@ page isELIgnored="false" %>


<%
    PbmService pbmSvc = new PbmService();
    List<PbmVO> list = pbmSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<style>
th{
 min-width : 100px;
}
td{
    text-align: center;
}
#show_img >  img{
    width: 360px;
}
</style>
<title>常見問題</title>
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
<body bgcolor='white'>
<jsp:include page="/front_header.jsp"/>
<table>
    <tr>
        <th>問題分類</th>
        <th>常見問題標題</th>
        <th>常見問題內容</th>

    </tr>
    	<c:forEach var="pbmVO" items="${list}" >
    <tr>
        <c:choose>
            <c:when test="${pbmVO.pbmSort == 0}"><td>課程</td></c:when>
            <c:when test="${pbmVO.pbmSort == 1}"><td>DIY</td></c:when>
            <c:when test="${pbmVO.pbmSort == 2}"><td>商店</td></c:when>
            <c:otherwise><td>其他</td> </c:otherwise>
        </c:choose>
  		<td>${pbmVO.pbmTitle}</td>
  		<td>${pbmVO.pbmContext}</td>
    </tr>
        </c:forEach>
</table>
<%-- <jsp:include page="/front_footer.jsp"/> --%>


<script src="js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="js/custom.js"></script>

</body>

</html>