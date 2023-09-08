<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <title>師傅列表</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/findteacher.css">
</head>
<body>
<jsp:include page="/front_header.jsp" />
<section id="navibar">
<jsp:include page="/desertcourse/navibar.jsp" />
</section>
<div class="container">
    <div class="row">
    <%
        TeacherService teacherService = new TeacherService();
        List<TeacherVO> teacherList = teacherService.getAllTeacher();

        int itemsPerPage = 6; //每頁卡片数量
        int totalItems = teacherList.size(); // 總共卡片數量
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
        request.setAttribute("totalPages", totalPages);


            int currentPage = 1; // 默認page為第一页


            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) {
                currentPage = Integer.parseInt(pageParam);
            }


        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, totalItems);

        for (int i = startIndex; i < endIndex; i++) {
            TeacherVO teacher = teacherList.get(i);
            byte[] imgBytes = teacher.getTeaPic();
            String base64Img = null;
            if( imgBytes == null){
                base64Img = null;
            } else{
            base64Img = Base64.getEncoder().encodeToString(imgBytes);
            }
    %>
        <div class="col-md-4 teacher-card" >
            <div class="card">
                <img src="data:image/jpeg;base64, <%= base64Img %>" class="card-img-top" alt="Teacher Image">
                <div class="card-body">
                    <h5 class="card-title">師傅姓名: <%= teacher.getTeaName() %></h5>
                    <p class="card-text"><%= teacher.getTeaIntro() %></p>
                    <button class="btn btn-primary checkDetail" data-field=<%= teacher.getTeaId() %>>查看詳細</button>
                </div>
            </div>
        </div>
    <%
        }
    %>
    </div>
</div>
<div class="center">
    <div class="pagination">
        <a href="?page=1">&laquo;</a>
        <c:forEach var="page" begin="1" end="${totalPages}" varStatus="loop">
            <a href="?page=${loop.index}">${loop.index}</a>
        </c:forEach>
        <a href="?page=${totalPages}">&raquo;</a>
    </div>
</div>

<jsp:include page="/front_footer.jsp" />

<script>
    $("document").ready(function() {
        $(".checkDetail").click(function() {
            var teacherId = $(this).data("field");
            window.location.href="${ctxPath}/desertcourse/teacherdetail.jsp?teacherid="+ teacherId;
        });

        $(".card-text").each(function() {
            var introText = $(this);
            var intro = introText.text();
            if (intro.length > 20) {
                introText.text(intro.substring(0, 30) + "...");
            }
        });
    });
</script>
</body>
</html>
