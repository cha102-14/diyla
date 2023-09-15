<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="com.cha102.diyla.empmodel.*" %>
            <% EmpVO empVO=(EmpVO) request.getAttribute("empVO"); %>

                <!DOCTYPE html>
                <html lang="zh-Hant-TW">

                <head>
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <title>忘記密碼</title>

                    <!-- slider stylesheet -->
                    <link rel="stylesheet" type="text/css"
                        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

                    <!-- bootstrap core css -->
                    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />

                    <!-- Custom styles for this template -->
                    <link href="/css/style.css" rel="stylesheet" />

                    <!-- responsive style -->
                    <link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
                    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


                    <style>
                       /* 整体样式 */
                        .title {
                            font-family: "微軟正黑體", Arial, sans-serif;
                            font-weight: bold;
                            color: #B26021;
                            position: relative;
                            width:600px;
                            top:50%;
                            left:50%;
                            transform: translateX(-50%);
                            border-radius: 25px ;
                            letter-spacing: 3px;
                            margin:50px 0;
                            border: 2px solid #333; /* 外边框线 */
                            padding: 40px; /* 内边距 */
                            text-align: center; /* 文本居中 */
                        }

                        .inputtext{
                            font-family: "微軟正黑體", Arial, sans-serif;
                            text-align: center;
                            width: 400px;
                            height: 35px;
                            font-size: 15px; /*文字大小*/
                            border-radius: 10px;
                            font-weight: bold;
                        }
                    
                        h4{
                            font-family: "微軟正黑體", Arial, sans-serif;
                            font-size:30px;
                            font-weight: bold;
                            margin-top:10px;
                            margin-bottom:20px
                        }

                        body {
                            margin: 0;
                            background-image: url('../img/forget.png'); /* 背景图像的URL，注意路径 */
                            background-size: cover; /* 按照视口大小覆盖整个屏幕 */
                            background-repeat: no-repeat; /* 不重复平铺背景图像 */
                            background-attachment: fixed; /* 固定背景图像 */
                            background-position: center center; /* 居中显示背景图像 */
                        }

                        .sendbutton{
                            margin-top: 20px;
                            width: 120px;
                            height: 35px;
                            border-width: 3px;
                            border-radius: 10px;
                            background-color: #A3816A;
                            cursor: pointer;
                            outline: none;
                            font-family: "微軟正黑體", Arial, sans-serif;
                            color: #F8F1F1;
                            font-size: 16px;
                            font-weight: bold;
                        }

                    </style>

                </head>

                <body>

                    

                    <div class="title">
                        <h4>忘記密碼</h4>
                        <div class="importemail">
                            請輸入您的Email帳號，系統將會寄送驗證碼到您的Email信箱。
                            <br>
                            <br>
                            <input class="inputtext" type="text" name="email" id="email" placeholder="請輸入信箱"
                                value="${(empVO==null)? "" : empVO.empEmail()}"> <br>
                            <br>    
                            <button type="button" value="" class="sendbutton" onclick="sendEmail()">送出驗證信</button>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
                    <script>
                        let email = document.getElementById('email');

                        function sendEmail() {
                            // console.log('咩~')
                            var obj = {
                                "empEmail": email.value,
                            }

                            // let formDataUrlEncoded = new URLSearchParams();
                            // for(let key in obj){
                            //     formDataUrlEncoded.append(key,obj[key])
                            // }

                            fetch("forgetPassword", {
                                method: "post",
                                headers: {
                                    "content-type": "application/json"
                                },
                                body: JSON.stringify(obj)
                            }).then(res => res.json())
                                // console.log('第一個then');
                                // return response.text();
                              .then(function (data) {
                                if (data.result == 'success') {
                                    Swal.fire('信件已發送！');
                                    setTimeout(function(){ window.location.href = "empResetPassword.jsp"; }, 1500);
                                    
                                } else {
                                    Swal.fire('信箱不正確，請重新輸入！')
                                }
                            })

                                .catch(function (error) {
                                    console.log("error");
                                })


                        }






                    </script>

                </body>

                </html>