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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
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
    <div id="pageContent">
        <div id="indexBlock">
            <jsp:include page="/index.jsp" />
        </div>
        <div id="naviContentBlock">
    <div id="naviBlock">
        <jsp:include page="/desertcourse/navibar.jsp" />
    </div>
            <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
                <h2 id="title" class="title-tag" >修改師傅</h2>
            </div>
        <div id="contentBlock">
        <div id="formBlock">
    <a href="${ctxPath}/desertcourse/listallteacher.jsp">前往教師列表頁面</a>
    <form action="${ctxPath}/modifyTeacher" method="post" enctype="multipart/form-data">
    <c:choose>
    <c:when test="${adminAuthCode == 1 && teacherVO != null}">
    <div class="row">
        <div id="teacherIdField" class="col-md-3 form-group">
            <label for="teacherId">師傅編號 </label>
            <input type="text" id="teacherId" class="form-control" name="teacherId" value = "${teacherVO.teaId}" required><br>
        </div>
        <div id="genderBlock" class="col-md-3 form-group">
    <label for="teagender">性別</label>
    <select id="teagender" class="form-control" class="form-control" name="teaGender">
        <option value="0" <% if (teacherVO != null && teacherVO.getTeaGender() == 0) { %>selected<% } %>>男</option>
        <option value="1" <% if (teacherVO != null && teacherVO.getTeaGender() == 1) { %>selected<% } %>>女</option>
    </select><br>
    </div>
        <div id="teacherNameField" class="col-md-6 form-group" >
            <label for="teacherName">師傅名稱 </label>
            <input type="text" id="teacherName" class="form-control" name="teacherName" value = "${teacherVO.teaName}" required><br>
        </div>
    </div>
    </c:when>
    <c:when test="${adminAuthCode == 1 && teacherVO == null}">
    <div class="row">
    <div id="teacherIdField">
        <label for="teacherId">師傅編號</label>
        <input type="text" id="teacherId" readonly class="form-control" name="teacherId" value = "" required><br>
    </div>
    <div id="genderBlock" class="col-md-3 form-group">
    <label for="teagender">性別</label>
    <select id="teagender" class="form-control" name="teaGender">
        <option value="0" <% if (teacherVO != null && teacherVO.getTeaGender() == 0) { %>selected<% } %>>男</option>
        <option value="1" <% if (teacherVO != null && teacherVO.getTeaGender() == 1) { %>selected<% } %>>女</option>
    </select><br>
    </div>
    <div id="teacherNameField" >
        <label for="teacherName">師傅名稱 </label>
        <input type="text" id="teacherName" class="form-control" name="teacherName" value = "" required><br>
    </div>
    </div>
    </c:when>
    <c:otherwise>
    <div class="row">
    <div id="teacherIdField" class="col-md-3 form-group">
        <label for="teacherId">師傅編號 </label>
        <input type="text" id="teacherId" class="form-control" name="teacherId" value= "${teacherVO.teaId}" readonly style="background-color: #f2f2f2;"><br>
    </div>
    <div id="genderBlock" class="col-md-3 form-group">
    <label for="teagender">性別</label>
    <select id="teagender" class="form-control" name="teaGender">
        <option value="0" <% if (teacherVO != null && teacherVO.getTeaGender() == 0) { %>selected<% } %>>男</option>
        <option value="1" <% if (teacherVO != null && teacherVO.getTeaGender() == 1) { %>selected<% } %>>女</option>
    </select><br>
    </div>
    <div id="teacherNameField" class="col-md-6 form-group">
        <label for="teacherName">師傅名稱 </label>
        <input type="text" id="teacherName" class="form-control" name="teacherName" value = "${teacherVO.teaName}" readonly style="background-color: #f2f2f2;"><br>
    </div>
    </div>
    </c:otherwise>
    </c:choose>

    <div class="row">
        <div id="phoneBlock" class="col-md-6 form-group">
        <label for="phone">電話</label>
        <% if(teacherVO != null) {%>
        <input type="tel" id="phone" class="form-control" name="teaPhone" value="${teacherVO.teaPhone}" required>
        <%} else {%>
        <input type="tel" id="phone" class="form-control" name="teaPhone" value="" required>

        <% } %>
        <span class="error" style="display: none">請輸入有效的電話號碼 (10位數字)。</span><br>
        </div>
        <div id="mailBlock" class="col-md-6 form-group">
        <label for="email">電子郵件</label>
        <% if(teacherVO != null) {%>
        <input type="email" id="email" class="form-control" name="teaEmail" value="${teacherVO.teaEmail}" required>
        <%} else {%>
        <input type="email" id="email" class="form-control" name="teaEmail" value="" required>
        <% } %>
        <span class="error" style="display: none">請輸入有效的電子郵件地址。</span><br>
        </div>
    </div>
    <c:choose>
    <c:when test="${teacherVO == null || teaSpeNameList == null}">
    <div id="specialityBlock" class="column">
        <div class="row">
            <div class="col-md-6 spe-type-block form-group">
                <label for="speciality" class="spe-label"> 專長1 </label>
                <input id="speciality1" name="speciality" data-field="speciality" class="speciality-row form-control" required>
            </div>
            <div class="col-md-3 form-group">
                <label>專長控制</label><br>
                <button type="button" class="btn btn-secondary" id="speincbutton">追加專長</button>
            </div>
        </div>
    </div>
    </c:when>
    <c:otherwise>
    <div id="specialityBlock" class="column">
        <div class="row">
            <div class="col-md-6 spe-type-block form-group">
                <label for="speciality" class="spe-label"> 專長1 </label>
                <input id="speciality1" name="speciality" data-field="speciality" class="speciality-row form-control" value="${teaSpeNameList.get(0)}"required>
            </div>
            <div class="col-md-3 spe-button-block form-group">
                <label>專長控制</label><br>
                <button type="button" class="btn btn-secondary" id="speincbutton">追加專長</button>
            </div>
        </div>
            <c:forEach var="teaSpeName" items="${teaSpeNameList}" varStatus="loop">
                    <c:if test="${loop.index > 0}">
                        <div class="speciality-row row">
                            <div class="col-md-6 spe-type-block form-group">
                                <label class="spe-label" for="speciality"> 專長${loop.index + 1} </label>
                                <input id="speciality${loop.index + 1}" name="speciality" class="form-control" data-field="speciality" value="${teaSpeName}" required>
                            </div>
                            <div class="col-md-3 spe-button-block form-group">
                                <label>專長控制</label><br>
                                <button type="button" class="remove-speciality btn btn-secondary">移除專長</button>
                            </div>
                        </div>
                    </c:if>
            </c:forEach>
    </div>
    </c:otherwise>
    </c:choose>

    <div id="intorBlock">
    <label for="intro">簡介：</label>
    <% if(teacherVO != null) {%>
    <textarea id="intro" class="form-control" name="teaIntro" rows="4" maxlength="500" required><%= teacherVO != null ? teacherVO.getTeaIntro() : "" %></textarea>
    <%} else {%>
    <textarea id="intro" class="form-control" name="teaIntro" rows="4" maxlength="500" value="" required></textarea>
    <% } %>
    <span class="error" style="display: none">簡介不可超過500字。</span><br>
    </div>


