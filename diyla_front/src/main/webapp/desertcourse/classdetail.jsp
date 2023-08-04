<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%

    int courseId = Integer.parseInt(request.getParameter("id"));


    ClassService classService = new ClassService();
    ClassVO course = classService.getOneClass(courseId);


    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    if (course != null) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Detail</title>
</head>
<body>
    <h1>Course Detail</h1>
    <p><strong>Course Name:</strong> <%= course.getClassName() %></p>
    <p><strong>Category:</strong> <%= course.getCategory() %></p>
    <p><strong>Teacher ID:</strong> <%= course.getTeaId() %></p>
    <p><strong>Course Date:</strong> <%= course.getClassDate() %></p>
    <p><strong>Course Sequence:</strong> <%= course.getClassSeq() %></p>
    <button type="button" id="registerButton">報名課程</button>
    <!-- Add more fields as needed -->

    <a href="findclass.jsp">Back to Course List</a>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
            var registerButton = document.getElementById('registerButton');
            var courseId = getCourseIdFromQueryString();
            registerButton.addEventListener('click', function() {

                if (isUserLoggedIn()) {

                    window.location.href = 'confirmRegistration.jsp?id=' + courseId;
                } else {

                    window.location.href = 'register.jsp?courseId=' + courseId;
                }
            });
        });
</script>
</html>
<%
    } else {
        out.println("Course not found.");
    }
%>
