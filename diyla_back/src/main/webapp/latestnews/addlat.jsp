<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<jsp:include page="/index.jsp" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f5deb3;
        }

        h1#addh1 {
            background-color: #f39c12;
            color: white;
            border-radius: 5px;
            padding: 10px;
            text-align: center;
            margin:  0;
            font-size: 32px;
        }

        table#addlatTable {
            height: 600px;
            background-color: #fff8dc;
            border-radius: 10px;
            padding: 20px;
            margin: 0;
        }

        td.td1 {
            font-size: 20px;
            color: #e74c3c;
            min-width: 20%;
            padding: 10px 15px 10px 20px;
            text-align: right;
        }

        td.td2 {
            width: 1vw-(20%);
        }

        #text {
            width: 90%;
            height: 60px;
            border: 2px solid #e74c3c;
            border-radius: 5px;
            padding: 5px;
        }

        #submit {
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #submit:hover {
            background-color: #c0392b;
        }

        #imagePreview {
            width: 300px;
            height: auto;
            margin-top: 10px;
            border: 2px solid #e74c3c;
            border-radius: 5px;
            padding: 10px;
            background-color: #fff;
            text-align: center;
        }

        #imagePreview img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        #addform {
          display: flex;
          flex-direction: column;
          align-items: center;
          margin: 0 auto;
          max-width: 600px;
          padding: 20px;
          background-color: #fff8dc;
          border-radius: 10px;
          box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>
    <jsp:include page="/latestnews/lat_header.jsp" />
    <h1 id="addh1">新增最新公告</h1>
    <FORM id="addform" METHOD="post" ACTION="latServlet" enctype="multipart/form-data" name="form1">
        <table id="addlatTable">
            <tr>
                <td class="td1">公告狀態:</td>
                <td class="td2">
                    <select name="annStatus">
                        <option value="1">上架</option>
                        <option value="0">下架</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="td1">公告內容:</td>
                <td class="td2"> <input id="text" type="text" name="newsContext"> </td>
            </tr>
            <tr>
                <td class="td1">公告圖片:</td>
                <td class="td2"> <input id="addimg" type="file" name="annPic" accept="image/*" onchange="preImg()">
                    <div id="imagePreview"></div>
                </td>
            </tr>
        </table>
        <input type="hidden" name="action" value="lat_insert">
        <input id="submit" type="submit" value="送出新增">
    </FORM>

    <script>
        function preImg() {
            const preDiv = document.querySelector("#imagePreview");
            const addimg = document.querySelector("#addimg");

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
</body>

</html>