<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
    <title>師傅詳情</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,700&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
<style>

    #page-content {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 20px;
        width: 100%;

    }

    #teacherBlock {
        display: flex;
        flex-direction: row; /* 將內容水平排列 */
        width: 95%;
        padding-left: 15%;
        font-family: 'Lato', sans-serif;
        align-items: space-around;
        column-gap: 8vw;
        margin-top: 5vh;

    }

    #header{
        width: 100%;
    }
    #footer{
        width: 100%;
    }
#teacherNameSpecialityBlock {
    
    display: flex;
    margin-top: 10px;
    width: 20%;
    flex-direction: column;
    align-items: flex-start;

}
#introHead{
    border-bottom: 1px solid #ccc; 
    width: 10vw;
    color:brown; 
}
#teacherIntro{
    margin-bottom: 30vh;
}
#teacherPic {
    max-width: 80%;
    align-self: center; /* 垂直置中 */
    margin-bottom: 10vh;
    
}

#teacherIntroMessageBlock {
    
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
}
#specialityBlock{
    display:flex;
    flex-direction:column;
    align-items: left;
    margin-top: 5vh;
}
#messageButton{
    margin-top: 8vh;
    margin-bottom: 5vh;

}
#specialityTitle {
    width: 10vw;
    border-bottom: 1px solid #ccc; 
    padding-bottom: 5px; 
    color:brown; 
}
#contactLabel{
    border-bottom: 1px solid #ccc; 
    padding-bottom: 5px;
    color:brown; 
}
#listItem{
    padding-left: 1vw;
}
</style>

</head>
<body>
<div id="header">
<jsp:include page="/front_header.jsp" />
</div>
<section id="navibar">
    <jsp:include page="/desertcourse/navibar.jsp" />
</section>
<%
    TeacherService teacherService = new TeacherService();
    Integer teacherId = Integer.parseInt(request.getParameter("teacherid"));
    TeacherVO teacher = teacherService.getOneTeacher(teacherId);
    List<String> specialityList = teacherService.getOneTeaSpecialityStringList(teacherId);
    byte[] imgBytes = teacher.getTeaPic();
    String base64Img = "";
    if(imgBytes != null){
        base64Img = Base64.getEncoder().encodeToString(imgBytes);
    }
%>
<div id="page-content">
    <div id="teacherBlock">
        <div id="teacherNameSpecialityBlock">
            <div id="teacherName" class=""><h2><%= teacher.getTeaName() %></h2></div>
            <div id="specialityBlock">
                <h3 id="specialityTitle">專長 </h3>
                <ul id="listItem">
                    <% for (String speciality : specialityList) { %>
                        <li><%= speciality %></li>
                    <% } %>
                </ul>
            </div>
            <div id="contactBlock">
                <h3 id="contactLabel">聯絡方式</h3>
                電子信箱: <%= teacher.getTeaEmail() %> <br>
                電話: <%= teacher.getTeaPhone() %>
            </div>
        </div>
        <div id="picBlock">
            <img id="teacherPic" src="data:image/jpeg;base64, <%= base64Img %>" alt="Teacher Image" >
        </div>
        <div id="teacherIntroMessageBlock">
        <div id="teacherIntro">
            <h3 id="introHead">簡介 </h3>
            <%= teacher.getTeaIntro() %>
        </div>
        
        </div>
    </div>
</div>
    <div id="footer">
    <jsp:include page="/front_footer.jsp" />
    </div>
<script>
    $("document").ready(function() {
        $(".message").click(function() {
            var teacherId = $(this).data("field");


        });
    });
</script>
</body>
</html>
