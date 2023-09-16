<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<%@ page import="java.util.Base64"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    LatestnewsVO addedLat = (LatestnewsVO) request.getAttribute("addedLat");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Success</title>
    <link rel="stylesheet" href="../css/style.css">
   <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.addokcontainer {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1#addok {
    color: #333;
    font-size: 32px;
}

ul {
    list-style: none;
    padding-left: 0;
    font-size: 26px;
    padding: 20px;
}

li {
    margin-bottom: 20px;
}

img {
   max-width: 100%;
   max-height: 600px;
}

a.a_addsuccess {
    color: #007bff;
    text-decoration: none;
    padding: 10px;
    margin:30px;
}

</style>
</head>
<body>
<jsp:include page="/index.jsp" />
<jsp:include page="/latestnews/lat_header.jsp" />
    <div class="addokcontainer">
        <h1 id="addok">新增成功！</h1>
       <% if (addedLat != null) { %>
               <ul>
                <c:choose>
                    <c:when test="<%= addedLat.getAnnStatus() == 0 %>">
                        <li>公告狀態：下架</li>
                    </c:when>
                    <c:otherwise>
                        <li>公告狀態：上架</li>
                    </c:otherwise>
                </c:choose>
                   <li>公告內容：<%= addedLat.getNewsContext() %></li>
                   <li>公告圖片：</li>
                <li><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(addedLat.getAnnPic()) %>" alt="沒有新增圖片"></li>
               </ul>
           <% } %>
        <br>
        <a class="a_addsuccess" href="addlat.jsp">返回</a>
        <a class="a_addsuccess" href="latall.jsp">返回全部最新消息</a>
    </div>
</body>
</html>