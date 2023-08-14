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
           .container {
               max-width: 800px;
               margin: 0 auto;
               padding: 20px;
               background-color: #ffffff;
               box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
           }
           h1 {
               color: #333;
           }
           ul {
               list-style: none;
               padding-left: 0;
           }
           li {
               margin-bottom: 10px;
           }
           img {
               max-width: 100%;
               height: auto;
           }
           a {
               color: #007bff;
               text-decoration: none;
           }
       </style>
</head>
<body>
    <div class="container">
        <h1>新增成功！</h1>
        <p><%= message %></p>

       <% if (addedLat != null) { %>
               <ul>
                   <li>公告狀態：<%= addedLat.getAnnStatus() %></li>
                   <li>公告內容：<%= addedLat.getNewsContext() %></li>
                   <li>公告圖片：</li>
                <li><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(addedLat.getAnnPic()) %>" alt="公告圖片"></li>
               </ul>
           <% } %>

        <a href="addlat.jsp">返回</a>
    </div>
</body>
</html>
