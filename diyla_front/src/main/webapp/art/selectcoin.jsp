<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.articleModel.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.tokenModel.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    TokenService tokenSvc = new TokenService();
    Integer memId = (Integer)session.getAttribute("memId");
    List<TokenVO> list = tokenSvc.getAllTokenByMemId(memId);
    Integer total = tokenSvc.getTokenTotalByMemId(memId);
    pageContext.setAttribute("list", list);
    pageContext.setAttribute("total", total);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>查詢代幣紀錄</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .token_container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
        }

        .total {
            text-align: center;
            font-size: 24px;
            color: red;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <jsp:include page="/front_header.jsp" />
    <jsp:include page="/art/art_header.jsp" />

    <div class="token_container">
        <table id="tokenTable" class="display">
            <thead>
                <tr>
                    <th>取得/使用地方</th>
                    <th>數量</th>
                    <th>時間</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tokenVO" items="${list}">
                    <tr>
                        <c:choose>
                            <c:when test="${tokenVO.tokenGetUse == 0}">
                                <td>討論區</td>
                            </c:when>
                            <c:when test="${tokenVO.tokenGetUse == 1}">
                                <td>商店</td>
                            </c:when>
                            <c:when test="${tokenVO.tokenGetUse == 2}">
                                <td>課程</td>
                            </c:when>
                            <c:otherwise>
                                <td>過期</td>
                            </c:otherwise>
                        </c:choose>
                        <td>${tokenVO.tokenCount}</td>
                        <td>
                            <fmt:formatDate value="${tokenVO.tokenTime}" pattern="yyyy-MM-dd HH:mm" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <hr>
        <div class="total">
            代幣總量: ${total}
        </div>
    </div>

    <jsp:include page="/front_footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#tokenTable').DataTable({
                "lengthMenu": [3, 5, 10, 20],
                "searching": true,
                "paging": true,
                "ordering": true,
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
                    }
                }
            });
        });
    </script>
</body>

</html>