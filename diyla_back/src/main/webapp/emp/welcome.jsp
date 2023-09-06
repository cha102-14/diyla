<%@page import="com.cha102.diyla.empmodel.EmpVO"%>
<%@page import="com.cha102.diyla.empmodel.EmpDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <% EmpDAOImpl dao =new EmpDAOImpl();
  	Integer empId =(Integer)session.getAttribute("empId");
  	EmpVO empVO = dao.getOne(empId);
  	
  %>    

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" href="../css/style.css">
<title>Welcome to DIYLA</title>
<style>
  body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #FFFFF4;
  }
  .welcome-message {
    text-align: center;
    font-size: 24px;
    margin-left: 280px;
  }
</style>
</head>
<body>
<div class="topPage">
		<jsp:include page="../index.jsp" />
	</div>
  <div class="welcome-message">
<p>${typeFun}</p>
    <svg viewBox="0 0 24 24" fill="none" width="150px" height="150px" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path fill-rule="evenodd" clip-rule="evenodd" d="M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12ZM15 9C15 10.6569 13.6569 12 12 12C10.3431 12 9 10.6569 9 9C9 7.34315 10.3431 6 12 6C13.6569 6 15 7.34315 15 9ZM12 20.5C13.784 20.5 15.4397 19.9504 16.8069 19.0112C17.4108 18.5964 17.6688 17.8062 17.3178 17.1632C16.59 15.8303 15.0902 15 11.9999 15C8.90969 15 7.40997 15.8302 6.68214 17.1632C6.33105 17.8062 6.5891 18.5963 7.19296 19.0111C8.56018 19.9503 10.2159 20.5 12 20.5Z" fill="#000000"></path> </g></svg>
    <p style="padding: 20px"><%=empVO.getEmpName()%>歡迎登入!</p>
  </div>
</body>
</html>
