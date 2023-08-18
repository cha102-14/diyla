<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊師傅</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <form>
     <form action="/diyla_front/registerMasterServlet" method="post">
        <label for="name">師傅名稱：</label>
        <input type="text" id="name" name="teaName" required><br>

        <label for="gender">性別：</label>
        <select id="gender" name="teaGender">
            <option value="0">男</option>
            <option value="1">女</option>
        </select><br>

        <label for="phone">電話：</label>
        <input type="tel" id="phone" name="teaPhone" required><br>

        <label for="intro">簡介：</label>
        <textarea id="intro" name="teaIntro" rows="4" required></textarea><br>

        <label for="email">電子郵件：</label>
        <input type="email" id="email" name="teaEmail" required><br>

        <input type="submit" value="註冊">
    </form>
    </form>

    <script>
        $(document).ready(function () {

            })
    </script>

</body>

</html>