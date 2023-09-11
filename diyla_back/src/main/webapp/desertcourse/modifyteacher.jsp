<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService"%>
<%@ page import="com.cha102.diyla.back.controller.desertcourse.blobreader.Base64Converter" %>
<%@page import="java.util.*"%>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改師傅資料</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- 取得送進來的teacherVO-->
    <%
        TeacherVO teacherVO = (TeacherVO)request.getAttribute("teacherVO");
        TeacherService teacherService = new TeacherService();
        if(teacherVO != null){
        List<String> teaSpeNameList = teacherService.getOneTeaSpecialityStringList(teacherVO.getTeaId());
        pageContext.setAttribute("teaSpeNameList", teaSpeNameList);
        }
        Integer adminAuthCode = 1;
        Integer isTeacher = 1;
        request.setAttribute("adminAuthCode", adminAuthCode);
        request.setAttribute("isTeacher", isTeacher);

%>
</head>

<body>
    <a href="${ctxPath}/desertcourse/listallteacher.jsp">前往教師列表頁面</a>
    <form action="${ctxPath}/modifyTeacher" method="post" enctype="multipart/form-data">
    <c:choose>
    <c:when test="${adminAuthCode == 1 && teacherVO != null}">
    <div id="teacherIdField" >
        <label for="teacherId">師傅編號: </label>
        <input type="text" id="teacherId" name="teacherId" value = "${teacherVO.teaId}" required><br>
    </div>
    <div id="teacherNameField" >
        <label for="teacherName">師傅名稱: </label>
        <input type="text" id="teacherName" name="teacherName" value = "${teacherVO.teaName}" required><br>
    </div>

    </c:when>
    <c:when test="${adminAuthCode == 1 && teacherVO == null}">
    <div id="teacherIdField">
        <label for="teacherId">師傅編號: </label>
        <input type="text" id="teacherId" name="teacherId" value = "" required><br>
    </div>
    <div id="teacherNameField" >
        <label for="teacherName">師傅名稱: </label>
        <input type="text" id="teacherName" name="teacherName" value = "" required><br>
    </div>
    </c:when>
    <c:otherwise>
    <div id="teacherIdField" >
        <label for="teacherId">師傅編號: </label>
        <input type="text" id="teacherId" name="teacherId" value= "${teacherVO.teaId}" readonly style="background-color: #f2f2f2;"><br>
    </div>
    <div id="teacherNameField" >
        <label for="teacherName">師傅名稱: </label>
        <input type="text" id="teacherName" name="teacherName" value = "${teacherVO.teaName}" readonly style="background-color: #f2f2f2;"><br>
    </div>
    </c:otherwise>
    </c:choose>

    <div id="genderBlock">
    <label for="teagender">性別：</label>
    <select id="teagender" name="teaGender">
        <option value="0" <% if (teacherVO != null && teacherVO.getTeaGender() == 0) { %>selected<% } %>>男</option>
        <option value="1" <% if (teacherVO != null && teacherVO.getTeaGender() == 1) { %>selected<% } %>>女</option>
    </select><br>
