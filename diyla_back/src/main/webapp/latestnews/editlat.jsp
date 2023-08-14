<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<%@ page import="java.util.Base64"%>
<jsp:include page="/index.jsp"/>
<%
    LatestnewsVO latVO = (LatestnewsVO) request.getAttribute("latVO");
%>

<!DOCTYPE html>
<html>
<head>
    <title>編輯公告</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
    body{
    margin-left:300px
    }
    </style>
</head>
<body bgcolor='white'>

<div class="container">
    <h2>編輯公告</h2>
    <form method="post" action="latServlet" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update_latnews">
        <input type="hidden" name="newsNo" value="<%= latVO.getNewsNo() %>">

        <label for="newsContext">公告內容：</label>
        <textarea name="newsContext" id="newsContext"><%= latVO.getNewsContext() %></textarea><br>

        <label for="newsPic">公告圖片：</label>
        <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(latVO.getAnnPic()) %>" alt="公告圖片">
        <input type="file" name="annPic" accept="image/*">

        <label for="annStatus">公告狀態：</label>
        <select name="annStatus" id="annStatus">
            <option value="1" <%= (latVO.getAnnStatus() == 1) ? "selected" : "" %>>上架</option>
            <option value="0" <%= (latVO.getAnnStatus() == 0) ? "selected" : "" %>>下架</option>
        </select><br>

        <button type="submit">更新</button>
    </form>
</div>

</body>
</html>
