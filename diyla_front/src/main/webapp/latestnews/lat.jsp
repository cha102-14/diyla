<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>

<%
     LatService latSvc = new LatService();
        List<LatestnewsVO> list = latSvc.getAll();
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
<title>員工資料 - listOneEmp.jsp</title>
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
        <th>公告編號</th>
        <th>公告內容</th>
        <th>公告圖片</th>

    </tr>
    <tr>
    <% List<LatestnewsVO> scvList = (List)pageContext.getAttribute("list"); %>
    <% if (scvList != null) { %>
        <% for (LatestnewsVO a : scvList) { %>
            <tr>
                <td><%= a.getNewsNo() %></td>
                <td><%= a.getNewsContext() %></td>
                <td>
                <hr style="border-color: #fce5cd" >
    		    <td><p id="show_img"><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(a.getAnnPic()) %>" alt="公告圖片"></p></td>
                </td>
            </tr>
        <% } %>
    <% } %>
    </tr>
</table>
<jsp:include page="/front_footer.jsp"/>


<script src="js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="js/custom.js"></script>

</body>

</html>