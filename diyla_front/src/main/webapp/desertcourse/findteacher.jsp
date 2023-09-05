<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <title>Teacher List</title>
</head>
<body>

<h2>Teacher List</h2>

<%
    TeacherService teacherService = new TeacherService();
    List<TeacherVO> teacherList = teacherService.getAllTeacher();


    for (TeacherVO teacher : teacherList) {
    byte[] imgBytes = teacher.getTeaPic();
    String base64Img = Base64.getEncoder().encodeToString(imgBytes);

%>
    <div>
        <img src="data:image/jpeg;base64, <%= base64Img %>" alt="Teacher Image" width="100">
        <h3><%= teacher.getTeaName() %></h3>

    </div>
<%
    }
%>

</body>
</html>
