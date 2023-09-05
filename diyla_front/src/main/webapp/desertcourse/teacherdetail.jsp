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
<style>
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
        font-family: 'Lato', sans-serif;
    }

    #page-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px;
        max-width: 1200px;
        width: 100%;
    }

    #teacherBlock {
        display: flex;
        flex-direction: row; /* 將內容水平排列 */
        gap: 10px;
        width: 100%;
        font-family: 'Lato', sans-serif;
    }

    #header{
        width: 100%;
    }
    #footer{
        width: 100%;
    }
#teacherNameSpecialityBlock {
    order: 1;
    display: flex;
    margin-top: 10px;
    width: 220px;
    flex-direction: column;
    align-items: flex-start;

}

#teacherPic {
    order: 2;
    max-width: 100%;
    align-self: center; /* 垂直置中 */
}

#teacherIntroMessageBlock {
    order: 3;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
}
#specialityBlock{
    margin-top: 50px;
}
#messageButton{
    margin-top: 50px;

}
#specialityTitle {
    width: 200px;
    border-bottom: 1px solid #ccc; /* 添加淡灰色底边线 */
    padding-bottom: 5px; /* 可选：增加一些底边距以隔开 */
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
    String base64Img = Base64.getEncoder().encodeToString(imgBytes);

%>
<div id="page-content">
    <div id="teacherBlock">

        <img id="teacherPic" src="data:image/jpeg;base64, <%= base64Img %>" alt="Teacher Image">

        <div id="teacherNameSpecialityBlock">
        <div id="teacherName"><h3><%= teacher.getTeaName() %></h3></div>
        <div id="specialityBlock">
            <h3 id="specialityTitle">專長 </h3>
            <ul>
                <% for (String speciality : specialityList) { %>
                    <li><%= speciality %></li>
                <% } %>
            </ul>
        </div>
        </div>
        <div id="teacherIntroMessageBlock">
        <div id="teacherIntro">
            <h3 id="introHead">簡介 </h3>
            <%= teacher.getTeaIntro() %>
        </div>
          <button type="button" class="btn btn-outline-secondary" id="messageButton">發送訊息</button>
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
