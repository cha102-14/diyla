<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>常見問題單筆</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            background-color: #f7f3e9;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
            align-items: center;
        }

        table#table1 {
            border-collapse: collapse;
            width: 85%;
            margin: 20px auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table th,
        table td {
            padding: 10px;
            border: 1px solid #dcdcdc;
        }

        table th {
            background-color: #f39c12;
            color: #ffffff;
            font-size: 18px;
        }

        table td {
            font-size: 16px;
            color: #333;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
    </style>

</head>
<body bgcolor='white'>
    <jsp:include page="/pbm/pbm_header.jsp" />
    <table id="table-1">
        <tr>
            <td>
                <h3></h3>
                <h4><a href="select_page.jsp"></h4>
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <th>常見問題編號</th>
            <th>常見問題分類</th>
            <th>常見問題標題</th>
            <th>常見問題內容</th>
        </tr>
        <tr>
            <td>${pbmVO.pbmNo}</td>
            <c:choose>
                <c:when test="${pbmVO.pbmSort == 0}">
                    <td>課程</td>
                </c:when>
                <c:when test="${pbmVO.pbmSort == 1}">
                    <td>DIY</td>
                </c:when>
                <c:when test="${pbmVO.pbmSort == 2}">
                    <td>商店</td>
                </c:when>
                <c:otherwise>
                    <td>其他</td>
                </c:otherwise>
            </c:choose>
            <td>${pbmVO.pbmTitle}</td>
            <td>${pbmVO.pbmContext}</td>
        </tr>
    </table>

</body>
</html>