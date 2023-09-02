<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.articleModel.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    ArtService artSvc = new ArtService();
    Integer memId = (Integer)session.getAttribute("memId");
    List<ArtVO> list = artSvc.getArtByMemId(memId);
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>個人論壇文章</title>
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
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
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
            max-width: 200px;
            height: auto;
        }

        button {
            padding: 5px 10px;
            border: none;
            background-color: #555;
            color: white;
            cursor: pointer;
            border-radius: 10px;
        }

        button:hover {
            background-color: #333;
        }

        th#th_time {
            width: 80px;
        }
    </style>


</head>

<body bgcolor='white'>
    <jsp:include page="/front_header.jsp" />
    <jsp:include page="/art/art_header.jsp" />

    <div class="table-container">
        <table id="art" class="display" style="width: 100%">
            <thead id="header">
                <tr>
                    <th>文章標題</th>
                    <th>文章圖片</th>
                    <th id="th_context">文章內容</th>
                    <th id="th_time">發表時間</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody id="content">
                <c:forEach var="artVO" items="${list}">

                    <tr>
                        <td>${artVO.artTitle}</td>
                        <c:choose>
                            <c:when test="${not empty artVO.artPic}">
                                <td><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(artVO.artPic) }"
                                        alt="Image"></td>
                            </c:when>
                            <c:otherwise>
                                <td><img src="" alt="無圖片"></td>
                            </c:otherwise>
                        </c:choose>
                        <td>
                            <div class="art_Content">
                                <c:choose>
                                    <c:when test="${artVO.artContext.length() > 100}">
                                        <p class="${content_0_100}">${artVO.artContext.substring(0, 100)}
                                        </p>
                                        <p class="${allContent}" style="display: none;">
                                            ${artVO.artContext}</p>
                                        <button type="button" class="showall_button"
                                            onclick="showMore()">顯示更多</button>
                                        <button type="button" class="showpart_button" style="display: none;"
                                            onclick="showless()">顯示較少</button>
                                    </c:when>
                                    <c:otherwise>
                                        <p>${artVO.artContext}</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                        <td>${artVO.artTime}</td>
                        <td>
                            <form method="post" action="ArtController">
                                <input type="hidden" name="artNo" value="${artVO.artNo}">
                                <input type="hidden" name="action" value="update_start">
                                <button type="submit">✏️編輯</button>
                            </form>
                            <form method="post" action="ArtController">
                                <input type="hidden" name="artNo" value="${artVO.artNo}">
                                <input type="hidden" name="action" value="delete_Art">
                                <input type="button" onclick="delete_art()" value="❌刪除">
                                <input id="delete_submit" type="submit" style="display: none">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            <tbody>
        </table>
    </div>
    <jsp:include page="/front_footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- ●●js  for sweetalert  用 -->
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
        function showMore() {
            $('.content_0_100').css('display', 'none');
            $('.allContent').css('display', 'block');
            $('.showall_button').css('display', 'none');
            $('.showpart_button').css('display', 'block');
        }

        function showless() {
            $('.content_0_100').css('display', 'block');
            $('.allContent').css('display', 'none');
            $('.showall_button').css('display', 'block');
            $('.showpart_button').css('display', 'none');
        }
        function delete_art() {
            swal("確定要刪除貼文?", "請按確定刪除或按取消返回", {
                dangerMode: true,
                buttons: ["取消", "確定"],
            }).then((confirm) => {
                if (confirm) {
                    // 使用者按下了 "確定" 按鈕，執行表單送出
                    document.querySelector("#delete_submit").click();
                } else {
                    // 使用者按下了 "取消" 按鈕，不執行任何操作，讓使用者保留在頁面
                }
            });
        }
    </script>
</body>

</html>