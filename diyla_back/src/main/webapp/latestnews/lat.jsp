<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.jsp"/>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="../css/style.css">
     <link rel="stylesheet" href="../css/lat.css">

</head>

<body>
    <h1 class="h1">最新公告</h1>

    <div class="lathome">
    <ul>
        <li class="li">
          <a class="a" href='latall.jsp'>查詢全部最新公告</a>
        </li>

        <li class="li">
            <FORM METHOD="post" ACTION="latServlet">
                輸入公告編號 (如1):<input type="text" name="newsNO">
                <input type="hidden" name="action" value="getOne_For_Display">
                <input type="submit" value="送出">
            </FORM>
        </li>

        <li class="li"><a class="a" href='addlat.jsp'>新增最新公告</a><br><br></li>

    </ul>
    </div>
</body>

</html>