<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="common/src/main/java/com/cha102/diyla/sweetclass/teaModel/*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher List</title>
</head>
<body>

<h2>Teacher List</h2>

<%

    List<TeacherVO> teacherList = TeacherService.getAllTeacher();

    // Loop through the teacherList and display information
    for (TeacherVO teacher : teacherList) {
%>
    <div>
        //<img src="<%= teacher.getImageUrl() %>" alt="Teacher Image" width="100">
        <h3><%= teacher.getTeaName %></h3>
        //<p><%= teacher.getTeaSp() %></p>
    </div>
<%
    }
%>

</body>
</html>

