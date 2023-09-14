<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.empmodel.EmpVO" %>
<%@ page import="com.cha102.diyla.empmodel.EmpService" %>
<%@ page import="com.cha102.diyla.empmodel.EmpDAOImpl" %>
<%@ page import="com.cha102.diyla.empmodel.EmpDAO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@page import="java.util.*"%>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="/index.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊師傅</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- 設定session的後台會員名稱以及其是否是師傅-->
    <%
     //抓取權限以及empId對應的teacherVO
        EmpService empService = new EmpService();
        EmpDAO empDAO = new EmpDAOImpl();
        TeacherService teacherService = new TeacherService();
        //默認使用者type為notAuth
        String type = "notAuth"; 
        Integer canRegister = null;
        //若session並非為null才往下
        Integer empId = (Integer) (session.getAttribute("empId"));
        List<String> typeFun = (List<String>) session.getAttribute("typeFun");
        if(session != null && empId != null && typeFun != null){
            boolean isEmpAlreadyTeacher = teacherService.isEmpAlreadyTeacher(empId);
            EmpVO empVO = empDAO.getOne(empId);
            String empName = empVO.getEmpName();
            //進來的是何種使用者
            Object typeFunObj = session.getAttribute("typeFun");
            boolean isTypeFunList = (typeFunObj != null && (typeFunObj instanceof java.util.List));
            if (isTypeFunList) {
                boolean containsMaster = typeFun.contains("MASTER");
                boolean containsAdmin = typeFun.contains("BACKADMIN");
                if (containsMaster && containsAdmin) {
                    type = "BACKADMIN";
                } else if (containsMaster) {
                    type = "MASTER";
                }
            } else {
                type = (String) typeFunObj;
            }
            if("BACKADMIN".equals(type)) {
                canRegister = 0;
            } else if ("MASTER".equals(type) && !isEmpAlreadyTeacher) {
                canRegister = 1;
            } else {
                canRegister = 0;
            }
            pageContext.setAttribute("type", type);
            pageContext.setAttribute("teacherName", empName);
            pageContext.setAttribute("canRegister", canRegister);
        } else {
            canRegister = 0;
            type = "NOSESSION";
            pageContext.setAttribute("type", type);
            pageContext.setAttribute("canRegister", canRegister);
        
        }
    
    %>
  

</head>

<body>
<div id="pageContent">
    <div id="indexBlock">
    </div>
    <div id="naviContentBlock">
    <div id="naviBlock">
        <jsp:include page="/desertcourse/navibar.jsp" />
    </div>
        <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
            <h2 id="title" class="title-tag" >註冊師傅</h2>
        </div>
    <div id="contentBlock">
    <div id="formBlock">
    <form action="registerTeacher" method="post" enctype="multipart/form-data">
    <div class="row">
        <div id="teacherNameField" class="col-md-6 form-group" >
            <label for="teacherName">師傅名稱 </label>
            <input type="text" class="form-control" id="teacherName" name="teacherName" value = "${teacherName}" readonly style="background-color: #f2f2f2;"><br>
        </div>

        <div id="genderBlock" class="col-md-3 form-group">
            <label for="teagender">性別</label>
            <select id="teagender" class="form-control" name="teagender">
                <option value="0">男</option>
                <option value="1">女</option>
            </select><br>
        </div>
    </div>
    <div class="row">
        <div id="phoneBlock" class="col-md-6 form-group">
        <label for="phone">電話</label>
        <input type="tel" id="phone" class="form-control" name="teaPhone" required>
        <span class="error" style="color: red; display: none">請輸入有效的電話號碼 (10位數字)。</span><br>
        </div>

        <div id="mailBlock" class="col-md-6 form-group">
        <label for="email">電子郵件</label>
        <input type="email" id="email" class="form-control" name="teaEmail" required>
        <span class="error" style="color: red; display: none">請輸入有效的電子郵件地址。</span><br>
        </div>
    </div>
    <div id="specialityBlock" class="column">
        <div class="row">
            <div class="col-md-6 spe-type-block form-group">
                <label for="speciality"> 專長1 </label>
                <input id="speciality1" name="speciality" data-field="speciality" class="speciality-row form-control" required>
            </div>
            <div class="col-md-3 form-group">
                <label>專長控制</label><br>
                <button type="button" class="btn btn-secondary" id="speincbutton">追加專長</button>
            </div>
        </div>
    </div>

    <div id="intorBlock">
    <label for="intro">簡介</label>
    <textarea id="intro" name="teaIntro" class="form-control" rows="4" maxlength="500" required></textarea>
    <span class="error" style="display: none">簡介不可超過500字。</span><br>
    </div>


    <div id="picBlock">
    <label for="profilePic">上傳圖片</label>
    <input type="file" id="teaPic" class="form-control" name="teaPic" accept="image/*"><br>
    </div>
    <div id="picPreviewBlock" style="display: none;">
        <img id="picPreview" src="#" alt="圖片預覽" style="max-width: 280px; max-height: 280px;">
    </div>
    <input type="submit" class="btn btn-primary" value="註冊" id="submitButton" >
</form>
</div>
</div>
</div>
</div>
    <script>
        $(document).ready(function () {
            var type = "${type}";
            var canRegister = "${canRegister}";
            // 判斷 expiresession 的值
            if (type === "NOSESSION") {
                Swal.fire({
                    title: "您尚未登入!",
                    icon: "error",
                    confirmButtonText: "確定"
                }).then(function(result){
                    if(result.isConfirmed) {
                        window.location.href = "${ctxPath}/emp/empLogin.jsp";
                    }
                });
                    setTimeout(function() {
                    window.location.href = "${ctxPath}/emp/empLogin.jsp";
                    }, 2500);
            } else{
                
                 //先做是否已可以註冊師傅的驗證
            if (canRegister !== '1') {
                Swal.fire({
                title: "您已註冊為教師，或您無權註冊為教師!",
                icon: "warning",
                confirmButtonText: "確定"
                }).then(function(result){
                    if(result.isConfirmed) {
                        window.location.href = "${ctxPath}/desertcourse/listalldesertcoursecalendar.jsp";
                    }
                });
                    setTimeout(function() {
                    window.location.href = "${ctxPath}/desertcourse/listalldesertcoursecalendar.jsp";
                    }, 2500);
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

            fetch("${ctxPath}/registerTeacher", {
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
                                        window.location.href = "${ctxPath}/desertcourse/listallteacher.jsp?defaultSearchValue="+ data.teacherName;
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
            }
        });
    </script>
</body>

</html>
