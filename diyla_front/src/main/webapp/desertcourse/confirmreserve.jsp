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
    <title>訂單確認</title>
    <%
    String courseId = request.getParameter("courseId");
    String headcount = request.getParameter("headcount");
    %>
    <%
    //設置usersession讓後面java程式取用,當作登入模擬
    session.setAttribute("userSession", true);
    %>
</head>
<body>
         <c:if test="${userSession}">
        <!-- 如果已登入，顯示課程及報名人數資訊 -->
        <div id="courseInfoContainer">
            <!-- 這裡可以放置你想要顯示的課程資訊內容 -->
        </div>
    </c:if>
        <c:if test="${not userSession}">
            <!-- 未登入狀態下顯示提示信息 -->
            <script>
                alert("請登入或註冊後再使用!");
                setTimeout(function() {
                    window.location.href = "login.jsp"; // 5秒後跳轉到登入頁面
                }, 5000);
            </script>
        </c:if>
</body>
<script>
$(document).ready(function () {
    var courseId = '<%= courseId %>';
    var headcount = '<%= headcount %>';
    if(${userSession}){
        let formUrlData = new URLSearchParams();
        formUrlData.append("courseId", '<%= courseId %>')
        fetch('/diyla_front/getOneClassServlet',{
            method: "post",
            body: formUrlData
        })
        .then (function (response) {
            return response.json();
        })
        .then (function (courseInfo) {
            let courseInfoHtml = '';
                courseInfoHtml += "<p id='coursename'>課程名稱: " + courseInfo.courseName + "</p>";
                courseInfoHtml += "<p id='coursedate'>課程時間: " + courseInfo.courseDate + "</p>";
                courseInfoHtml += "<p id='headcount'>報名人數: " + headcount + "</p>";
                courseInfoHtml += "<p id='headcount'>總金額: " + (headcount * courseInfo.coursePrice) + "</p>";
                courseInfoHtml += "<button type=button id=confirmreserve>確定報名</button>";
                courseInfoHtml += "<button type=button id=cancel>取消報名</button>";
                $("#courseInfoContainer").append(courseInfoHtml);
        })
        .catch(function(error){
            console.error("Error", error);
        });
    }
    $("#courseInfoContainer").on("click", "#confirmreserve", function(){
        var reserveInfo = {
            courseId: courseId,
            headcount: headcount
        };
        console.log(reserveInfo);
        fetch('/diyla_front/createReserveServlet', {
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
            if(result.isSuccessful){
                alert("訂單建立成功!");
            } else {
                alert("訂單建立失敗! " + result.message);
            }
        })
        .catch(function(error){
            console.error("Error", error);
        });
    })
});
</script>
</html>

