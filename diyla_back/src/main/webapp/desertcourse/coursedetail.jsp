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

    </head>

    <body>

        <div id="coursecontainer">
        <h1><%= course.getClassName() %></h1>
        <p>
            <img src="data:image/jpeg;base64,<%= coursePic %>">
        </p>
        <p><strong>Category:</strong>
            <%= course.getCategory() %>
        </p>
        <p><strong>Course Date:</strong>
            <%= course.getClassDate() %>
        </p>
        <p><strong>Course Sequence:</strong>
            <%= course.getClassSeq() %>
        </p>
        </div>
        <!-- Add more fields as needed -->
        <div id="teacontainer">
            <img src="data:image/jpeg;base64,<%= teacherPic%>">
        <p><strong>Teacher Name:</strong>
            <%= teacher.getTeaName() %>
        </p>
        <p><strong>Teacher Intro:</strong>
            <%= teacher.getTeaIntro() %>
        </p>
        </div>

            <button type="button" id="modifyButton">修改課程</button>

        <a href="${ctxPath}"+"/desertcourse/listalldesertcoursecalendar.jsp">回到甜點課程日曆表</a>

            </section>
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var modifyButton = document.getElementById('modifyButton');
            var urlParams = new URLSearchParams(window.location.search);
            var courseId = urlParams.get('courseid');
            //判斷是否有權限
            function isUserHaveAuth() {
                return true
            }
            modifyButton.addEventListener('click', function () {

                if (isUserHaveAuth()) {
                    window.location.href = "${ctxPath}"+'/verifyCourseAction?action=modify&courseId=' + courseId;
                } else {
                    //window.location.href = 'register.jsp?courseId=' + courseId;
                }
            });
        });
    </script>

    </html>
    <% } else { out.println("Course not found."); } %>