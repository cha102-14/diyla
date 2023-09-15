<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.empmodel.EmpVO" %>
<%@ page import="com.cha102.diyla.empmodel.EmpService" %>
<%@ page import="com.cha102.diyla.empmodel.EmpDAOImpl" %>
<%@ page import="com.cha102.diyla.empmodel.EmpDAO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Base64" %>
<%  
    //取得要顯示的課程資料
    int courseId=Integer.parseInt(request.getParameter("courseid"));
    ClassService classService=new ClassService();
    ClassVO course=classService.getOneClass(courseId);
    pageContext.setAttribute("course", course);
    TeacherService teacherService=new TeacherService();
    TeacherVO teacher = teacherService.getOneTeacher(course.getTeaId());
    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String teacherPic = Base64.getEncoder().encodeToString(teacher.getTeaPic());
    String coursePic = Base64.getEncoder().encodeToString(course.getClassPic());
    //默認使用者type為notAuth
        String type = "notAuth"; 
        EmpService empService = new EmpService();
        EmpDAO empDAO = new EmpDAOImpl();
        //若session並非為null才往下
        Integer empId = (Integer) (session.getAttribute("empId"));
        List<String> typeFun = (List<String>) session.getAttribute("typeFun");
        if(session != null && empId != null &&typeFun != null){
            EmpVO empVO = empDAO.getOne(empId);
            String empName = empVO.getEmpName();
            //進來的是何種使用者
            Object typeFunObj = session.getAttribute("typeFun");
            boolean isTypeFunList = (typeFunObj != null && (typeFunObj instanceof java.util.List));
            if (isTypeFunList) {
                boolean containsMaster = typeFun.contains("MASTER");
                boolean containsAdmin = typeFun.contains("BACKADMIN");
                if (containsMaster && containsAdmin) {
                    type = "BACKADMIN";
                } else if (containsMaster) {
                    type = "MASTER";
                }
            } else {
                type = (String) typeFunObj;
            }
            Integer reqTeacherId = null;
            TeacherVO reqTeacher = null;
            if("BACKADMIN".equals(type)) {
                List<TeacherVO> teacherList = teacherService.getAllTeacher();
                pageContext.setAttribute("teacherList", teacherList);
            } else if ("MASTER".equals(type)) {
                reqTeacher = teacherService.getOneTeacherByEmpId(empId);
                reqTeacherId = reqTeacher.getTeaId();
            }
            pageContext.setAttribute("type", type);
            pageContext.setAttribute("reqTeaId", reqTeacherId);
            pageContext.setAttribute("teacherName", empName);
        } else {
            type = "NOSESSION";
            pageContext.setAttribute("type", type);
        }
    if (course !=null) { %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <jsp:include page="/index.jsp" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>課程詳情</title>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
                crossorigin="anonymous"></script>
            <!-- Custom styles for this template -->
            <link href="${ctxPath}/css/style.css" rel="stylesheet" />
            <!-- responsive style -->

            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="${ctxPath}/js/back.js"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
            <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
            <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/coursedetail_style.css" />
            <style>
            #courseContainer{
                background: #ffe6cc;
                display:flex;
                flex-direction: column;
                align-items: center;
                row-gap:2vh;
                border-radius: 5vw;
                padding: 5vh;
                width: 80%
            }
            #courseName{
                font-size: 2.4rem;
                color: brown;
            }
            #buttonGroup{
                display:flex;
                flex-direction: row;
                column-gap: 5vw;
            }
            .label{
                font-size: 1.2rem;
                color: brown;
            }
            .text{
                font-size: 1.1rem;
                display: inline;
                color: #666699;
            }
            #courseIngredientBlock{
                display:flex;
                flex-direction: column;
                row-gap:1vh;
            }
            #courseIngredientBlock li{
                font-size: 1.1rem;
                color: #666699;
            }
            #contentBlock{
                display:flex;
                flex-direction: column;
                align-items: center;
            }
            #introText{
                font-size: 1.1rem;
                color: #666699;
            }
            #coursePic{
                width: 50%;
            }
            </style>
    </head>

    <body>
    <div id="pageContent">
        <div id="indexBlock">
        </div>
            <div id= "naviContentBlock">
                <div id="naviBlock">
                <jsp:include page="/desertcourse/navibar.jsp" />
                </div>
                <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
                    <h2 id="title" class="title-tag" >課程細節</h2>
                </div>
                <a href="${ctxPath}/desertcourse/listalldesertcoursecalendar.jsp">回到甜點課程日曆表</a>
                <div id="contentBlock">
                    <div id="courseContainer" class="card shadow-lg">
                        <div id="courseName">
                        <h2><%= course.getClassName() %></h2>
                        </div>
                        <div id="coursePic">
                        <img src="data:image/jpeg;base64,<%= coursePic %>" style="width: 100%">
                        </div>
                        <div id="courseCategoryBlock"><strong class="label">課程分類: </strong>
                            <p class="text">
                            <%
                            String categoryStr = "";
                            int category = course.getCategory();
                            if (category == 0) {
                                categoryStr = "糖果";
                            } else if (category == 1) {
                                categoryStr = "蛋糕";
                            } else if (category == 2) {
                                categoryStr = "餅乾";
                            } else if (category == 3) {
                                categoryStr = "麵包";
                            } else if (category == 4) {
                                categoryStr = "法式甜點";
                            } else if (category == 5) {
                                categoryStr = "中式甜點";
                            } else if (category == 6) {
                                categoryStr = "其他";
                            }
                            out.println(categoryStr);
                            %>
                            </p>
                        </div>
                        <div id="courseIngredientBlock">
                            <div id="courseIngredientLabel" class="label">食材:</div> 
                        </div>
                        <div id="courseDateBlock"><strong class="label">課程日期: </strong>
                            <p class="text"><%= course.getClassDate() %></p>
                        </div>
                        <div id="courseEngDateBlock"><strong class="label">報名截止日期: </strong>
                            <p class="text"><%= course.getRegEndTime() %></p>
                        </div>
                        <div id="courseSeqBlock"><strong class="label">課程場次: </strong>
                        <p class="text">
                            <%
                            String classSeqStr = "";
                            int classSeq = course.getClassSeq();
                            if (classSeq == 0) {
                                classSeqStr = "早上";
                            } else if (classSeq == 1) {
                                classSeqStr = "下午";
                            } else if (classSeq == 2) {
                                classSeqStr = "晚上";
                            }
                            out.println(classSeqStr);
                            %>
                        </p>
                        </div>
                        <div id="courseLimitBlock">
                            <strong class="label">課程人數上限: </strong>
                            <p class="text"><%= course.getClassLimit() %></p>
                        </div>
                        <div id="headcountBlock">
                            <strong class="label">目前報名人數: </strong>
                            <p class="text"><%= course.getHeadcount() %></p>
                        </div>
                        <div id="courseStatusBlock">
                            <strong class="label">課程狀態: </strong>
                            <p class="text">
                            <%
                            String courseStatusStr = "";
                            int courseStatus = course.getClassStatus();
                            if (courseStatus == 0) {
                                courseStatusStr = "上架";
                            } else if (courseStatus == 1) {
                                courseStatusStr = "下架";
                            } else if (courseStatus == 2) {
                                courseStatusStr = "已結束報名";
                            }
                            out.println(courseStatusStr);
                            %>
                            </p>
                        </div>
                        <div id="teacherNameBlock"><strong class="label">教師: </strong>
                            <p class="text"><%= teacher.getTeaName() %></p>
                        </div>
                        <div id="courseIntroBlock">
                            <strong class="label">課程簡介: </strong>
                        <div id="introText"><%= course.getIntro() %></div>
                    </div>
                    <div id="buttonGroup">
                        <%  
                            if (courseStatus == 0) {
                        %>
                                <button type="button" id="modifyButton" class="btn btn-warning">修改課程</button>
                                <button type="button" id="deleteButton" class="btn btn-danger">下架課程</button>
                                <button type="button" id="backButton" class="btn btn-success" disabled>上架課程</button>
                        <%
                            } else if (courseStatus == 1) {
                        %>
                                <button type="button" id="modifyButton" class="btn btn-warning">修改課程</button>
                                <button type="button" id="deleteButton" class="btn btn-danger" disabled>下架課程</button>
                                <button type="button" id="backButton" class="btn btn-success">上架課程</button>
                        <%
                            } else {
                        %>
                                <button type="button" id="modifyButton" class="btn btn-warning">修改課程</button>
                                <button type="button" id="deleteButton" class="btn btn-danger" disabled>下架課程</button>
                                <button type="button" id="backButton" class="btn btn-success" disabled>上架課程</button>
                        <%
                            }
                        %>
                    </div>
                </div>
                </div>
            </div>
    </div>
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            //變數區
            var modifyButton = document.getElementById('modifyButton');
            var deleteButton = document.getElementById('deleteButton');
            var backButton = document.getElementById('backButton');
            var ingBlock = document.getElementById('courseIngredientBlock');
            var urlParams = new URLSearchParams(window.location.search);
            var courseId = urlParams.get('courseid');
            var courseTeaId = "${course.teaId}";
            var reqTeaId = "${reqTeaId}";
            var empId = "${empId}";
            var type = "${type}";
            
            //判斷是否有權限做修改
            function isUserHaveAuth() {
                if (type === "BACKADMIN" || type === "MASTER"){
                    return true;
                } else {
                    return false;
                }
            }
            //若後台使用者沒有session或沒有權限
            if(type === "NOSESSION" ){
                setTimeout(function(){
                    window.location.href = "${ctxPath}/emp/empLogin.jsp";
                }, 3000);
                Swal.fire({
                    title: "您未登入，無法瀏覽課程詳情",
                    icon:"warning",
                    confirmButtonText: "確定"
                }).then(function(result) {
                    if(result.isConfirmed) {
                        window.location.href = "${ctxPath}/emp/empLogin.jsp";
                    }
                });
            } else{
            //取得該課程的食材
                var ingString = "";
                fetch("${ctxPath}" + "/getIngredientList?courseId="+ courseId)
                    .then(response => response.json())
                    .then(data => {
                            ingString += "<ol id='ingList'>";
                        data.forEach(ingredient => {
                            ingString += "<li>" + ingredient.name + ": " + ingredient.amount + "克</li>"
                        });
                        ingString += "</ol>"
                        ingBlock.innerHTML += ingString;
                    });
            //重導使用者的function宣告
            function redirect() {
                setTimeout(function(){
                    window.location.href = "${ctxPath}" + "/desertcourse/listalldesertcoursecalendar.jsp";
                }, 3000);
                Swal.fire({
                    title: "您無權限修改課程。",
                    icon:"warning",
                    confirmButtonText: "確定"
                }).then(function(result) {
                    if(result.isConfirmed) {
                        window.location.href = "${ctxPath}" + "/desertcourse/listalldesertcoursecalendar.jsp";
                    }
                });
            }
            //若無權限則將該位使用者導向其他頁面
            if(!isUserHaveAuth()) {
                redirect();
            }
            //兩顆按鈕的事件處理
            modifyButton.addEventListener('click', function () {
                if(type === "BACKADMIN" || courseTeaId === reqTeaId){
                    window.location.href = "${ctxPath}"+'/verifyCourseAction?action=modify&courseId=' + courseId;
                } else {
                    redirect();
                }
            });
            deleteButton.addEventListener('click', function() {
                if(type === "BACKADMIN" || courseTeaId === reqTeaId){
                    Swal.fire({
                        title: "確定要下架課程嗎?",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonText: "確定",
                        cancelButtonText: "取消"
                    }).then(function(result){
                        if(result.isConfirmed) {
                            fetch("${ctxPath}"+'/verifyCourseAction?action=delete&courseId=' + courseId)
                            .then(response => response.json())
                            .then(data => {
                                if(data.isAllowed === true) {
                                    setTimeout(function(){
                                        window.location.reload();
                                    }, 3000);
                                    Swal.fire({
                                        title: "課程下架成功",
                                        icon:"success",
                                        confirmButtonText: "確定"
                                    }).then(function(result) {
                                        if(result.isConfirmed) {
                                            window.location.reload();
                                        }
                                    });
                                } else{
                                    Swal.fire({
                                        title: "課程下架失敗",
                                        icon:"error",
                                        confirmButtonText: "確定"
                                    }).then(function(result) {
                                        if(result.isConfirmed) {
                                            window.location.reload();
                                        }
                                    });
                                }
                            });
                        }
                    });
                } else {
                    redirect();
                }
            });
            backButton.addEventListener('click', function(){
                if(type === "BACKADMIN" || courseTeaId === reqTeaId){
                    Swal.fire({
                        title: "確定要上架課程嗎?",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonText: "確定",
                        cancelButtonText: "取消"
                    }).then(function(result){
                        if(result.isConfirmed) {
                            fetch("${ctxPath}"+'/verifyCourseAction?action=back&courseId=' + courseId)
                            .then(response => response.json())
                            .then(data => {
                                if(data.isAllowed === true) {
                                    setTimeout(function(){
                                        window.location.reload();
                                    }, 3000);
                                    Swal.fire({
                                        title: "課程上架成功",
                                        icon:"success",
                                        confirmButtonText: "確定"
                                    }).then(function(result) {
                                        if(result.isConfirmed) {
                                            window.location.reload();
                                        }
                                    });
                                } else {
                                        Swal.fire({
                                        title: "課程上架失敗",
                                        icon:"error",
                                        confirmButtonText: "確定"
                                    }).then(function(result) {
                                        if(result.isConfirmed) {
                                            window.location.reload();
                                        }
                                    });
                                }
                            });
                        }
                    });
                } else {
                    redirect();
                }

            });
            }
        });
    </script>

    </html>
    <% } else { out.println("Course not found."); } %>