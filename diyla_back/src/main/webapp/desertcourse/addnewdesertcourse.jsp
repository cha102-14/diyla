<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增課程</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
        <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css.map"/>
        <!-- Custom styles for this template -->
        <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
        <!-- responsive style -->
        <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${ctxPath}/js/back.js"></script>
    <!-- 設定session的後台會員名稱以及其是否是師傅-->
    <%  //若authCode=0/1/>2 分別代表無權限後台人員/admin/以及師傅>
        //假資料區
        String fakeTypeFun = "ADMIN";
        session.setAttribute("typeFun", fakeTypeFun);
        Integer fakeEmpId = 1;
        session.setAttribute("empId", fakeEmpId);
        //抓取權限以及empId對應的teacherVO
        String typeFun = (String) session.getAttribute("typeFun");
        Integer empId = (Integer) (session.getAttribute("empId"));
        TeacherService teacherService = new TeacherService();
        Integer teacherId = null;
        String empName = "無詠致";
        TeacherVO teacher = null;
        if("ADMIN".equals(typeFun)) {
            List<TeacherVO> teacherList = teacherService.getAllTeacher();
            pageContext.setAttribute("teacherList", teacherList);
        } else if ("MASTER".equals(typeFun)) {
            teacher = teacherService.getOneTeacherByEmpId(empId);
            teacherId = teacher.getTeaId();
        }
        session.setAttribute("teacherId", teacherId);
        session.setAttribute("teacherName", empName);
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
                <h2 id="title" class="title-tag" >新增課程</h2>
            </div>
    <div id="contentBlock">
        <div id="formBlock">
    <form action="/${ctxPath}/addNewCourse" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-6">
                <div id="teacherIdField" class="form-group">
                    <c:choose>
                    <c:when test="${typeFun == 'ADMIN'}">
                        <label for="teacherSelect">師傅編號</label><br>
                        <select id="teacherSelect" class="teacherSelect form-control">
                        <c:forEach var="tea" items="${teacherList}" varStatus="loop">
                            <option id="teacher${loop.index}" value="${tea.teaId}">${tea.teaName}</option>
                        </c:forEach>
                        </select>
                    </c:when>
                    <c:otherwise>
                        <label for="teacherId">師傅編號</label>
                        <input type="text" id="teacherId" name="teacherId" class="form-control" value= ${teacherId} readonly style="background-color: #f2f2f2;"><br>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div id="courseNameField" class="col-md-6">
                <div class="form-group">
                    <label for="courseName">課程名稱</label><br>
                    <input type="text" id="courseName" class="form-control" name="courseName" placeholder="請輸入中文20字內的名稱" required>
                    <span class="error-stringlimit" style="display: none">課程名字不可超過20個字。</span>
                    <span class="error-invalidsymbol" style="display: none">課程名字只允許中文字。</span>
                </div>
            </div>
        </div>
<div class="row">
    <div id="courseDateBlock" class="col-md-3" style="">
        <div class="form-group" style="">
        <label for="courseDate">課程日期</label>
        <input type="date" id="courseDate" class="form-control" name="courseDate" required>
        </div>
    </div>
    <div id="courseSeqBlock" class="col-md-3" style="">
        <div class="form-group" style="">
            <label for="courseSeq">課程場次</label><br>
            <select id="courseSeq" class="form-control" name="courseSeq" style="">
                <option value="0">早上</option>
                <option value="1">中午</option>
                <option value="2">晚上</option>
            </select>
        </div>
    </div>

    <div id="registerEndDateBlock" class="col-md-6">
        <div class="form-group">
            <label for="registerEndDate">註冊截止日期</label>
            <input type="datetime-local" class="form-control" id="regEndDate" name="regEndDate" required>
            <span class="error" style="display: none">請輸入有效的日期(yyyy-mm-dd : hh:mm:ss)。</span>
        </div>
    </div>
