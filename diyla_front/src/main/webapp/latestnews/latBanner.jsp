<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<%
     LatService latSvc = new LatService();
     List<LatestnewsVO> list = latSvc.getAllShowCheck();
     pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<title>最新消息</title>
    <link href="${ctxPath}/css/lat.css" rel="stylesheet"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f2ea;
            margin: 0;
            padding: 0;
        }
        .lat_container {
            max-width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        th {
            background-color: #ffd699;
            font-weight: bold;
            position: sticky;
        }

        td {
            white-space: normal; /* 修改此行 */
            height: 150px;
        }

        #show_img > img {
            width: 100%;
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
        }

        hr {
            border-color: #fce5cd;
            margin: 10px 0;
        }

        .right-scroll {
            overflow-y: scroll;
            max-height: 280px;
        }

    </style>
</head>
<body>
<div class="lat_container right-scroll">
    <table style="text-align:center;">
        <tr>
            <th>公告內容</th>
            <th>公告圖片</th>
        </tr>
        <c:forEach var="a" items="${list}">
            <tr>
                <td style="padding:20px;text-align:justify;">${a.newsContext}</td>
                <td>
                    <hr>
                    <div id="show_img">
                        <c:catch var="imgException">
                            <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(a.annPic)}" >
                        </c:catch>
                        <c:if test="${imgException != null}">
                            <p>無法顯示圖片: ${imgException.message}</p>
                        </c:if>
                    </div>
                    <hr>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>

</html>