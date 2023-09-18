<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.commonproblemmodel.*"%>
<jsp:include page="/index.jsp"/>
<%@ page isELIgnored="false" %>
<%
    PbmVO pbmVO = (PbmVO) request.getAttribute("pbmVO");
%>

<!DOCTYPE html>
<html>
<head>
    <title>編輯常見問題</title>
    <link rel="stylesheet" href="${ctxPath}/css/style.css">
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

  h2#pbm_edit {
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
<jsp:include page="/pbm/pbm_header.jsp" />
<div class="container">
    <h2 id="pbm_edit">編輯公告</h2>
    <form method="post" action="PbmController">
        <input type="hidden" name="action" value="update_pbm">
        <input type="hidden" name="pbmNo" value="${pbmVO.pbmNo}">

        <label for="pbmTitle">問題標題：</label>
        <textarea name="pbmTitle" id="pbmTitle" required="required">${pbmVO.pbmTitle}</textarea><br>

        <label for="pbmContext">問題內容：</label>
        <textarea name="pbmContext" id="pbmContext" required="required">${pbmVO.pbmContext}</textarea><br>



        <label for="pbmSort">問題分類：</label>
        <select name="pbmSort" id="pbmSort">
            <option value="0" ${pbmVO.pbmSort== 0 ? "selected" : ""}>課程</option>
            <option value="1" ${pbmVO.pbmSort== 1 ? "selected" : ""}>DIY</option>
            <option value="2" ${pbmVO.pbmSort== 2 ? "selected" : ""}>商店</option>
            <option value="3" ${pbmVO.pbmSort== 3 ? "selected" : ""}>其他</option>
        </select><br>

        <button type="submit">更新</button>
    </form>
</div>

</body>
</html>
