<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.commonproblemmodel.*"%>

<%
    PbmService pbmSvc = new PbmService();
    List<PbmVO> list = pbmSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>

<head>
    <title>常見問題</title>
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/responsive.css" rel="stylesheet" />
    <link href="${ctxPath}/css/pbm.css" rel="stylesheet" />
</head>

<body>
    <jsp:include page="/front_header.jsp" />
    <div class="table_container">
        <div class="filter-buttons">
            <button class="filter-button" data-category="0">全部</button>
            <button class="filter-button" data-category="1">課程</button>
            <button class="filter-button" data-category="2">DIY</button>
            <button class="filter-button" data-category="3">商店</button>
            <button class="filter-button" data-category="4">其他</button>
        </div>

        <table>
            <tr>
                <th class="category-column">問題分類</th>
                <th class="QA-column">常見問題標題</th>
                <th>常見問題內容</th>
            </tr>
            <c:forEach var="pbmVO" items="${list}">
                <tr>
                    <c:choose>
                        <c:when test="${pbmVO.pbmSort == 0}">
                            <td class="1">課程</td>
                        </c:when>
                        <c:when test="${pbmVO.pbmSort == 1}">
                            <td class="2">DIY</td>
                        </c:when>
                        <c:when test="${pbmVO.pbmSort == 2}">
                            <td class="3">商店</td>
                        </c:when>
                        <c:otherwise>
                            <td class="4">其他</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${pbmVO.pbmTitle}</td>
                    <td>${pbmVO.pbmContext}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <jsp:include page="/front_footer.jsp" />
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="js/custom.js"></script>
    <script>
        function filterQuestions(category) {
            var rows = document.querySelectorAll('table tr');

            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                var categoryCell = row.querySelector('td');

                if (categoryCell) {
                    var categoryValue = parseInt(categoryCell.classList[0]);

                    if (category === 0 || category === categoryValue) {
                        row.style.display = 'table-row';
                    } else {
                        row.style.display = 'none';
                    }
                }
            }
        }

        document.querySelectorAll('.filter-button').forEach(function (button) {
            button.addEventListener('click', function () {
                var category = parseInt(this.getAttribute('data-category'));
                filterQuestions(category);
            });
        });
    </script>
</body>
</html>