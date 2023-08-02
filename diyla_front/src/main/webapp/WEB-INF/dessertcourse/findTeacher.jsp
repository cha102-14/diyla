<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher List</title>
</head>
<body>

<h2>Teacher List</h2>

<%

    List<Teacher> teacherList = TeacherDAO.getAllTeachers();

    // Loop through the teacherList and display information
    for (Teacher teacher : teacherList) {
%>
    <div>
        <img src="<%= teacher.getImageUrl() %>" alt="Teacher Image" width="100">
        <h3><%= teacher.getName() %></h3>
        <p><%= teacher.getExpertise() %></p>
    </div>
<%
    }
%>

</body>
</html>

