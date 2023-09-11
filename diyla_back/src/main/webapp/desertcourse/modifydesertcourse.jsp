<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassINGVO" %>
<%@ page import="com.cha102.diyla.sweetclass.ingModel.IngStorageVO" %>
<%@ page import="com.cha102.diyla.back.controller.desertcourse.blobreader.Base64Converter" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改甜點課程</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <!-- 設定session的後台會員名稱以及其是否是師傅-->
    <%  //若authCode=0/1/>2 分別代表無權限後台人員/admin/以及師傅>
        //Integer empId = (Integer) session.getAttribute("empId");
        //String typeFun = (String) session.getAttribute("typeFun");
        //模擬取得目前使用者權限以及empId
        String typeFun = "ADMIN";
        session.setAttribute("typeFun", typeFun);
        Integer empId = 1;
        session.setAttribute("empId", empId);
        Integer teacherId = 1;
        ClassVO courseVO = (ClassVO) request.getAttribute("courseVO");
    %>

</head>

<body>
    <a href="${ctxPath}/desertcourse/listalldesertcoursecalendar.jsp">前往課程日曆表</a>
    <form action="${ctxPath}/modifyCourse" method="post" enctype="multipart/form-data">
    <input type="hidden" id="modifyCourseId" name="modifyCourseId" value="${courseVO.classId}">
    <c:choose>
    <c:when test="${typeFun == 'ADMIN'}">
    <div id="teacherIdField" >
        <label for="teacherId">師傅編號: </label>
        <input type="text" id="teacherId" name="teacherId" value= "${(courseVO != null) ? courseVO.teaId: ""}"><br>
    </div>
    </c:when>
    <c:otherwise>
    <div id="teacherIdField" >
        <label for="teacherId">師傅編號: </label>
        <input type="text" id="teacherId" name="teacherId" value= "${courseVO.teaId}" readonly style="background-color: #f2f2f2;"><br>
    </div>
    </c:otherwise>
    </c:choose>
    <div id="courseNameField" >
        <label for="courseName">課程名稱: </label>
        <input type="text" id="courseName" name="courseName" value="${(courseVO != null)? courseVO.className : ""}" required><br>
        <span class="error-stringlimit" style="display: none">課程名字不可超過20個字。</span>
        <span class="error-invalidsymbol" style="display: none">課程名字只允許中文字。</span>
    </div>

    <div id="courseDateBlock">
    <label for="courseDate">課程日期：</label>
    <input type="date" id="courseDate" name="courseDate" value="${(courseVO != null)? courseVO.classDate:""}"required>
    <label for="courseSeq">課程場次：</label>
    <select id="courseSeq" name="courseSeq">
        <option value="0" ${(courseVO != null) ? (courseVO.classSeq == 0 ? "selected" : ""): ""}>早上</option>
        <option value="1" ${(courseVO != null) ? (courseVO.classSeq == 1 ? "selected" : ""): ""}>中午</option>
        <option value="2" ${(courseVO != null) ? (courseVO.classSeq == 2 ? "selected" : ""): ""}>晚上</option>
    </select><br>
    </div>

    <div id="registerEndDateBlock">
    <label for="registerEndDate">註冊截止日期：</label>
    <input type="date" id="regEndDate" name="regEndDate" value="${(courseVO != null) ? courseVO.regEndTime : ""}" required>
    <span class="error" style="display: none">請輸入有效的日期(yyyy-mm-dd : hh:mm:ss)。</span><br>
    </div>

    <div id="categoryBlock">
    <label for="category">甜點課程類別：</label>
    <select id="category" name="category">
        <option value="0" ${(courseVO != null) ? (courseVO.category == 0 ? "selected" : ""): ""}>糖果</option>
        <option value="1" ${(courseVO != null) ? (courseVO.category == 1 ? "selected" : ""): ""}>蛋糕</option>
        <option value="2" ${(courseVO != null) ? (courseVO.category == 2 ? "selected" : ""): ""}>餅乾</option>
        <option value="3" ${(courseVO != null) ? (courseVO.category == 3 ? "selected" : ""): ""}>麵包</option>
        <option value="4" ${(courseVO != null) ? (courseVO.category == 4 ? "selected" : ""): ""}>法式甜點</option>
        <option value="5" ${(courseVO != null) ? (courseVO.category == 5 ? "selected" : ""): ""}>中式點心</option>
        <option value="6" ${(courseVO != null) ? (courseVO.category == 6 ? "selected" : ""): ""}>其他</option>
    </select>
    </div>

    <c:choose>
    <c:when test="${courseVO == null}">
    <div id="ingredientBlock">
    <label for="ingredient"> 食材1: </label>
    <select id="ingredientType1" name="ingredientType[]" >
    </select>
    <input id="ingredientQuantity1" name="ingredientQuantity[]" data-field="ingredientQuantity" class="ingredientQuantity-row" required>
    <button type="button" id="ingIncreaseButton">追加食材</button>
    <span class="ingNumserror" style="display: none">食材數量請輸入數字</span><br>
    </div>
    </c:when>
    <c:otherwise>
    <div id="ingredientBlock">
    <div class="ingredient-row">
    <label for="ingredient" class="typeLabel"> 食材1: </label>
    <select id="ingredientType1" name="ingredientType[]">
    <c:forEach var="ingredient" items="${ingList}" varStatus="loop">
        <option value="${ingredient.ingId}">${ingredient.ingName}</option>
        </c:forEach>
    </select>
    <label for="ingredientQuantity1">食材數量: </label><input id="ingredientQuantity1" name="ingredientQuantity[]" data-field="ingredientQuantity" class="ingredientQuantity-row" required><button type="button" id="ingIncreaseButton">追加食材</button>
    <span class="ingNumsError" style="display: none">食材數量請輸入數字</span><br>
    </div>
    <c:forEach var="reqIngVO" items="${reqCourseIngVOList}" varStatus="loop1">
        <c:if test="${loop1.index > 0}">
        <div class="ingredient-row">
        <label for="ingredient" class="typeLabel"> 食材${loop1.index + 1}: </label><select id="ingredientType${loop1.index + 1}" name="ingredientType[]" >
        <c:forEach var="ingredient" items="${ingList}" varStatus="loop">
        <option class="${ingredient.ingId}" value="${ingredient.ingId}">${ingredient.ingName}</option>
        </c:forEach>
        </select>
        <label for="ingredientQuantity${loop1.index + 1}">食材數量: </label><input id="ingredientQuantity${loop1.index + 1}" name="ingredientQuantity[]" data-field="ingredientQuantity" class="ingredientQuantity-row" required><button type="button" class="removeButton"id="ingDecreaseButton${loop1.index + 1}">移除食材</button>
        <span class="ingNumsError" style="display: none">食材數量請輸入數字</span><br>
        </div>
        </c:if>
    </c:forEach>
    </div>
    </c:otherwise>
    </c:choose>

    <div id="intorBlock">
    <label for="intro">簡介：</label>
    <textarea id="intro" name="courseIntro" rows="4" maxlength="500" required>${(courseVO != null)? courseVO.intro : ""}</textarea>
    <span class="error" style="display: none">簡介不可超過500字。</span><br>
    </div>

    <div id="courseLimitBlock">
    <label for="courseLimit">人數上限：</label>
    <input type="number" id="courseLimit" name="courseLimit" value="${(courseVO != null)? courseVO.classLimit : ""}" required>
    <span class="error" style="display: none">請勿輸入數字以外的字元。</span><br>
    </div>

    <div id="priceBlock">
    <label for="price">課程價格：</label>
    <input type= "number" id="price" name="price" value="${(courseVO != null)?courseVO.price:""}"required>
    <span class="error" style="display: none">請勿輸入數字以外的字元。</span><br>
    </div>

    <div id="picBlock">
    <label for="coursePic">上傳圖片：</label>
    <% if (courseVO != null && courseVO.getClassPic() != null) { %>
        <input type="file" id="coursePic" name="coursePic" accept="image/*" ><br>
        <img id="picPreview" src="data:image/jpeg;base64, <%= Base64Converter.byteArrayToBase64(courseVO.getClassPic()) %>" alt="圖片預覽" style="max-width: 300px; max-height: 300px;">
        <input type="hidden" id="defaultCoursePic" name="defaultCoursePic" value="<%= Base64Converter.byteArrayToBase64(courseVO.getClassPic()) %>">
    <% } else { %>
        <input type="file" id="coursePic" name="coursePic" accept="image/*"><br>
        <img id="picPreview" src="#" alt="圖片預覽" style="max-width: 300px; max-height: 300px;">
        <input type="hidden" id="defaultCoursePic" name="defaultCoursePic" value="">
    <% } %>
