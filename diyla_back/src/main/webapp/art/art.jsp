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
        <h1>論壇</h1>
        <div>
            <span><a href="${ctxPath}/art/ArtController?action=selectAll">查看論壇</a></span>
            <span><a href="artnocheckall.jsp">審核文章</a></span>
            <span><a href="${ctxPath}/art/artReport">審核留言檢舉</a> </span>
        </div>
    </div>
</body>

</html>