</div>

    <div id="phoneBlock">
    <label for="phone">電話：</label>
    <% if(teacherVO != null) {%>
    <input type="tel" id="phone" name="teaPhone" value="${teacherVO.teaPhone}" required>
    <%} else {%>
    <input type="tel" id="phone" name="teaPhone" value="" required>

    <% } %>
    <span class="error" style="display: none">請輸入有效的電話號碼 (10位數字)。</span><br>
    </div>
    <c:choose>
    <c:when test="${teacherVO == null}">
    <div id="specialityBlock">
    <label for="speciality"> 專長1: </label>
    <input id="speciality1" name="speciality" data-field="speciality" class="speciality-row" required>
    <button type="button" id="speincbutton">追加專長</button>
    </div>
    </c:when>
    <c:otherwise>
    <div id="specialityBlock">
    <label for="speciality"> 專長1: </label>
    <input id="speciality1" name="speciality" data-field="speciality" class="speciality-row" value="${teaSpeNameList.get(0)}"required>
    <button type="button" id="speincbutton">追加專長</button>
     <c:forEach var="teaSpeName" items="${teaSpeNameList}" varStatus="loop">
            <c:if test="${loop.index > 0}">
                <div class="speciality-row">
                    <label for="speciality"> 專長${loop.index + 1}: </label>
                    <input id="speciality${loop.index + 1}" name="speciality" data-field="speciality" value="${teaSpeName}" required>
                    <button type="button" class="remove-speciality">移除專長</button>
                </div>
            </c:if>
        </c:forEach>
    </div>
    </c:otherwise>
    </c:choose>

    <div id="intorBlock">
    <label for="intro">簡介：</label>
    <% if(teacherVO != null) {%>
    <textarea id="intro" name="teaIntro" rows="4" maxlength="500" required><%= teacherVO != null ? teacherVO.getTeaIntro() : "" %></textarea>
    <%} else {%>
    <textarea id="intro" name="teaIntro" rows="4" maxlength="500" value="" required></textarea>
    <% } %>
    <span class="error" style="display: none">簡介不可超過500字。</span><br>
    </div>

    <div id="mailBlock">
    <label for="email">電子郵件：</label>
    <% if(teacherVO != null) {%>
    <input type="email" id="email" name="teaEmail" value="${teacherVO.teaEmail}" required>
    <%} else {%>
    <input type="email" id="email" name="teaEmail" value="" required>
    <% } %>
    <span class="error" style="display: none">請輸入有效的電子郵件地址。</span><br>
    </div>

<div id="picBlock">
    <label for="profilePic">上傳圖片：</label>
    <% if (teacherVO != null && teacherVO.getTeaPic() != null) { %>
        <input type="file" id="teaPic" name="teaPic" accept="image/*" ><br>
        <img id="picPreview" src="data:image/jpeg;base64, <%= Base64Converter.byteArrayToBase64(teacherVO.getTeaPic()) %>" alt="圖片預覽" style="max-width: 280px; max-height: 280px;">
        <input type="hidden" id="defaultTeaPic" name="defaultTeaPic" value="<%= Base64Converter.byteArrayToBase64(teacherVO.getTeaPic()) %>">
    <% } else { %>
        <input type="file" id="teaPic" name="teaPic" accept="image/*"><br>
        <img id="picPreview" src="#" alt="圖片預覽" style="max-width: 280px; max-height: 280px;">
        <input type="hidden" id="defaultTeaPic" name="defaultTeaPic" value="">
    <% } %>
</div>
    <input type="submit" value="修改" id="submitButton">
    <button type="button" id="clearbutton" >清除所有欄位</button>
