<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.commonproblemmodel.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

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

               <ul>
                   <li>問題分類：${addpbm.pbmSort}</li>
                   <li>問題標題：${addpbm.pbmTitle}</li>
                   <li>問題內容：${addpbm.pbmContext}</li>
               </ul>

        <a href="addpbm.jsp">返回</a>
        <a href="pbmall.jsp">返回全部常見問題</a>
    </div>
</body>
</html>
