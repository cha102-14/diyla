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
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    margin-left: 300px;
  }

  .container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  h2#lat_edit {
    font-size: 32px;
  }

  form {
    margin-top: 20px;
  }

  label {
    font-weight: bold;
  }

  textarea {
    width: 100%;
    height: 200px;
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
  }

  img {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
  }

  select {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    margin-bottom: 10px;
  }

  button[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  button[type="submit"]:hover {
    background-color: #0056b3;
  }

    </style>
</head>
<body bgcolor='white'>
<jsp:include page="/latestnews/lat_header.jsp" />
<div class="container">
    <h2 id="lat_edit">編輯公告</h2>
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
