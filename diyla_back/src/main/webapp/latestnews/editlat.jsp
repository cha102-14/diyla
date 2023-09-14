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
            <textarea name="newsContext" id="newsContext" required="required"><%= latVO.getNewsContext() %></textarea><br>

            <label for="newsPic">公告圖片：</label>
                <input id="addimg" type="file" name="annPic" accept="image/*" onchange="preImg()">
            <div id="imagePreview">
                <img id="oldimg" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(latVO.getAnnPic()) %>"
                    alt="公告圖片">
            </div>

            <label for="annStatus">公告狀態：</label>
            <select name="annStatus" id="annStatus">
                <option value="1" <%=(latVO.getAnnStatus()==1) ? "selected" : "" %>>上架</option>
                <option value="0" <%=(latVO.getAnnStatus()==0) ? "selected" : "" %>>下架</option>
            </select><br>

            <button type="submit">更新</button>
        </form>
    </div>

</body>
<script>
    function preImg() {
        const preDiv = document.querySelector("#imagePreview");
        const addimg = document.querySelector("#addimg");
        const oldimg = document.querySelector("#oldimg");

        if (addimg.files && addimg.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = document.createElement("img");
                img.src = e.target.result;
                img.style.maxWidth = "100%";
                img.style.height = "auto";
                preDiv.innerHTML = "";
                preDiv.appendChild(img);
            };
            reader.readAsDataURL(addimg.files[0]);
        } else {
                preDiv.innerHTML = "";
        }
    }
</script>

</html>