</form>


    <script>
        $(document).ready(function () {
                 //先做是否有修改的權利的確認
            if (${isTeacher} !== 1 && ${adminAuthCode} !== 1) {
                // 啟動定時器，5秒後導航到其他網頁
                setTimeout(function() {
                window.location.href = "${ctxPath}"+"/index.jsp";
                }, 5000); // 5000 毫秒 = 5 秒

                Swal.fire({
                title: "您無權限修改師傅資料",
                icon: "warning",
                confirmButtonText: "確定"
             });
}
                //宣告新增專長時的參數
                const specialityBlock = $("#specialityBlock");
                const addButton = $("#speincbutton");
                let specialityCount = specialityBlock.find('.speciality-row').length + 1;
                addButton.click(function () {
                    appendSpecialityRow(specialityCount);
                    specialityCount++;
                });
                //做表單的請求處理
                $("form").submit(function(event){
                    //取得圖片以及預設圖片
                    var teaPicInput = $('#teaPic')[0];
                    var defaultTeaPicInput = $('#defaultTeaPic')[0];
                    //取得teacherName以便轉回listAllteacher時可以使用
                    var teacherName = $("#teacherName").val();
                    //取得formData以便後續傳給後端servlet
                    var form = $('form')[0];
                    var formData = new FormData(form);
                    event.preventDefault();
                    //做圖片的檢查若teacherVO取出來的圖片欄位以及input圖片欄位皆空則不進行請求
                    if(teaPicInput.files.length && defaultTeaPicInput.value) {
                        Swal.fire({
                            title: "請上傳師傅圖片",
                            icon: "error",
                            confirmButtonText: "確定"
                        });
                    }
                    //傳送請求給後端
                    else {
                    fetch("${ctxPath}"+"/updateTeacher", {
                    method: "post",
                    body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if(data.isSuccessful) {
                                        Swal.fire({
                                            title: data.errorMessage,
                                            icon: "success",
                                            confirmButtonText: "確定"
                                        }).then(function(result){
                                            if(result.isConfirmed) {
                                                window.location.href = "${ctxPath}"+"/desertcourse/listallteacher.jsp?defaultSearchValue="+teacherName;
                                            }
                                        });
                                    } else {
                                        Swal.fire({
                                            title: data.errorMessage,
                                            icon: "error",
                                            confirmButtonText: "確定"
                                        });
                                    }
                            });
                        }
                    });

                 // 清空按鈕事件處理
                $("#clearbutton").click(function () {
                // 清空電話號碼和簡介
                    $("#phone").val("");
                    $("#intro").val("");
                    // 清空專長
                    $(".speciality-row").remove();
                    specialityCount = 1;
                    appendSpecialityRow(specialityCount);

                    // 隱藏圖片預覽
                    $("#picPreviewBlock").hide();
                    // 禁用提交按鈕
                    $("#submitButton").prop("disabled", true);
                });
                // 移除專長的按鈕事件處理
                specialityBlock.on('click', '.remove-speciality', function () {
                    $(this).closest('.speciality-row').remove();
                    resetSpecialityLabels();
                });
                //增加專長的處理
                function appendSpecialityRow(count) {
                    const newSpecialityRow = $('<div class="speciality-row">');
                    const newLabel = $("<label>").attr('for', 'speciality' + count).text(" 專長" + count + ": ");
                    const newInput = $("<input>").attr({
                        id: "speciality" + count,
                        name: "speciality",
                        "data-field": "speciality",
                        required: true
                    });
                    const removeButton = $("<button>")
                        .attr("type", "button")
                        .addClass('remove-speciality')
                        .text("移除專長");

                    newSpecialityRow.append(newLabel, newInput, removeButton);
                    specialityBlock.append(newSpecialityRow);
                    resetSpecialityLabels();
                }

                function resetSpecialityLabels() {
                    const specialityRows = specialityBlock.find('.speciality-row');
                    specialityRows.each(function (index, row) {
                        const label = $(row).find('label');
                        label.text(" 專長" + (index + 1) + ": ");
                    });
                }
                // 電話號碼格式驗證
             $("#phone").on("blur", function () {
                    const phoneInput = $(this);
                    const phonePattern = /^[0-9]{10}$/;
                    const errorMessage = phoneInput.next(".error");

                    if (phonePattern.test(phoneInput.val())) {
                        errorMessage.hide();
                    } else {
                        errorMessage.show();
                    }
                });
                // 圖片上傳預覽
            $("#teaPic").on("change", function () {
                        $('#defaultTeaPic').val("");
                        const previewBlock = $("#picPreviewBlock");
                        const preview = $("#picPreview");
                        const input = this;
                        if (input.files && input.files[0]) {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                preview.attr("src", e.target.result);
                                // 啟用提交按鈕
                                $("#submitButton").prop("disabled", false);
                            };
                            reader.readAsDataURL(input.files[0]);
                            previewBlock.show(); // 顯示圖片預覽區塊
                        } else {
                            previewBlock.hide(); // 隱藏圖片預覽區塊
                            // 禁用提交按钮
                            $("#submitButton").prop("disabled", true);
                        }
                    });
            // 電子郵件格式驗證
            $("#email").on("blur", function () {
                const emailInput = $(this);
                const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                const errorMessage = emailInput.next(".error");
                if (emailPattern.test(emailInput.val())) {
                    errorMessage.hide();
                } else {
                    errorMessage.show();
                }
            });

        });

    </script>
</body>

</html>
