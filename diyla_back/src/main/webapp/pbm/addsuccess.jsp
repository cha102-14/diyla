<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.commonproblemmodel.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
           h1#addok {
               color: #333;
               font-size: 32px;
           }
           ul {
               list-style: none;
               padding-left: 0;
               margin: 20px;
               font-size: 24px;
           }
           li {
               margin-bottom: 10px;

           }
           img {
               max-width: 100%;
               height: auto;
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
<jsp:include page="/pbm/pbm_header.jsp" />
    <div class="container">
        <h1 id="addok">新增成功！</h1>

               <ul>
                   <li>問題分類：${addpbm.pbmSort}</li>
                   <li>問題標題：${addpbm.pbmTitle}</li>
                   <li>問題內容：${addpbm.pbmContext}</li>
               </ul>
        <br>
        <a class="a_addsuccess" href="addpbm.jsp">返回</a>
        <a class="a_addsuccess" href="pbmall.jsp">返回全部常見問題</a>
    </div>
</body>
</html>
