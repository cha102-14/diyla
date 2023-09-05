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
                    <link href="./css/responsive.css" rel="stylesheet" />
                    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

                </head>

                <body>
                    <div class="title">
                        <h4>忘記密碼</h4>
                        <c:if test="${not empty exMsgs}">
                            <div style="color:red" class="error">
                                <c:forEach var="message" items="${exMsgs}">
                                    ${message}
                                </c:forEach>
                            </div>
                        </c:if>
                        <div class="importemail">
                            請輸入您的Email帳號，系統將會寄送驗證碼到您的Email信箱。
                            <br>
                            <label>信箱</label><br>
                            <input type="text" name="email" id="email" placeholder="請輸入信箱"
                                value="${(empVO==null)? "" : empVO.empEmail()}" </br>
                            <button type="submit" value="" 　id="sub" onclick="sendEmail()">送出驗證信</button><br>
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
                                if (data.result) {
                                    Swal.fire('信件已發送！');
                                    setTimeout(function(){ window.location.href = "empResetPassword.jsp"; }, 1500);
                                    
                                } else {
                                    Swal.fire('請重新輸入！')
                                }
                            })

                                .catch(function (error) {
                                    console.log("error");
                                })


                        }






                    </script>

                </body>

                </html>