</div>

    <div id="categoryBlock">
    <label for="category">甜點課程類別：</label>
    <select id="category" class="form-control" name="category">
        <option value="0">糖果</option>
        <option value="1">蛋糕</option>
        <option value="2">餅乾</option>
        <option value="3">麵包</option>
        <option value="4">法式甜點</option>
        <option value="5">中式點心</option>
        <option value="6">其他</option>
    </select>
    </div>

    <div id="ingredientBlock" class="column">
        <div class="row">
            <div class="col-md-6 ing-type-block form-group">
                <label for="ingredient"> 食材1 </label>
                <select id="ingredientType1" name="ingredientType[]" class="ingredient-row form-control">
                </select>
            </div>
            <div class="col-md-3 form-group">
                <label for="ingredientQuantity1"> 食材數量</label>
                <input id="ingredientQuantity1" class="form-control" name="ingredientQuantity[]" data-field="ingredientQuantity" class="ingredientQuantity-row" required>
                <span class="error" style="display: none">食材數量請輸入數字</span><br>
            </div>
            <div class="col-md-3 form-group">
                <label class>食材控制</label><br>
                <button type="button" class="btn btn-secondary form-control" id="ingIncreaseButton" style="width: 5vw;">追加食材</button>
            </div>
        </div>
    </div>

    <div id="intorBlock">
    <label for="intro">課程簡介</label>
    <textarea id="intro" name="courseIntro" class="form-control" rows="4" maxlength="500" required></textarea>
    <span class="error" style="display: none">簡介不可超過500字。</span><br>
    </div>
    <div class="row">
        <div id="courseLimitBlock" class="col-md-6 form-group">
            <label for="courseLimit">人數上限</label>
            <input type="number" class="form-control" id="courseLimit" name="courseLimit" required>
            <span class="error" style="display: none">請勿輸入數字以外的字元。</span><br>
        </div>
        <div id="priceBlock" class="col-md-6 form-group">
            <label for="price">課程價格</label>
            <input type= "number" class="form-control" id="price" name="price" required>
            <span class="error" style="display: none">請勿輸入數字以外的字元。</span><br>
        </div>
    </div>
    <div id="picBlock">
    <label for="coursePic">上傳圖片</label>
    <input type="file" class="form-control" id="coursePic" name="coursePic" accept="image/*"><br>
    </div>
    <div id="picPreviewBlock" style="display: none;">
        <img id="picPreview" src="#" alt="圖片預覽" style="max-width: 300px; max-height: 300px;">
    </div>
    <div id="buttonBlock" class="col-md-6 form-group" style:>
        <button type="button" class="btn btn-secondary form-control" id="submitButton" style="width: 5vw;"disabled>新增課程</button>
    </div>
