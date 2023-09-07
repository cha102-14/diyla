<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cha102.diyla.articleModel.*" %>
<%@ page import="com.cha102.diyla.articlemsgmodel.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% Integer memId=(Integer)session.getAttribute("memId"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>文章內容</title>
    <link rel="stylesheet" href="${ctxPath}/css/oneart.css">
    <Style>
        * {
            text-align: ;
        }
    </Style>
</head>

<body>
    <jsp:include page="/front_header.jsp" />
    <jsp:include page="/art/art_header.jsp" />
    <div id="one_art">
        <div class="post-container">
            <div class="post-image">
                        <c:choose>
                            <c:when test="${not empty artVO.artPic}">
                                <td><img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(artVO.artPic) }"
                                        alt="Image"></td>
                            </c:when>
                            <c:otherwise>
                                <td><img src="" alt="無圖片"></td>
                            </c:otherwise>
                        </c:choose>
            </div>
            <div class="post-details">
                <div class="profile-section">
                    <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke-width="1.5" stroke="currentColor" class="w-6 h-6" width="20px" height="20px">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg></div>
                    <span class="username">${artVO.memVO}</span>
                    <hr>
                    <span class="">
                        <h3>${artVO.artTitle}</h3>
                    </span>
                    <hr>
                </div>
                <div class="right-scroll">
                    <p>${artVO.artContext}</p>
                </div>
                <div class="right-scroll">
                    <ul class="ul_msg">
                        <c:forEach var="artMsgVO" items="${list}">
                            <c:if test="${(artMsgVO.msgStatus) == 1}">
                            <hr>
                            <li class="li_msg">
                                <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                        viewBox="0 0 24 24" stroke-width="1.5" stroke="#b45f06" class="w-6 h-6"
                                        width="20px" height="20px">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                                    </svg></div>
                                ${artMsgVO.memVO}
                                <button class="report-icon" onclick="report_message(${artMsgVO.msgNo})" type="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="gold" class="w-6 h-6" width="20px" height="20px">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
                                    </svg></button>
                                    <fmt:formatDate value="${artMsgVO.msgTime}" pattern="yyyy-MM-dd HH:mm" /><br>
                                <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                        viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6"
                                        width="20px" height="20px">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M8.625 12a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375M21 12c0 4.556-4.03 8.25-9 8.25a9.764 9.764 0 01-2.555-.337A5.972 5.972 0 015.41 20.97a5.969 5.969 0 01-.474-.065 4.48 4.48 0 00.978-2.025c.09-.457-.133-.901-.467-1.226C3.93 16.178 3 14.189 3 12c0-4.556 4.03-8.25 9-8.25s9 3.694 9 8.25z" />
                                    </svg></div>
                                    <span>${artMsgVO.msgContext}</span>
                            </li>
                            <hr>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                <p class="post-time">
                    <fmt:formatDate value="${artVO.artTime}" pattern="yyyy-MM-dd HH:mm" />
                </p>
                <form action="insert" method="post" modelAttribute="ArtMsgVO">
                    <div class="comment">
                        <input type="text" class="comment-text" name="msgContext" onclick="hideError()" />
                        <c:forEach var="error" items="${errorsListToKeep}">
                            <p class="error">${error.defaultMessage}</p>
                        </c:forEach>
                        <input name="memId" type="hidden" value="${memId}" />
                        <input name="artNo" type="hidden" value="${artVO.artNo}" />
                        <button type="submit">send</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/front_footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
        commentInput.addEventListener('keydown', function (event) {
            if (event.key === 'Enter') { // 檢測是否按下 ENTER 鍵
                event.preventDefault(); // 阻止預設的換行行為
                input_submit.click();
            }
        });

        function report_message(msgNo) {
            Swal.fire({
                title: "檢舉此留言",
                text: "請輸入檢舉原因：",
                input: "text",
                inputPlaceholder: "請輸入檢舉原因",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "是",
                cancelButtonText: "取消",
            }).then((result) => {
                if (result.isConfirmed) {
                    const report = result.value; // 使用 result.value 取得使用者輸入的值
                    var obj = {
                        report: report, // 將檢舉原因設定為表單欄位的值
                        memId: ${memId},
                        msgNo: parseInt(msgNo)
                    }
                    fetch("rpmsg", {
                        method: "post",
                        headers: {
                            "content-type": "application/json"
                        },
                        body: JSON.stringify(obj)
                    }).then(function (response) {
                        console.log(response);
                        return response.text();
                    }).then(function (data) {
                        if (data.indexOf("success") === 0) {
                            Swal.fire('檢舉成功！');
                        } else {
                            Swal.fire('請重新輸入');
                        }
                    })
                        .catch(function (error) {
                            console.log("error");
                        })
                }
                else {
                    console.log('取消檢舉');
                }
            });
        }

        //清除提示信息
        function hideError() {
            var error = document.querySelector('.error');
            error.style.display = 'none';
        }
    </script>
</body>

</html>