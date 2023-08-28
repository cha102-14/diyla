<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctxPath}/css/addart.css">
    <title>新增論壇文章</title>
</head>

<body class="addbody">
    <jsp:include page="/front_header.jsp" />
    <jsp:include page="/art/art_header.jsp" />

    <div class="art_container">
        <div class="form-container">
            <h1 class="addarth1">新增論壇文章</h1>
            <form method="post" action="ArtController" onsubmit="return send()" id="addart"
                enctype="multipart/form-data">
                <c:if test="${not empty ErrorMessage}">
                    <ul class="error">
                        <c:forEach items="${ErrorMessage}" var="error">
                            <li>${error.message}</li>
                        </c:forEach>
                    </ul>
                </c:if>
                <table id="art_table">
                    <tr>
                        <td class="td1">文章標題</td>
                        <td class="td2">
                            <textarea name="artTitle" id="artTitle" rows="2" cols="40"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">文章內容</td>
                        <td class="td2">
                            <textarea name="artContext" id="artContext" rows="4" cols="40"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">公告圖片</td>
                        <td class="td2">
                            <input id="addimg" type="file" name="artPic" accept="image/*" onchange="preImg()">
                            <div id="imagePreview"></div>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="memId" value="${memId}">
                <input type="hidden" name="action" value="art_insert">
                <input id="send" type="button" value="送出新增" onclick="add_art()">
                <input id="submit" type="submit" value="送出新增" style="display: none">
            </form>
        </div>
    </div>

    <jsp:include page="/front_footer.jsp" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function add_art() {
            if (!document.querySelector("#addimg").files[0]) {
                swal("確定不新增照片?", "請按確定送出或按取消返回", {
                    dangerMode: true,
                    buttons: ["取消", "確定"],
                }).then((confirm) => {
                    if (confirm) {
                        // 使用者按下了 "確定" 按鈕，執行表單送出
                        document.querySelector("#submit").click();
                    } else {
                        // 使用者按下了 "取消" 按鈕，不執行任何操作，讓使用者保留在頁面
                    }
                });
            } else {
                document.querySelector("#submit").click();
            }
        }
        function preImg() {
            const preDiv = document.querySelector("#imagePreview");
            const addimg = document.querySelector("#addimg");

            if (addimg.files && addimg.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.createElement("img");
                    img.src = e.target.result;
                    img.style.maxWidth = "100%";
                    img.style.height = "auto";
                    preDiv.innerHTML = "";
                    preDiv.appendChild(img);
                };
                reader.readAsDataURL(addimg.files[0]);
            } else {
                preDiv.innerHTML = "";
            }
        }
    </script>
</body>

</html>