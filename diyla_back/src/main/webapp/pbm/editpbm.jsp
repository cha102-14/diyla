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
    <form method="post" action="PbmController">
        <input type="hidden" name="action" value="update_pbm">
        <input type="hidden" name="pbmNo" value="${pbmVO.pbmNo}">

        <label for="pbmTitle">問題標題：</label>
        <textarea name="pbmTitle" id="pbmTitle">${pbmVO.pbmTitle}</textarea><br>

        <label for="pbmContext">問題內容：</label>
        <textarea name="pbmContext" id="pbmContext">${pbmVO.pbmContext}</textarea><br>



        <label for="pbmSort">問題分類：</label>
        <select name="pbmSort" id="pbmSort">
            <option value="0" ${pbmVO.pbmNo== 0 ? "selected" : ""}>課程</option>
            <option value="1" ${pbmVO.pbmNo== 1 ? "selected" : ""}>DIY</option>
            <option value="2" ${pbmVO.pbmNo== 2 ? "selected" : ""}>商店</option>
            <option value="3" ${pbmVO.pbmNo== 3 ? "selected" : ""}>其他</option>
        </select><br>

        <button type="submit">更新</button>
    </form>
</div>

</body>
</html>
