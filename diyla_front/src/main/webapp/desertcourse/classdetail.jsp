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
    <script src="https://kit.fontawesome.com/2140fe5a67.js" crossorigin="anonymous"></script>
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
#courseInfoBlock{
    display:flex;
    flex-direction: column;
    align-items: center;
    width: 40vw;
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
    
    font-size: 1.2rem;
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
#introLabel{
    color: brown;
    font-size: 1.5rem;
    margin-bottom: 3vh;
}
#buttonGroup{
    display:flex;
    align-items: center;
    justify-content: center;
}
.registerLabel{
    font-weight: bold;
    font-size: 1.2rem;
    color: brown;
    white-space: nowrap;
}
.teacherLabel{
    color: brown;
    font-size: 1.4rem;
    white-space: nowrap;
}
.teacherText{
    font-size: 1.2rem;
}
#coursePicBlock{
    border: 1px solid gray;
    border-radius: 2vw;
    padding: 3px;
}
.fix-pic{
    border-radius: 2vw;
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
                        <h2 id="teacherLabel">授課教師</h2>
                    </div>
                    <div id="teacherImgBlock" >
                        <img id="teaImg" src="data:image/jpeg;base64,<%= teacherPic%>" style="width: 100%;">
                    </div>
                    <div id="teacherNameBlock"><strong class="teacherLabel">教師: </strong>
                        <span class="teacherText"><%= teacher.getTeaName() %></span>
                    </div>
                    <div id="teacherIntroBlock"><strong class="teacherLabel">教師簡介: </strong>
                        <span class="teacherText"><%= teacher.getTeaIntro() %>
                    </div>
                </div>
                <div id="courseContainer">
                <div id="courseInfoBlock">        
                    <div id="coursePicBlock">
                            <p>
                                <img class="fix-pic" src="data:image/jpeg;base64,<%= coursePic %>">
                            </p>
                    </div>
                    <div id="courseIntroBlock">
                    <strong id="introLabel">課程簡介: </strong>
                    <div id="introText" class="text"><%= course.getIntro() %></div>
                    </div>
                </div>
                </div>

                    <div id = "registerBlock" class="card">
                    <div id="courseNameBlock" >
                        <h2 class="card-title"><%= course.getClassName() %></h2>
                    </div>
                    <div id="courseDateBlock" ><i class="fa-regular fa-calendar-days" style="color: #e8b52c;"></i><strong class="registerLabel">課程日期: </strong>
                    <span class="registerText"><%= course.getClassDate() %></span>
                    </div>
                    <div id="courseSeqBlock"><i class="fa-regular fa-clock" style="color: #e8b52c;"></i><strong class="registerLabel">課程場次: </strong>
                    <span class="registerText">
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
                    </span>
                    <div id="courseEndDateBlock"><i class="fa-regular fa-calendar" style="color: #e8b52c;"></i>
                    <strong class="registerLabel">報名截止日期: </strong> <span class="registerText"><%= course.getRegEndTime() %></span>
                    </div>
                    </div>
                        <div id="priceText" class="text"><i class="fa-solid fa-dollar-sign" style="color: #e8b52c;"></i><strong class="registerLabel">課程價格: </strong><%= course.getPrice() %>(元/每人)</div>
                        <div id="courseLimitBlock"><i class="fa-solid fa-user-group" style="color: #e8b52c;"></i>
                        <strong class="registerLabel">課程人數上限: </strong>
                        <%= course.getClassLimit() %>
                        </div>
                        <div id="headcountBlock"><i class="fa-solid fa-user-large" style="color: #e8b52c;"></i>
                        <strong class="registerLabel">已報名人數: </strong>
                        <%= course.getHeadcount() %>
                        </div>
                        <div id="headcountInput"><i class="fa-solid fa-person-circle-plus" style="color: #e8b52c;"></i>
                        <strong class="registerLabel">欲報名人數: </strong><input id="registerHeadcount" type="number" min="1" max="100" step="1">
                        </div>
                        <div id="buttonGroup">
                        <%
                            if(course.getClassStatus() == 2) {
                            out.print("<button type=\"button\" class=\"btn btn-warning\" id=\"registerButton\" disabled>報名已截止</button>");
                        } else {
                            out.print("<button type=\"button\" class=\"btn btn-primary\" id=\"registerButton\">報名課程</button>");
                        }
                        %>
                        </div>
                    </div>
                </div>
        <a href="findclasslist.jsp" style="font-size: 24px; margin-top: 10vh;">返回課程列表</a>
        </div>
        <jsp:include page="/front_footer.jsp" />
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var registerButton = document.getElementById('registerButton');
            var urlParams = new URLSearchParams(window.location.search);
            var courseId = urlParams.get('id');
            var courseStatus = "${course.classStatus}";
            console.log(courseStatus);
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