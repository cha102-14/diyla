<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            box-sizing: border-box;
        }
        .art_header {
            display: flex;
            height: 80px;
            text-align: justify;
            padding: 15px 10px;
            background-color: #fce5cd;
            color: #b45f06;
            align-items: center;
            align: center;
        }

        .art_header h1 {
            font-size: 20px;
            padding: 15px 35px 15px 10px;
        }

        .art_header div span {
            font-size: 16px;
            padding: 15px 20px 15px 10px;

        }

        .art_header div span a {
            text-decoration: none;
            color: #b45f06;
            padding:10px;
        }
        .art_header div span a:hover{
            background-color: #b45f06;
            color: #fce5cd;
            border-radius: 10px;
        }
    </style>
</head>

<body>
<div class="art_header">
    <h1>論壇</h1>
    <div>
        <span><a href="${ctxPath}/art/ArtController?action=selectAll">討論區</a></span>
        <span><a href="personalart.jsp">個人貼文</a></span>
        <span><a href="addart.jsp">新增文章</a></span>
        <span><a href="editart.jsp">修改文章</a></span>
        <span><a href="selectcoin.jsp">查詢代幣紀錄</a></span>
    </div>
</div>
</body>

</html>