<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
    <title>甜點課程預約單確認</title>
    <%
    String courseId = request.getParameter("courseId");
    String headcount = request.getParameter("headcount");
    %>
    <%
    //設置usersession讓後面el程式碼取用,判斷有無登入
    Integer memId = (Integer)session.getAttribute("memId");
    if (memId != null){
    session.setAttribute("userSession", true);
    } else {
        session.setAttribute("userSession", false);
    }
    %>
    <style>
             #pageContent{
            display: flex;
            flex-direction: column;
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
        #buttonGroup {
            display: flex;
            flex-direction: row;
            column-gap: 2vw;
        }
        #courseInfoContainer{
            display: flex;
            flex-direction: column;
            border-radius: 3vh;
            background:#ffe6b3;
            margin-bottom: 10vh;
            align-items: center;
            padding: 20px;
        }
        .regInfo{
            margin: 3vh;
            display: block;
        }
        .coursePic{
            height: 40vh;
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
        <h2 id="title" class="title-tag" >確認訂單</h2>
    </div>
        <div id="courseInfoContainer" class="shadow-lg"></div>
</div>
        <jsp:include page="/front_footer.jsp" />
</body>
<script>
$(document).ready(function () {
    var courseId = '<%= courseId %>';
    var headcount = '<%= headcount %>';
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
        }
    }
    isLogIn();
    if(${userSession}){
        let formUrlData = new URLSearchParams();
        formUrlData.append("courseId", '<%= courseId %>')
        fetch('${ctxPath}/getOneClassServlet',{
            method: "post",
            body: formUrlData
        })
        .then (function (response) {
            return response.json();
        })
        .then (function (courseInfo) {
            let courseInfoHtml = '';
                courseInfoHtml += "<img src='data:image/jpeg;base64," + courseInfo.coursePic + "' alt='課程' class='coursePic'>";
                courseInfoHtml += "<strong class='regInfo' id='coursename'>課程名稱: " + courseInfo.courseName + "</strong>";
                courseInfoHtml += "<strong class='regInfo' id='coursedate'>課程時間: " + courseInfo.courseDate + "</strong>";
                courseInfoHtml += "<strong class='regInfo' id='headcount'>報名人數: " + headcount + "</strong>";
                courseInfoHtml += "<strong class='regInfo' id='headcount'>總金額: " + (headcount * courseInfo.coursePrice) + "</strong>";
                courseInfoHtml += "<div id='buttonGroup'><button type=button class='btn btn-success' id=confirmreserve>確定報名</button>";
                courseInfoHtml += "<button type=button class='btn btn-warning' id=cancelreserve>取消報名</button></div>";
                $("#courseInfoContainer").append(courseInfoHtml);
        })
        .catch(function(error){
            console.error("Error", error);
        });
    }
    $("#courseInfoContainer").on("click", "button", function(){
        if($(this).is("#cancelreserve")) {
        Swal.fire({
            title: "確定取消報名嗎?",
            icon:"warning",
            confirmButtonText: "確定"
        }).then(function(result) {
            if(result.isConfirmed) {
                window.history.back();
            }
        });
        } else{
        //避免重複按按鈕
        $(this).prop("disabled", true);
        isLogIn();
        var reserveInfo = {
            courseId: courseId,
            headcount: headcount
        };
        console.log(reserveInfo);
        fetch('${ctxPath}/createReserveServlet', {
            method: "post",
            header: {
                "content-type" : "application/json"
            },
            body: JSON.stringify(reserveInfo)
        })
        .then(function(response){
            return response.json();
        })
        .then(function(result){
            //恢復按鈕功能
             $("#confirmreserve").prop("disabled", false);
            if("true" === result.isSuccessful){
                Swal.fire({
                    title: "訂單建立成功!",
                    icon: "success",
                    confirmButtonText: "確定"
                }).then(function(check){
                    setTimeout(function() {
                    window.location.href = "${ctxPath}"+"/desertcourse/memclassreserve.jsp";
                    }, 3000);
                    if(check.isConfirmed) {
                        window.location.href = "${ctxPath}"+"/desertcourse/memclassreserve.jsp";
                    }
                });
            } else {
                Swal.fire({
                    title: "訂單建立失敗! " + result.message,
                    icon: "warning",
                    confirmButtonText: "確定"
                }).then(function(check){
                    setTimeout(function(){
                        window.location.href = "${ctxPath}"+"/desertcourse/findclasslist.jsp";
                    }, 3000);
                    if(check.isConfirmed) {
                        window.location.href = "${ctxPath}"+"/desertcourse/findclasslist.jsp";
                    }
                });
            }
        })
        .catch(function(error){
             $("#confirmreserve").prop("disabled", false);
            console.error("Error", error);
        });
        }
    });
});
</script>
</html>

