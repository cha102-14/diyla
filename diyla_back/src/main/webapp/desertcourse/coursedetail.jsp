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
        if(session != null){
            Integer empId = (Integer) (session.getAttribute("empId"));
            EmpVO empVO = empDAO.getOne(empId);
            String empName = empVO.getEmpName();
            //進來的是何種使用者
            Object typeFunObj = session.getAttribute("typeFun");
            boolean isTypeFunList = (typeFunObj != null && (typeFunObj instanceof java.util.List));
            if (isTypeFunList) {
                List<String> typeFun = (List<String>) session.getAttribute("typeFun");
                boolean containsMaster = typeFun.contains("MASTER");
                boolean containsAdmin = typeFun.contains("ADMIN");
                if (containsMaster && containsAdmin) {
                    type = "ADMIN";
                } else if (containsMaster) {
                    type = "MASTER";
                }
            } else {
                type = (String) typeFunObj;
            }
            Integer reqTeacherId = null;
            TeacherVO reqTeacher = null;
            if("ADMIN".equals(type)) {
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
            <link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="${ctxPath}/js/back.js"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
            <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
            
            
    </head>

    <body>
    <div id="pageContent">
            <div id="indexBlock">

            </div>
            <div id="naviBlock">
                <jsp:include page="/desertcourse/navibar.jsp" />
            </div>
                    <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
                        <h2 id="title" class="title-tag" >課程細節</h2>
                    </div>
            <div id="contentBlock">
<div id="coursecontainer">
        <h1><%= course.getClassName() %></h1>
        <p>
            <img src="data:image/jpeg;base64,<%= coursePic %>">
        </p>
    <div id="courseCategoryBlock"><strong>課程分類: </strong>
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
    </div>

    <div id="courseDateBlock"><strong>課程日期: </strong>
    <%= course.getClassDate() %>
    </div>

    <div id="courseSeqBlock"><strong>課程場次: </strong>
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
    </div>
    <div id="courseLimitBlock">
    <strong>課程人數上限: </strong>
    <%= course.getClassLimit() %>
    </div>
    <div id="headcountBlock">
    <strong>目前報名人數: </strong>
    <%= course.getHeadcount() %>
    </div>
    <div id="courseStatusBlock">
    <strong>課程狀態: </strong>
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
    </div>
    <div id="courseIntroBlock">
    <strong>課程簡介: </strong>
    <div id="introText"><%= course.getIntro() %></div>
    </div>
</div>
</div>
</div>
        <!-- Add more fields as needed -->
        <div id="teacherContainer">
            <img src="data:image/jpeg;base64,<%= teacherPic%>">
        <div id="teacherNameBlock"><strong>教師: </strong>
            <%= teacher.getTeaName() %>
        </div>
        <div id="teacherIntroBlock"><strong>教師簡介: </strong>
            <%= teacher.getTeaIntro() %>
        </div>
        </div>

            <button type="button" id="modifyButton">修改課程</button>
            <button type="button" id="deleteButton">刪除課程</button>

        <a href="${ctxPath}/desertcourse/listalldesertcoursecalendar.jsp">回到甜點課程日曆表</a>

            </section>
            </div>
            </div>
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var modifyButton = document.getElementById('modifyButton');
            var deleteButton = document.getElementById('deleteButton');
            var urlParams = new URLSearchParams(window.location.search);
            var courseId = urlParams.get('courseid');
            var courseTeaId = "${course.teaId}";
            var reqTeaId = "${reqTeaId}";
            var empId = "${empId}";
            var type = "${type}";
            //判斷是否有權限做修改
            function isUserHaveAuth() {
                if (type === "ADMIN" || type === "MASTER"){
                    return true;
                } else {
                    return false;
                }
            }
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
            //兩顆按鈕的事件處理
            modifyButton.addEventListener('click', function () {
                if(type === "ADMIN" || courseTeaId === reqTeaId){
                    window.location.href = "${ctxPath}"+'/verifyCourseAction?action=modify&courseId=' + courseId;
                } else {
                    redirect();
                }
            });
            deleteButton.addEventListener('click', function() {
                if(type === "ADMIN" || courseTeaId === reqTeaId){
                    window.location.href = "${ctxPath}"+'/verifyCourseAction?action=delete&courseId=' + courseId;
                } else {
                    redirect();
                }
            });
        });
    </script>

    </html>
    <% } else { out.println("Course not found."); } %>