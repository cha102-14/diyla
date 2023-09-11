<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Base64" %>
<%
    int courseId=Integer.parseInt(request.getParameter("id"));
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <style>
#pageContent{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
#courseDetailBlock{
    display:flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}
        .title-tag {
    position: relative;
    padding: 1rem 2rem calc(1rem + 10px);
    background: #ffd9b3;
  }
  .title-tag:before {
    position: absolute;
    top: -7px;
    left: -7px;
    width: 100%;
    height: 100%;
    content: '';
    border: 4px solid #000;
  }
  #teacherContainer {
    
  }
  #courseContainer {
    margin-left: 0vw;
    margin-right: 0vw;
    
  }
  #courseDetailBlock{
    width: 93%;
    
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    font-size: 24px;
  }

  #teacherContainer{
    width: 20%;
    height: 20%;
    align-items: center;
    font-size: 20px;
  }

#registerBlock{
    width: 20%;
    height: 20%;
    justify-content: center;
    align-items: center;
    font-size: 20px;
}
.fix-pic {
    height: 60vh;
}
#courseNameBlock{
    background: #ffffcc; 
    width:100%;
    text-align: center;
    border-bottom: 1px solid #ccc;  
}
#headcountInput{
    margin-bottom:5px;
}
#registerHeadcount{
    width: 5vw;
}
    </style>
    </head>

    <body>
        <jsp:include page="/front_header.jsp" />
        <section id="navibar">
        <jsp:include page="/desertcourse/navibar.jsp" />
        </section>
        <div id="pageContent">
                <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
                <h2 id="title" class="title-tag" >課程詳情</h2>
                </div>
            <div id="courseDetailBlock">
                <div id="teacherContainer" class="card">
                    <div id="teacherLabelBlock">
                        <h3 id="teacherLabel">授課教師</h3>
                    </div>
                    <div id="teacherImgBlock" >
                        <img id="teaImg" src="data:image/jpeg;base64,<%= teacherPic%>">
                    </div>
                    <div id="teacherNameBlock"><strong>教師: </strong>
                        <%= teacher.getTeaName() %>
                    </div>
                    <div id="teacherIntroBlock"><strong>教師簡介: </strong>
                        <%= teacher.getTeaIntro() %>
                    </div>
                </div>
                <div id="courseContainer">
                <div id="coursePicBlock">
                        <p>
                            <img class="fix-pic" src="data:image/jpeg;base64,<%= coursePic %>">
                        </p>
                </div>
                <div id="courseInfoBlock">        
                    <div id="courseIntroBlock">
                    <strong>課程簡介: </strong>
                    <div id="introText" class="text"><%= course.getIntro() %></div>
                    </div>
                </div>
                </div>

                    <div id = "registerBlock" class="card">
                    <div id="courseNameBlock" >
                        <h2 class="card-title"><%= course.getClassName() %></h2>
                    </div>
                    <div id="courseDateBlock" ><strong>課程日期: </strong>
                    <%= course.getClassDate() %>
                    </div>
                    <div id="courseSeqBlock"><strong>課程場次: </strong>
                    <%
                    String classSeqStr = "";
                    int classSeq = course.getClassSeq();
                    if (classSeq == 0) {
                        classSeqStr = "早上 (09:00 ~ 12:00)";
                    } else if (classSeq == 1) {
                        classSeqStr = "下午 (13:00 ~ 16:00)";
                    } else if (classSeq == 2) {
                        classSeqStr = "晚上 (18:00 ~ 21:00)";
                    }
                    out.println(classSeqStr);
                    %>
                    </div>
                        <div id="priceText" class="text"><strong>課程價格: </strong><%= course.getPrice() %>(元/每人)</div>
                        <div id="courseLimitBlock">
                        <strong>課程人數上限: </strong>
                        <%= course.getClassLimit() %>
                        </div>
                        <div id="headcountBlock">
                        <strong>已報名人數: </strong>
                        <%= course.getHeadcount() %>
                        </div>
                        <div id="headcountInput">
                        <strong>欲報名人數: </strong><input id="registerHeadcount">
                        </div>
                        <button type="button" class="btn btn-primary" id="registerButton">報名課程</button>
                    </div>
                </div>
        <a href="findclass.jsp" style="font-size: 24px; margin-top: 10vh;">返回課程列表</a>
        </div>
        <jsp:include page="/front_footer.jsp" />
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var registerButton = document.getElementById('registerButton');
            var urlParams = new URLSearchParams(window.location.search);
            var courseId = urlParams.get('id');

                function isLogIn() {
                var memId = "${memId}";
                if(memId === '') {
                        // 啟動定時器，3秒後導航到其他網頁
                        setTimeout(function() {
                        window.location.href = "${ctxPath}/member/mem_login.jsp";
                        }, 3000); 
                        Swal.fire({
                            title: "您尚未登入，請登入。",
                            icon: "warning",
                            confirmButtonText: "確定"
                        }).then(function(result){
                            if(result.isConfirmed) {
                                window.location.href="${ctxPath}/member/mem_login.jsp";
                            }
                        });
                        return false;
                }
                return true;
            }
            registerButton.addEventListener('click', function () {
                if (isLogIn()) {
                    window.location.href = 'confirmreserve.jsp?courseId=' + courseId + '&headcount=' +$('#registerHeadcount').val();
                }
            });
        });
    </script>

    </html>
    <% } else { out.println("找不到課程!"); } %>