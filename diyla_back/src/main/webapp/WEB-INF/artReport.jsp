<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/index.jsp" />


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>論壇</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/art_header.css">
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
            padding: 0 5px;
        }

        label,
        div.dataTables_info {
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

<body>
    <div class="art_header">
        <h1>論壇</h1>
        <div>
            <span><a href="art.jsp">查看論壇</a></span>
            <span><a href="artnocheckall.jsp">審核文章</a></span>
            <span><a href="${ctxPath}/art/artReport">審核留言檢舉</a></span>
        </div>
    </div>


    <table id="dto" class="display" style="width: 100%">
        <thead id="header">
            <tr>
                <th>檢舉編號</th>
                <th>檢舉原因</th>
                <th>文章留言</th>
                <th>檢舉時間</th>
                <th>檢舉狀態</th>
                <th>會員編號</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody id="content">
            <c:forEach var="ArtDTO" items="${list}">
                <tr>
                    <td>${ArtDTO.rpMsgNo}</td>
                    <td>${ArtDTO.rpMsgContext}</td>
                    <td>${ArtDTO.msgContext}</td>
                    <td>
                        <fmt:formatDate value="${ArtDTO.rpMsgTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                    </td>
                    <td>${ArtDTO.rpMsgStatus}</td>
                    <td>${ArtDTO.memId}</td>
                    <td>
                        <form method="post" action="successRpMsg" modelAttribute="ArtRpMsgVO">
                            <input type="hidden" name="msgNo" value="${ArtDTO.msgNo}">
                            <input type="hidden" name="rpMsgNo" value="${ArtDTO.rpMsgNo}">
                            <button type="submit" class="pass"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke-width="1.5" stroke="lightgreen" class="w-6 h-6"
                                    width="30px" height="30px">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15.182 15.182a4.5 4.5 0 01-6.364 0M21 12a9 9 0 11-18 0 9 9 0 0118 0zM9.75 9.75c0 .414-.168.75-.375.75S9 10.164 9 9.75 9.168 9 9.375 9s.375.336.375.75zm-.375 0h.008v.015h-.008V9.75zm5.625 0c0 .414-.168.75-.375.75s-.375-.336-.375-.75.168-.75.375-.75.375.336.375.75zm-.375 0h.008v.015h-.008V9.75z" />
                                </svg><br>成功</button><br>
                        </form>
                        <form method="post" action="deleteRpMsg" modelAttribute="ArtRpMsgVO">
                            <input type="hidden" name="msgNo" value="${ArtDTO.msgNo}">
                            <input type="hidden" name="rpMsgNo" value="${ArtDTO.rpMsgNo}">
                            <button type="submit" class="npass"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke-width="1.5" stroke="red" class="w-6 h-6" width="30px"
                                    height="30px">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15.182 16.318A4.486 4.486 0 0012.016 15a4.486 4.486 0 00-3.198 1.318M21 12a9 9 0 11-18 0 9 9 0 0118 0zM9.75 9.75c0 .414-.168.75-.375.75S9 10.164 9 9.75 9.168 9 9.375 9s.375.336.375.75zm-.375 0h.008v.015h-.008V9.75zm5.625 0c0 .414-.168.75-.375.75s-.375-.336-.375-.75.168-.75.375-.75.375.336.375.75zm-.375 0h.008v.015h-.008V9.75z" />
                                </svg><br>無效</button><br>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        <tbody>
    </table>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script>
        $(document).ready(function () {
            $('#dto').DataTable({
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