</div>
    <input type="submit" value="修改甜點課程資料" id="submitButton">

</form>
    <script>
        $(document).ready(function() {
            //取得食材列表
            var ingOptionString = "";
            fetch("${ctxPath}"+"/getIngredientList")
            .then(response => response.json())
            .then(data => {
                data.forEach(ingredient => {
                    ingOptionString += "<option value=" + ingredient.id + ">" + ingredient.name + "</option>"
                })

            });
            //阻擋無權限人員修改課程
           if("${typeFun}"!== "ADMIN" && "${typeFun}" !== "MASTER") {
            // 啟動定時器，5秒後導航到其他網頁
                setTimeout(function() {
                window.location.href = "${ctxPath}"+"/desertcourse/listalldesertcoursecalendar.jsp";
                }, 2500); // 5000 毫秒 = 5 秒
            Swal.fire({
                title: "您沒有權限修改課程!",
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

        var ingredientIndex = $(".ingredient-row").length + 1;
        console.log(ingredientIndex);
        //新增食材欄位的按鈕事件
    $("#ingIncreaseButton").click(function() {
        var newIngredientBlock = $("<div>").addClass("ingredient-row");

        $("<label>").addClass("typeLabel").text("食材" + ingredientIndex + ": ").appendTo(newIngredientBlock);
        var selectElement = $("<select>").addClass("ingredientType").attr("name", "ingredientType[]").appendTo(newIngredientBlock);
        $("<label>").text(" 食材數量: ").appendTo(newIngredientBlock);
        $("<input>").addClass("ingredientQuantity").attr({
          "name": "ingredientQuantity[]",
          "data-field": "ingredientQuantity",
          "required": true
        }).appendTo(newIngredientBlock);
        $("<button>").addClass("removeButton").attr("type", "button").text("移除食材").appendTo(newIngredientBlock);
        $("<span>").addClass("ingNumserror").css("display", "none").text("食材數量請輸入數字").appendTo(newIngredientBlock);

        // 將食材列表新增至選擇框內
        selectElement.html(ingOptionString);

        $("#ingredientBlock").append(newIngredientBlock);

        ingredientIndex = $(".ingredient-row").length + 1; // 重新計算index

        updateIngredientLabels(); // 更新所有食材欄位的標籤
    });

    // 更新所有食材編號的處理
    function updateIngredientLabels() {
        $(".ingredient-row").each(function(index) {
            $(this).find(".typeLabel").text("食材" + (index + 1) + ": ");
        });
    }

    // 移除食材欄位的事件處理
    $("#ingredientBlock").on("click", ".removeButton", function() {
        $(this).closest(".ingredient-row").remove();
        ingredientIndex = $(".ingredient-row").length + 1; // 重新計算index
        updateIngredientLabels(); // 更新所有食材欄位的標籤
    });
    //處理傳進來的courseId對應的預設食材及數量
    var courseIngIdList = ${reqCourseIngIdList};
    var courseIngAmountList = ${reqCourseIngAmountList};
    courseIngIdList.forEach(function(ingId, index) {
        var selectElement = $("#ingredientType" + (index + 1));
        selectElement.val(ingId); // 選擇某特定值的選項
    });
    courseIngAmountList.forEach(function(ingAmount, index) {
    var selectAmountInput = $("#ingredientQuantity" + (index + 1));
    selectAmountInput.val(ingAmount);
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
            event.preventDefault();
        fetch("${ctxPath}"+"/modifyCourse", {
            method: "post",
            body: formData
        })
        .then(response => response.json())
        .then(errorMessage => {
            if(errorMessage.length !== 0) {
                Swal.fire({
                    title: errorMessage,
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
                        window.location.href = "${ctxPath}" + "/viewAllCourseCalendar";
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
