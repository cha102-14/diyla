<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.articleModel.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>全部論壇文章</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
    <!-- ●●css for jquery datatables 用 -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            margin-left: 280px;
        }

        table {
            width: calc(100% - 300px);
            margin-top: 20px;
            padding:  0 5px;
        }
        label,div.dataTables_info{
            padding: 10px;
            height: 20px;
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
            max-width: 200px;
            height: auto;
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
    </style>


</head>

<body bgcolor='white'>
    <jsp:include page="/index.jsp" />
    <jsp:include page="art.jsp" />

    <table id="art" class="display" style="width: 100%">
        <thead id="header">
            <tr>
                <th>文章編號</th>
                <th>文章標題</th>
                <th>文章圖片</th>
                <th id="th_context">文章內容</th>
                <th id="th_time">發表時間</th>
                <th>文章狀態</th>
                <th>會員編號</th>
            </tr>
        </thead>
        <tbody id="content">
            <c:forEach var="artVO" items="${list}">

                <tr>
                    <td>${artVO.artNo}</td>
                    <td>${artVO.artTitle}</td>
                    <c:choose>
                        <c:when test="${not empty imgBase64[(artVO.artNo)-1]}">
                            <td><img src="data:image/jpeg;base64,${imgBase64[(artVO.artNo)-1]}" alt="Image"></td>
                        </c:when>
                        <c:when test="${not empty artVO.artPic}">
                            <td><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(artVO.artPic) }"
                                    alt="Image"></td>
                        </c:when>
                        <c:otherwise>
                            <td><img src="" alt="無圖片"></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${artVO.artContext}</td>
                    <td><fmt:formatDate value="${artVO.artTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    <c:choose>
                        <c:when test="${artVO.artStatus == 1}">
                            <td><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="gold" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </td>
                        </c:when>
                        <c:when test="${artVO.artStatus == 2}">
                            <td><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td>
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 10-4.243-4.243m4.242 4.242L9.88 9.88" />
                                </svg>
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <td>${artVO.memId}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script><!-- ●●js  for jquery datatables 用 -->
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