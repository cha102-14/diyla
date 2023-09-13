<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Base64"%>
<%@ page import="redis.clients.jedis.Jedis"%>
    <jsp:include page="/index.jsp" />
<%
    Jedis jedis = new Jedis("localhost", 6379);
    String content = jedis.get("content");
    String image_src = jedis.get("image");
%>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
    <title>AboutUs</title>
    <link rel="stylesheet" href="${ctxPath}/css/style.css">

    <style>
        body {
            margin-left: 280px;
            height: 1vw;
        }

        main#main {
            display: none;
        }

        h1#aboutus {
            font-size: 30px;
            background-color: #b45f06;
            height: 70px;
            line-height: 70px;
            color: white;
            padding: 0 0 0 10px;
        }

        h2 {
            font-size: 40px;
            margin: 0 0 15px 0;
        }

        div.column {
            display: flex;
            align-items: center;
            margin: 50px 30px;
            height: calc(100% - 90px);
        }

        img#imagePre {
            width: 50%;
        }

        div.text {
            width: 50%;
            padding: 30px;
            line-height: 30px;
        }

        .button-container {
            position: absolute;
            top: 80px;
            right: 25px;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        button {
            background-color: bisque;
            display: sticky;
        }
    </style>
</head>

<body>

    <h1 id="aboutus">關於我們</h1>
    <div class="container">
        <div class="column">
            <img id="imagePre" src="<%= image_src %>" alt="圖片1"><br>

            <div class="text">
                <h2> About Us </h2>
                <span id="editContent" contenteditable="false">
                    <%= content %>
                </span>
                <br><br>
                <div class="button-container">
                    <button type="button" id="edit"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                            fill="currentColor" className="w-5 h-5">
                            <path
                                d="M5.433 13.917l1.262-3.155A4 4 0 017.58 9.42l6.92-6.918a2.121 2.121 0 013 3l-6.92 6.918c-.383.383-.84.685-1.343.886l-3.154 1.262a.5.5 0 01-.65-.65z" />
                            <path
                                d="M3.5 5.75c0-.69.56-1.25 1.25-1.25H10A.75.75 0 0010 3H4.75A2.75 2.75 0 002 5.75v9.5A2.75 2.75 0 004.75 18h9.5A2.75 2.75 0 0017 15.25V10a.75.75 0 00-1.5 0v5.25c0 .69-.56 1.25-1.25 1.25h-9.5c-.69 0-1.25-.56-1.25-1.25v-9.5z" />
                        </svg>
                        編輯</button>
                    <button type="button" id="save" style="display: none;"><svg xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 20 20" fill="currentColor" className="w-5 h-5">
                            <path fillRule="evenodd"
                                d="M10 2c-1.716 0-3.408.106-5.07.31C3.806 2.45 3 3.414 3 4.517V17.25a.75.75 0 001.075.676L10 15.082l5.925 2.844A.75.75 0 0017 17.25V4.517c0-1.103-.806-2.068-1.93-2.207A41.403 41.403 0 0010 2z"
                                clipRule="evenodd" />
                        </svg>
                        保存</button>
                    <button type="button" id="changeImage" style="display: none;"><svg
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M2.25 15.75l5.159-5.159a2.25 2.25 0 013.182 0l5.159 5.159m-1.5-1.5l1.409-1.409a2.25 2.25 0 013.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 001.5-1.5V6a1.5 1.5 0 00-1.5-1.5H3.75A1.5 1.5 0 002.25 6v12a1.5 1.5 0 001.5 1.5zm10.5-11.25h.008v.008h-.008V8.25zm.375 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" />
                        </svg>
                        修改<br>圖片</button>
                </div>
            </div>
        </div>
    </div>
    <% jedis.close(); %>
    <script src="${ctxPath}/vendors/jquery/jquery-3.7.0.min.js"></script>
    <script>

        var edit = document.getElementById('edit');
        var save = document.getElementById('save');
        var editContent = document.getElementById('editContent');
        var changeImage = document.getElementById('changeImage');
        var imgpre = document.getElementById('imagePre');

        var abusContent = editContent.innerHTML;
        var selectedImg = null;

        changeImage.addEventListener('click', function () {
            var input = document.createElement('input');
            input.type = 'file';
            input.accept = 'image/*';


            input.addEventListener('change', function () {
                selectedImg = input.files[0];

                if (selectedImg) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        imgpre.src = e.target.result;
                    };
                    reader.readAsDataURL(selectedImg);
                }

            });


            input.click();
        });

        edit.addEventListener('click', function () {
            editContent.contentEditable = true;
            save.style.display = 'block';
            edit.style.display = 'none';
            changeImage.style.display = 'block';
            editContent.style.border = '1px solid red';
        });

        save.addEventListener('click', function () {
            editContent.contentEditable = false;
            save.style.display = 'none';
            edit.style.display = 'block';
            changeImage.style.display = 'none';
            editContent.style.border = '';

            var formData = {
                content: editContent.innerHTML,
                image: imgpre.src
            };

            function saveData() {
                $.ajax({
                    method: 'post',
                    url: 'aboutusContro',
                    contentType: 'application/json',
                    data: JSON.stringify(formData),
                    dataType: "text",
                    success: function (response) {
                        alert("新增成功~");
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
            saveData();
        });

    </script>
</body>


</html>