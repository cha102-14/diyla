<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>論壇</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/art_header.css">
    <style>
        body{
    margin-left:280px;
    }

    </style>
</head>

<body>
    <div class="art_header">
        <h1>最新消息</h1>
        <div>
            <span><a href="latall.jsp">查看最新公告</a></span>
            <span><a href="addlat.jsp">新增最新公告</a> </span>
            <span>
                <FORM METHOD="post" ACTION="latServlet" style="display: inline-block;">
                    輸入公告編號 (如1):<input type="text" name="newsNO">
                    <input type="hidden" name="action" value="getOne_For_Display">
                    <input type="submit" value="送出">
                </FORM>
            </span>
        </div>
    </div>

</body>

</html>