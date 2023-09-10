<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>甜點課程列表</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/findclasslist.css">
</head>

<body>
<div>
<jsp:include page="/front_header.jsp" />
</div>
<section id="navibar">
<jsp:include page="/desertcourse/navibar.jsp" />
</section>
<div id="pageContent">
    <div id="title">
        <h2 >甜點課程列表</h2>
    </div>
    <div id="courseCatContainer">
    <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link active categoryTab" data-category="-1" aria-current="page" href="#">全部</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active categoryTab" data-category="0" aria-current="page" href="#">糖果</a>
        </li>
        <li class="nav-item">
          <a class="nav-link categoryTab" data-category="1" href="#">蛋糕</a>
        </li>
        <li class="nav-item">
          <a class="nav-link categoryTab" data-category="2" href="#">餅乾</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="3" href="#">麵包</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="4" href="#">法式點心</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="5" href="#">中式甜點</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="6" href="#">其它</a>
        </li>
      </ul>
    </div>
<div id= "courseContainer">
</div>
</div>
    <div id="footer">
        <jsp:include page="/front_footer.jsp" />
    </div>
</body>
<script>
    $(document).ready(function() {
    function loadCourses(catId = -1) {
$.ajax({
    url: '${ctxPath}/getDesertCourse',
    method: 'GET',
    data: { categoryId: catId },
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    dataType: 'json',
    success: function (data) {
        var courseContainer = $('#courseContainer');
        $('#courseContainer').empty();
        var rowContainer = $('<div class="row"></div>');

        data.forEach(function (course, index) {

            var courseCardHtml = '<div class="col-md-4 col-sm-6 col-lg-4 wow fadeInUp">'; // 使用 col-md-4 来确保每行显示3个卡片
            courseCardHtml += '<div class="card">';
            courseCardHtml += '<img style="height: 40vh;"class="card-img-top" src="data:image/jpeg;base64,' + course.coursePic + '" alt="' + course.courseName + '">';
            courseCardHtml += '<div class="card-body">';
            courseCardHtml += '<h5 class="card-title">' + course.courseName + '</h5>';
            courseCardHtml += '<p class="card-text">上課時間: ' + course.courseDate + " " + course.courseSeq + '</p>';
            courseCardHtml += '<p class="card-text">報名截止日期: ' + course.regEndDate + '</p>';
            courseCardHtml += '<p class="card-text">課程簡介: ' + course.courseIntro + '</p>';
            courseCardHtml += '<button class="detailButton" data-courseid='+ course.courseId+'>課程詳情</button>'
            courseCardHtml += '</div>';
            courseCardHtml += '</div>';
            courseCardHtml += '</div>';


            rowContainer.append(courseCardHtml);

            if ((index + 1) % 3 === 0 || index === data.length - 1) {
                courseContainer.append(rowContainer);
                rowContainer = $('<div class="row"></div>');
            }
        });
    },
    error: function () {
        console.log('Error fetching course data');
    }
});


        }
        loadCourses();
    $('#courseCatContainer').on('click', '.categoryTab', function(){
        var category = $(this).data('category');
        loadCourses(category);
    });
    });
        $('#courseContainer').on('click', '.detailButton', function(){
        var courseId = $(this).data('courseid');
        window.location.href = 'classdetail.jsp?id=' + courseId;
    });
</script>
</html>