</form>
</div>
</div>
</div>
</div>
    <script>
        $(document).ready(function() {
            var typeFun = "${typeFun}";
            //取得食材列表
            var ingOptionString = "";
            fetch("${ctxPath}"+"/getIngredientList")
            .then(response => response.json())
            .then(data => {
                data.forEach(ingredient => {
                    ingOptionString += "<option value=" + ingredient.id + ">" + ingredient.name + "</option>"
                })
                $("#ingredientType1").html(ingOptionString);
            });

            //阻擋無權限人員新增課程
           if(typeFun !== "ADMIN" && typeFun !== "MASTER") {
            Swal.fire({
                title: "您沒有權限拜訪此頁面!",
                icon: "error",
                confirmButtonText: "確定"
            }).then((result) => {
                if(result.isConfirmed) {
                    window.location.href="/${ctxPath}/index";
                }
            });
           }
           //圖片預覽處理以及需要上傳圖片才可以送出表單
           $("#coursePic").on("change", function () {
                        const previewBlock = $("#picPreviewBlock");
                        const preview = $("#picPreview");
                        const input = this;
                        if (input.files && input.files[0]) {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                preview.attr("src", e.target.result);
                                // 啟用新增按钮
                                $("#submitButton").prop("disabled", false);
                            };
                            reader.readAsDataURL(input.files[0]);
                            previewBlock.show(); // 顯示圖片預覽區塊
                        } else {
                            previewBlock.hide(); // 隱藏圖片預覽區塊
                            // 禁用新增按钮
                            $("#submitButton").prop("disabled", true);
                        }
                    });

        var ingredientIndex = 2;
        //新增食材欄位的按鈕事件
    $("#ingIncreaseButton").click(function() {
        var newIngredientTypeGroup = $("<div>").addClass("col-md-6 ing-type-block form-group");
        var newIngredientQuantityGroup = $("<div>").addClass("col-md-3 form-group");
        var newIngredientButtonGroup = $("<div>").addClass("col-md-3 form-group");
        var newIngredientBlock = $("<div>").addClass("row").append(newIngredientTypeGroup).append(newIngredientQuantityGroup).append(newIngredientButtonGroup);
        $("<label>").text("食材" + ingredientIndex).addClass("ingredient-label").appendTo(newIngredientTypeGroup);
        var selectElement = $("<select>").addClass("ingredient-row form-control").attr("name", "ingredientType[]").appendTo(newIngredientTypeGroup);

        $("<label>").text("食材數量").appendTo(newIngredientQuantityGroup);
        $("<input>").addClass("ingredientQuantity form-control").attr({
            "name": "ingredientQuantity[]",
          "data-field": "ingredientQuantity",
          "required": true
        }).appendTo(newIngredientQuantityGroup);
        $("<span>").addClass("error").css("display", "none").text("食材數量請輸入數字").appendTo(newIngredientQuantityGroup);
        $("<label>").text("食材控制").appendTo(newIngredientButtonGroup);
        $("<br>").appendTo(newIngredientButtonGroup);
        $("<button>").addClass("removeButton btn btn-secondary form-control")
                     .attr("type", "button")
                     .text("移除食材")
                     .css("width", "5vw")
                     .appendTo(newIngredientButtonGroup);

        // 將食材列表新增至選擇框內
        selectElement.html(ingOptionString);

        $("#ingredientBlock").append(newIngredientBlock);

        ingredientIndex = $(".ingredient-row").length + 1; // 重新計算index

        updateIngredientLabels(); // 更新所有食材欄位的標籤
    });

    // 更新所有食材編號的處理
    function updateIngredientLabels() {
        $(".ing-type-block").each(function(index) {
            $(this).find(".ingredient-label").text("食材" + (index + 1) + ": ");
        });
    }

    // 移除食材欄位的事件處理
    $("#ingredientBlock").on("click", ".removeButton", function() {
        $(this).closest(".row").remove();
        ingredientIndex = $(".ingredient-row").length + 1; // 重新計算index
        updateIngredientLabels(); // 更新所有食材欄位的標籤
    });
    //送出表單的事件處理
    $("form").submit(function(event){

            // 輸入課程名稱
            var courseName = $("#courseName").val();

            // 簡介內容
            var introContent = $("#intro").val();

            // 簡介字數
            var introLength = introContent.length;

            // 設置字數限制
            var maxLength = 500;
            // 驗證課程名稱輸入是否為中文
            var pattern = /^[\u4e00-\u9fa5]+$/;
            //取得人數上限及課程價格
            var courseLimitValue = $("#courseLimit").val();
            var priceValue = $("#price").val();

            // 正則表達檢查輸入
            var isValidCourseLimit = /^[0-9]+$/.test(courseLimitValue);
            var isValidPrice = /^[0-9]+$/.test(priceValue);
        // 驗證長度並防止提交
        if (courseName.length > 20) {
            $(".error-stringlimit").css("display", "block");
            event.preventDefault(); // 阻止表單提交
        } else if (!pattern.test(courseName)) {
            $(".error-invalidsymbol").css("display", "block");
            event.preventDefault(); // 阻止表單提交
        } // 如果簡介超過500字阻止提交表單
        else if (introLength > maxLength) {
            $(".error").css("display", "block").text("簡介不可超過500字。");
            event.preventDefault(); // 阻止表單提交
        }

        else if (!isValidCourseLimit) {
            $(".courseLimitBlock .error").css("display", "block").text("請勿輸入數字以外的字元。");
            event.preventDefault();
        }

        else if (!isValidPrice) {
            $(".priceBlock .error").css("display", "block").text("請勿輸入數字以外的字元。");
            event.preventDefault();
        }
        //若所有輸入欄位都驗證完則提交
        else {
            var form = $("form")[0];
            var formData = new FormData(form);
            console.log(formData);
            for (var pair of formData.entries()) {
        console.log(pair[0] + ': ' + pair[1]);
    }
            event.preventDefault();
        fetch("${ctxPath}"+"/addNewCourse", {
            method: "post",
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if(data.errorMessage != null) {
                Swal.fire({
                    title: data.errorMessage,
                    icon: "error",
                    confirmButtonText: "確定"
                });
            } else {
                Swal.fire({
                    title: "課程註冊成功",
                    icon: "success",
                    confirmButtonText: "確定"
                }).then((result) => {
                    if(result.isConfirmed) {
                        window.location.href = "${ctxPath}" + "/desertcourse/listalldesertcoursecalendar.jsp";
                    }
                })
            }
        })
        }
                        });
    //------------------------------驗證及錯誤訊息----------------------------------------
    $("#courseName").on("input", function () {
        // 得到輸入課程的名稱
        var courseName = $(this).val();

        // 驗證課程名稱長度
        if (courseName.length > 20) {
            $(".error-stringlimit").css("display", "block");
        } else {
            $(".error-stringlimit").css("display", "none");
        }

        // 驗證名稱是否只包含中文
        var pattern = /^[\u4e00-\u9fa5]+$/;
        if (!pattern.test(courseName)) {
            $(".error-invalidsymbol").css("display", "block");
        } else {
            $(".error-invalidsymbol").css("display", "none");
        }
    });
    $("#intro").on("input", function () {
        // 獲得簡介內容
        var introContent = $(this).val();

        // 獲得簡介長度
        var introLength = introContent.length;

        // 設置字元長度限制
        var maxLength = 500;

        // 顯示錯誤訊息
        if (introLength > maxLength) {
            $(".error").css("display", "block").text("簡介不可超過500字。");
        } else {
            $(".error").css("display", "none").text("");
        }
    });

// 人數上限驗證
$("#courseLimit").on("input", function () {
    var inputValue = $(this).val().trim(); // 移除前後空格
    // 使用正則表達來驗證是否為有效的數字
    var isValid = /^\d+$/.test(inputValue);

    if (inputValue && !isValid) { // 如果輸入不為空且不是有效的數字
        $(".courseLimitBlock .error").css("display", "block").text("請輸入有效的人數上限。");
    } else {
        $(".courseLimitBlock .error").css("display", "none").text("");
    }
});

// 課程價格驗證框
$("#price").on("input", function () {
    var inputValue = $(this).val().trim(); // 移除前後空格

    // 使用正則表達來驗證是否為有效的數字
    var isValid = /^\d+$/.test(inputValue);

    if (inputValue && !isValid) { // 如果輸入不為空且不是有效的數字
        $(".priceBlock .error").css("display", "block").text("請輸入有效的課程價格。");
    } else {
        $(".priceBlock .error").css("display", "none").text("");
    }
});





        });
    </script>
</body>

</html>
