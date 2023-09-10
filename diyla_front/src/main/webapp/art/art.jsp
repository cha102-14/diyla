<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.articleModel.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>全部論壇文章</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
    <!-- ●●css for jquery datatables 用 -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            margin-left: 300px;
        }

        table {
            width: calc(100% - 300px);
            margin-top: 20px;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
            /* 調整此行來置中對齊 */
            border: 1px solid #dce3e6;
        }

        th {
            background-color: #dce3e6;
            color: #555;
        }

        tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        img {
            max-width: 300px;
            height: auto;
            max-height: 300px;
        }

        button {
            padding: 5px 10px;
            border: none;
            background-color: #555;
            color: white;
            cursor: pointer;
            border-radius: 3px;
        }

        button:hover {
            background-color: #333;
        }

        th#th_time {
            width: 80px;
        }

        div#art_wrapper {
            margin: 6px 0;
        }

        .showall_button a {
            text-decoration: none;
            padding: 10px;
            color: white;
        }
    </style>


</head>

<body bgcolor='white'>
    <jsp:include page="/front_header.jsp" />
    <jsp:include page="/art/art_header.jsp" />


    <table id="art" class="display" style="width: 100%">
        <thead id="header">
            <tr>
                <th>會員帳號</th>
                <th>文章標題</th>
                <th>文章圖片</th>
                <th id="th_context">文章內容</th>
                <th id="th_time">發表時間</th>
            </tr>
        </thead>
        <tbody id="content">
            <c:forEach var="artVO" items="${list}">

                <tr>
                    <td>${artVO.memVO}</td>
                    <td>${artVO.artTitle}</td>
                    <c:choose>
                        <c:when test="${not empty imgBase64[(artVO.artNo)-1]}">
                            <td><img src="data:image/jpeg;base64,${imgBase64[(artVO.artNo)-1]}" alt="Image"></td>
                        </c:when>
                        <c:when test="${not empty artVO.artPic}">
                            <td><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(artVO.artPic) }"
                                    alt="Image2"></td>
                        </c:when>
                        <c:otherwise>
                            <td><img src="" alt="無圖片"></td>
                        </c:otherwise>
                    </c:choose>
                    <td>
                        <div class="art_Content">
                            <c:choose>
                                <c:when test="${artVO.artContext.length() > 30}">
                                    <p class="${content_0_100}">${artVO.artContext.substring(0, 30)}
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p>${artVO.artContext}</p>
                                </c:otherwise>
                            </c:choose>
                            <form action="select" method="post" modelAttribute="ArtMsgVO">
                                <input type=hidden name="artNo" value="${artVO.artNo}">
                                <input name="memId" type="hidden" value="${memId}" />
                                <input type=hidden name="action" value="selectone">
                                <button type="submit" class="showall_button">查看完整貼文</button>
                            </form>
                        </div>
                    </td>
                    <td>
                        <fmt:formatDate value="${artVO.artTime}" pattern="yyyy-MM-dd HH:mm" />
                    </td>
                </tr>
            </c:forEach>
        <tbody>
    </table>
    <jsp:include page="/front_footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script>
        $(document).ready(function () {
            $('#art').DataTable({
                "lengthMenu": [10, 20],
                "searching": true,  //搜尋功能, 預設是開啟
                "paging": true,     //分頁功能, 預設是開啟
                "ordering": true,   //排序功能, 預設是開啟
                "sPaginationType": "full_numbers",
                "language": {
                    "processing": "處理中...",
                    "loadingRecords": "載入中...",
                    "lengthMenu": "顯示 _MENU_ 筆結果",
                    "zeroRecords": "沒有符合的結果",
                    "info": "顯示第 _START_ 至 _END_ 筆結果，共<font color=red> _TOTAL_ </font>筆",
                    "infoEmpty": "顯示第 0 至 0 筆結果，共 0 筆",
                    "infoFiltered": "(從 _MAX_ 筆結果中過濾)",
                    "infoPostFix": "",
                    "search": "搜尋:",
                    "paginate": {
                        "first": "第一頁",
                        "previous": "上一頁",
                        "next": "下一頁",
                        "last": "最後一頁"
                    },
                    "aria": {
                        "sortAscending": ": 升冪排列",
                        "sortDescending": ": 降冪排列"
                    }
                }
            });
        });

    </script>
</body>

</html>