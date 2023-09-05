<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    Integer memId=(Integer)session.getAttribute("memId");
    MemberService memSvc = new MemberService();
    MemVO memVO = memSvc.selectMem(memId);
    pageContext.setAttribute("memVO",memVO);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聯絡我們</title>
    <style>
/* 整體樣式 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

us_container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

/* 表單樣式 */
form.form{
    background-color: #f8f8f8;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

label.label {
    display: inline-block;
    margin-bottom: 10px;
    font-weight: bold;
}

input.input[type="text"],
textarea.textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
    margin-bottom: 15px;
}

select.select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
    margin-bottom: 15px;
}

input.input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
}

input.input[type="submit"]:hover {
    background-color: #0056b3;
}

.contact-form {
    margin-top: 50px;
}

/* SweetAlert2 樣式調整 */
.swal2-popup {
    font-size: 16px;
}

.swal2-title {
    font-weight: bold;
}

.swal2-content {
    white-space: pre-line;
}
    </style>
</head>

<body>
    <jsp:include page="/front_header.jsp" />
    <div class="us_container" >
    <FORM METHOD="post" ACTION="ContactUsController" class="form">
        <label  class="label">會員名字:</label><input class="input" type="text" name="memName" value="${memVO.memName}"><br>
        <label  class="label">會員信箱:</label><input class="input" type="text" name="memEmail" value="${memVO.memEmail}"><br>
        <label  class="label">問題類別:</label>
        <select name="category" class="select">
            <option value="class">課程</option>
            <option value="DIY">DIY</option>
            <option value="shop">商店</option>
            <option value="article">討論區</option>
            <option value="other">其他</option>
        </select><br>
        <label  class="label">問題標題:</label>
        <input class="input" id="mailTitle" type="text" name="mailTitle"><br>
        <label  class="label">問題反應:</label>
        <textarea  id="mailContext" name="mailContext" class="textarea" cols="30" rows="10"></textarea>
        <input class="input" type="hidden" name="action" value="send_mail">
        <input class="input" id="send" type="button" value="送出新增" onclick="send_Email()">
        <input id="submit" type="submit" value="送出新增" style="display: none">
    </form>
    </div>
    <jsp:include page="/front_footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
     <script>
         var submit = document.getElementById('submit');
         var send = document.getElementById('send');
         var mailTitle = document.getElementById('mailTitle');
         var mailContext = document.getElementById('mailContext');
         function send_Email() {
Swal.fire({
    title: "寄信內容(如下)",
    html: '<div style="white-space: pre-line;">問題標題:' + mailTitle.value + '\n問題內容:' + mailContext.value + '</div>',
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "是",
    cancelButtonText: "取消",
}).then((result) => {
    if (result.isConfirmed) {
        // 在這裡執行您想要的操作，然後關閉對話框
        Swal.fire({
            icon: "success",
            title: "送出成功！",
            showConfirmButton: false,
        });
        submit.click();
    } else {
        console.log('取消發送');
    }
});
}
     </script>
</body>

</html>