<div id="picBlock">
    <label for="profilePic">上傳圖片：</label>
    <% if (teacherVO != null && teacherVO.getTeaPic() != null) { %>
        <input type="file" class="form-control" id="teaPic" name="teaPic" accept="image/*" ><br>
        <img id="picPreview" src="data:image/jpeg;base64, <%= Base64Converter.byteArrayToBase64(teacherVO.getTeaPic()) %>" alt="圖片預覽" style="max-width: 280px; max-height: 280px;">
        <input type="hidden" id="defaultTeaPic" name="defaultTeaPic" value="<%= Base64Converter.byteArrayToBase64(teacherVO.getTeaPic()) %>">
    <% } else { %>
        <input type="file" class="form-control" id="teaPic" name="teaPic" accept="image/*"><br>
        <img id="picPreview" src="#" alt="圖片預覽" style="max-width: 280px; max-height: 280px;">
        <input type="hidden" id="defaultTeaPic" name="defaultTeaPic" value="">
    <% } %>
</div>
    <input type="submit" class="btn btn-primary" value="儲存修改" id="submitButton">
</form>
</div>
</div>
</div>
</div>
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
                    const newSpeType = $('<div class="col-md-6 form-group">');
                    const newSpeControl = $('<div class="col-md-3 form-group">');
                    const newSpecialityRow = $('<div class="speciality-row row">').append(newSpeType).append(newSpeControl);
                    const newLabel = $("<label>").attr('for', 'speciality' + count).addClass('spe-label').text(" 專長" + count + ": ");
                    const br = $('<br>');
                    const newInput = $("<input>").attr({
                        id: "speciality" + count,
                        name: "speciality",
                        class: "form-control",
                        "data-field": "speciality",
                        required: true
                    });
                    const newButtonLabel = $("<label>").text("專長控制")
                    const removeButton = $("<button>")
                        .attr("type", "button")
                        .addClass('remove-speciality btn btn-secondary')
                        .text("移除專長");
                    newSpeType.append(newLabel, newInput);
                    newSpeControl.append(newButtonLabel, br, removeButton);
                    specialityBlock.append(newSpecialityRow);
                    resetSpecialityLabels();
                }

                function resetSpecialityLabels() {
                    const specialityRows = specialityBlock.find('.speciality-row');
                    specialityRows.each(function (index, row) {
                        const label = $(row).find('.spe-label');
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
