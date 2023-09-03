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
        <table>
            <tr>
                <th class="category-column">問題分類</th>
                <th>常見問題標題</th>
                <th>常見問題內容</th>
            </tr>
            <c:forEach var="pbmVO" items="${list}">
                <tr>
                        <td>
                            <c:choose>
                                <c:when test="${pbmVO.pbmSort == 0}">課程</c:when>
                                <c:when test="${pbmVO.pbmSort == 1}">DIY</c:when>
                                <c:when test="${pbmVO.pbmSort == 2}">商店</c:when>
                                <c:otherwise>其他</c:otherwise>
                            </c:choose>
                        </td>
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
</body>

</html>