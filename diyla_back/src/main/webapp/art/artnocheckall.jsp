<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.articleModel.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    ArtService artSvc = new ArtService();
    List<ArtVO> list = artSvc.getAllNoCheckArt();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>全部論壇文章</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
    <!-- ●●css for jquery datatables 用 -->
    <link rel="stylesheet" href="../css/art_header.css">
    <link rel="stylesheet" href="../css/style.css">
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
    <jsp:include page="/index.jsp" />
    <div class="art_header">
        <h1>論壇</h1>
        <div>
            <span><a href="art.jsp">查看論壇</a></span>
            <span><a href="artnocheckall.jsp">審核文章</a></span>
            <span><a href="${ctxPath}/art/artReport">審核留言檢舉</a> </span>
        </div>
    </div>
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
                <th>操作</th>
            </tr>
        </thead>
        <tbody id="content">
            <c:forEach var="artVO" items="${list}">

                <tr>
                    <td>${artVO.artNo}</td>
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
                    <td>
                        <button type="button" id="check" class="buttons" artNo="${artVO.artNo}">✏️審核</button>
                        <form method="post" action="ArtController">
                            <input type="hidden" name="artNo" value="${artVO.artNo}">
                            <input type="hidden" name="memId" value="${artVO.memId}">
                            <input type="hidden" name="action" value="sendToken">
                            <input type="hidden" name="getToken" value="0">
                            <select name="tokenCount" class="coin" style="display: none;">
                                <option value="1">1個</option>
                                <option value="2">2個</option>
                                <option value="3">3個</option>
                            </select>
                            <button type="submit" class="token" style="display: none;"><svg
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="gold" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>發代幣</button><br>
                        </form>
                        <form method="post" action="ArtController">
                            <input type="hidden" name="artNo" value="${artVO.artNo}">
                            <input type="hidden" name="action" value="show_art">
                            <button type="submit" class="pass" style="display: none;"><svg
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="lightgreen" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15.182 15.182a4.5 4.5 0 01-6.364 0M21 12a9 9 0 11-18 0 9 9 0 0118 0zM9.75 9.75c0 .414-.168.75-.375.75S9 10.164 9 9.75 9.168 9 9.375 9s.375.336.375.75zm-.375 0h.008v.015h-.008V9.75zm5.625 0c0 .414-.168.75-.375.75s-.375-.336-.375-.75.168-.75.375-.75.375.336.375.75zm-.375 0h.008v.015h-.008V9.75z" />
                                </svg>通過</button><br>
                        </form>
                        <form method="post" action="ArtController">
                            <input type="hidden" name="artNo" value="${artVO.artNo}">
                            <input type="hidden" name="action" value="delete_art">
                            <button type="submit" class="npass" style="display: none;"><svg
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="red" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15.182 16.318A4.486 4.486 0 0012.016 15a4.486 4.486 0 00-3.198 1.318M21 12a9 9 0 11-18 0 9 9 0 0118 0zM9.75 9.75c0 .414-.168.75-.375.75S9 10.164 9 9.75 9.168 9 9.375 9s.375.336.375.75zm-.375 0h.008v.015h-.008V9.75zm5.625 0c0 .414-.168.75-.375.75s-.375-.336-.375-.75.168-.75.375-.75.375.336.375.75zm-.375 0h.008v.015h-.008V9.75z" />
                                </svg>未通過</button><br>
                        </form>
                        <br>
                </tr>
                </td>
            </c:forEach>
        <tbody>
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

        var token_buttons = document.querySelectorAll('.token');
        var pass_buttons = document.querySelectorAll('.pass');
        var npass_buttons = document.querySelectorAll('.npass');
        var check_buttons = document.querySelectorAll('.buttons');


        check_buttons.forEach(button => {
            button.addEventListener('click', function (event) {
                var artNo = button.getAttribute('artNo');

                button.style.display = 'none';
                var row = button.closest('tr');
                var token_button = row.querySelector('.token');
                var pass_button = row.querySelector('.pass');
                var npass_button = row.querySelector('.npass');
                var coin = row.querySelector('.coin');
                if (token_button && pass_button && npass_button) {
                    token_button.style.display = 'block';
                    pass_button.style.display = 'block';
                    npass_button.style.display = 'block';
                    coin.style.display = 'block';
                }


            });
        });

        token_buttons.forEach(button => {
            button.addEventListener('click', function () { rollback(); });
        });

        pass_buttons.forEach(button => {
            button.addEventListener('click', function () { rollback(); });
        });

        npass_buttons.forEach(button => {
            button.addEventListener('click', function () { rollback(); });
        });

        function rollback(row) {
            var token_button = row.querySelector('.token');
            var pass_button = row.querySelector('.pass');
            var npass_button = row.querySelector('.npass');
            var check_button = row.querySelector('.buttons');
            var coin = row.querySelector('coin');

            if (token_button && pass_button && npass_button && check_button) {
                token_button.style.display = 'none';
                pass_button.style.display = 'none';
                npass_button.style.display = 'none';
                check_button.style.display = 'block';
                coin.style.display = 'none';
            }
        }
    </script>
</body>

</html>