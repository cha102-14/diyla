<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<%
     LatService latSvc = new LatService();
        List<LatestnewsVO> list = latSvc.getAll();
        pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>

<head>
    <title>全部公告</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
    <link rel="stylesheet" href="../css/latall.css">
    <style>
    </style>
</head>

<body id="lat_all">
    <jsp:include page="/index.jsp" />
    <jsp:include page="/latestnews/lat_header.jsp" />
    <table id="lat" class="display">
        <thead id="header">
            <tr>
                <th>公告編號</th>
                <th>公告內容</th>
                <th id="lat_pic">公告圖片</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody id="content">
            <% List<LatestnewsVO> scvList = (List)pageContext.getAttribute("list"); %>
                <% if (scvList !=null) { %>
                    <% for (LatestnewsVO a : scvList) { %>
                        <tr>
                            <td>
                                <%= a.getNewsNo() %>
                            </td>
                            <td>
                                <%= a.getNewsContext() %>
                            </td>
                            <td><img id="lat_img" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(a.getAnnPic()) %>"
                                    alt="公告圖片"></td>
                            <td>
                                <form method="post" action="latServlet">
                                    <input type="hidden" name="newsNo" value="<%= a.getNewsNo() %>">
                                    <input type="hidden" name="action" value="update_start">
                                    <button type="submit">✏️編輯</button>
                                </form>
                                <form method="post" action="latServlet">
                                    <input type="hidden" name="newsNo" value="<%= a.getNewsNo() %>">
                                    <input type="hidden" name="action" value="delete_latnews">
                                    <button type="submit">❌刪除</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                            <% } %>
        </tbody>
    </table>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script><!-- ●●js  for jquery datatables 用 -->
    <!-- ●●css for jquery datatables 用 -->
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script>
        $(document).ready(function () {
            $('#lat').DataTable({
                "lengthMenu": [10, 20, 100],
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
            $('#lat').css('display', 'table');
        });
    </script>
</body>

</html>