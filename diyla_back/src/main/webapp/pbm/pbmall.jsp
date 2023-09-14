<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp"/>
<%@ page import="com.cha102.diyla.commonproblemmodel.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    PbmService pbmSvc = new PbmService();
    List<PbmVO> list = pbmSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>常見問題</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
    <style>
        body {
            margin-left: 300px;
        }
    </style>



</head>

<body bgcolor='white'>
    <jsp:include page="/pbm/pbm_header.jsp" />
    <table id="pbmtable" class="display">
        <thead id="header">
            <tr>
                <th>問題編號</th>
                <th>問題分類</th>
                <th>常見問題標題</th>
                <th>常見問題內容</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody id="content">
            <c:forEach var="pbmVO" items="${list}">
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
                    <td>
                        <form method="post" action="PbmController">
                            <input type="hidden" name="pbmNo" value="${pbmVO.pbmNo}">
                            <input type="hidden" name="action" value="update_start">
                            <button type="submit">✏️編輯</button>
                        </form>

                        <form method="post" action="PbmController">
                            <input type="hidden" name="pbmNo" value="${pbmVO.pbmNo}">
                            <input type="hidden" name="action" value="delete_pbm">
                            <button type="submit">❌刪除</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script><!-- ●●js  for jquery datatables 用 -->
    <!-- ●●css for jquery datatables 用 -->
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <!-- ●●js  for jquery datatables 用 -->
    <script>
        $(document).ready(function () {
            $('#pbmtable').DataTable({
                "lengthMenu": [3, 5, 10, 20],
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
            $('#pbmtable').css('display', 'table');
        });
    </script>
</body>

</html>