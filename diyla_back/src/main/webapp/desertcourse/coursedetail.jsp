<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Base64" %>
<%
    int courseId=Integer.parseInt(request.getParameter("courseid"));

    ClassService classService=new ClassService();
    ClassVO course=classService.getOneClass(courseId);
    TeacherService teacherService=new TeacherService();
    TeacherVO teacher=teacherService.getOneTeacher(course.getTeaId());

    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String teacherPic = Base64.getEncoder().encodeToString(teacher.getTeaPic());
    String coursePic = Base64.getEncoder().encodeToString(course.getClassPic());
    if (course !=null) { %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>課程詳情</title>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css.map"/>
        <!-- Custom styles for this template -->
        <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
        <!-- responsive style -->
        <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
    </head>

    <body>
    <div id="pageContent">
            <div id="indexBlock">

            </div>
                    <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
                        <h2 id="title" class="title-tag" >課程細節</h2>
                    </div>
            <div id="contentBlock">
<div id="coursecontainer">
        <h1><%= course.getClassName() %></h1>
        <p>
            <img src="data:image/jpeg;base64,<%= coursePic %>">
        </p>
    <div id="courseCategoryBlock"><strong>課程分類: </strong>
    <%
    String categoryStr = "";
    int category = course.getCategory();
    if (category == 0) {
        categoryStr = "糖果";
    } else if (category == 1) {
        categoryStr = "蛋糕";
    } else if (category == 2) {
        categoryStr = "餅乾";
    } else if (category == 3) {
        categoryStr = "麵包";
    } else if (category == 4) {
        categoryStr = "法式甜點";
    } else if (category == 5) {
        categoryStr = "中式甜點";
    } else if (category == 6) {
        categoryStr = "其他";
    }
    out.println(categoryStr);
    %>
    </div>

    <div id="courseDateBlock"><strong>課程日期: </strong>
    <%= course.getClassDate() %>
    </div>

    <div id="courseSeqBlock"><strong>課程場次: </strong>
    <%
    String classSeqStr = "";
    int classSeq = course.getClassSeq();
    if (classSeq == 0) {
        classSeqStr = "早上";
    } else if (classSeq == 1) {
        classSeqStr = "下午";
    } else if (classSeq == 2) {
        classSeqStr = "晚上";
    }
    out.println(classSeqStr);
    %>
    </div>
    <div id="courseLimitBlock">
    <strong>課程人數上限: </strong>
    <%= course.getClassLimit() %>
    </div>
    <div id="headcountBlock">
    <strong>目前報名人數: </strong>
    <%= course.getHeadcount() %>
    </div>
    <div id="courseStatusBlock">
    <strong>課程狀態: </strong>
    <%
    String courseStatusStr = "";
    int courseStatus = course.getClassStatus();
    if (courseStatus == 0) {
        courseStatusStr = "上架";
    } else if (courseStatus == 1) {
        courseStatusStr = "下架";
    } else if (courseStatus == 2) {
        courseStatusStr = "已結束報名";
    }
    out.println(courseStatusStr);
    %>
    </div>
    <div id="courseIntroBlock">
    <strong>課程簡介: </strong>
    <div id="introText"><%= course.getIntro() %></div>
    </div>
</div>

        <!-- Add more fields as needed -->
        <div id="teacherContainer">
            <img src="data:image/jpeg;base64,<%= teacherPic%>">
        <div id="teacherNameBlock"><strong>教師: </strong>
            <%= teacher.getTeaName() %>
        </div>
        <div id="teacherIntroBlock"><strong>教師簡介: </strong>
            <%= teacher.getTeaIntro() %>
        </div>
        </div>

            <button type="button" id="modifyButton">修改課程</button>
            <button type="button" id="deleteButton">刪除課程</button>

        <a href="${ctxPath}/desertcourse/listalldesertcoursecalendar.jsp">回到甜點課程日曆表</a>

            </section>
            </div>
            </div>
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var modifyButton = document.getElementById('modifyButton');
            var deleteButton = document.getElementById('deleteButton');
            var urlParams = new URLSearchParams(window.location.search);
            var courseId = urlParams.get('courseid');
            var typeFun = "${typeFun}";
            //判斷是否有權限
            function isUserHaveAuth() {
                if (typeFun === "ADMIN" || typeFun === "MASTER"){
                    return true;
                } else {
                    return true;
                }
            }

            modifyButton.addEventListener('click', function () {
                window.location.href = "${ctxPath}"+'/verifyCourseAction?action=modify&courseId=' + courseId;
            });
            deleteButton.addEventListener('click', function() {
                window.location.href = "${ctxPath}"+'/verifyCourseAction?action=delete&courseId=' + courseId;
            });
        });
    </script>

    </html>
    <% } else { out.println("Course not found."); } %>