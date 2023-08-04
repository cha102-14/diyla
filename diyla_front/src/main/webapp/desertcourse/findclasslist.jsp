<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>甜點課程</title>
        <script>
            function viewCourseDetail(courseId) {
                window.location.href = 'classdetail.jsp?id=' + courseId;
            }
        </script>
</head>
<body>
    <h2>甜點課程</h2>
    <%  ClassService course = new ClassService();
        List<ClassVO> courseList = course.getAllClass();
        for(ClassVO courses: courseList) {
        byte[] coursePic = courses.getClassPic();
        String courseName = courses.getClassName();
        Date courseDate = courses.getClassDate();
        String courseIntro = courses.getIntro();
        Integer courseId = courses.getClassId();
        Integer courseCat = courses.getCategory();
        String base64Img = Base64.getEncoder().encodeToString(coursePic);
    %>
    <div>
    <img src="data:image/jpeg;base64, <%= base64Img %> "alt= "classPic" width="100">
    <p onclick="viewCourseDetail('<%= courseId %>')"><%= courseName%></p>
    </div>
        <%
        }
    %>
</body>
</html>