<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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
    <!-- 設定session的後台會員名稱以及其是否是師傅-->
    <%

        String empname = "老師";
        session.setAttribute("empname", empname);
        Integer isTeacher = 0;
        session.setAttribute("isTeacher", isTeacher);
    %>
</head>

<body>
    <form action="/${ctxPath}/registerTeacher" method="post" enctype="multipart/form-data">

    <div id="teacherNameField" >
        <label for="teacherName">師傅名稱: </label>
        <input type="text" id="teacherName" name="teacherName" value = ${empname} readonly style="background-color: #f2f2f2;"><br>
    </div>

    <div id="genderBlock">
    <label for="teagender">性別：</label>
    <select id="teagender" name="teaGender">
        <option value="0">男</option>
        <option value="1">女</option>
    </select><br>
    </div>

    <div id="phoneBlock">
    <label for="phone">電話：</label>
    <input type="tel" id="phone" name="teaPhone" required>
    <span class="error" style="display: none">請輸入有效的電話號碼 (10位數字)。</span><br>
    </div>
    <div id="specialityBlock">
    <label for="speciality"> 專長1: </label>
    <input id="speciality1" name="speciality" data-field="speciality" class="speciality-row" required>
    <button type="button" id="speincbutton">追加專長</button>
    </div>

    <div id="intorBlock">
    <label for="intro">簡介：</label>
    <textarea id="intro" name="teaIntro" rows="4" maxlength="500" required></textarea>
    <span class="error" style="display: none">簡介不可超過500字。</span><br>
    </div>

    <div id="mailBlock">
    <label for="email">電子郵件：</label>
    <input type="email" id="email" name="teaEmail" required>
    <span class="error" style="display: none">請輸入有效的電子郵件地址。</span><br>
    </div>

    <div id="picBlock">
    <label for="profilePic">上傳圖片：</label>
    <input type="file" id="teaPic" name="teaPic" accept="image/*"><br>
    </div>
    <div id="picPreviewBlock" style="display: none;">
        <img id="picPreview" src="#" alt="圖片預覽" style="max-width: 280px; max-height: 280px;">
    </div>
    <input type="submit" value="註冊" id="submitButton" disabled>
    <button type="button" id="clearbutton" >清除所有欄位</button>
</form>


    <script>
        $(document).ready(function () {
                 //先做是否已是師傅的驗證
            if (${isTeacher} !== 0) {
                Swal.fire({
                title: "您已註冊為教師!",
                icon: "warning",
                confirmButtonText: "確定"
                }).then(function(result){
                    if(result.isConfirmed) {
                        window.location.href = "/${ctxPath}/index.jsp";
                    }
                });
        }
                //宣告各區塊的參數
                const specialityBlock = $("#specialityBlock");
                const addButton = $("#speincbutton");
                let specialityCount = specialityBlock.find('.speciality-row').length + 1;
                addButton.click(function () {
                    appendSpecialityRow(specialityCount);
                    specialityCount++;
                });
                //做表單的請求處理
                $("form").submit(function(event){
                    var form = $('form')[0];
                    var formData = new FormData(form);
                    console.log(formData);
                    for (var pair of formData.entries()) {
        console.log(pair[0] + ': ' + pair[1]);
    }
                    event.preventDefault();

            fetch("${ctxPath}"+"/registerTeacher", {
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
                                        window.location.href = "/${ctxPath}/listallteacher.jsp?defaultSearchValue="+result.teacherId;
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
