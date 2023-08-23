<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增課程</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <!-- 設定session的後台會員名稱以及其是否是師傅-->
    <%  //若authCode=0/1/>2 分別代表無權限後台人員/admin/以及師傅>
        Integer authCode = 1;
        Integer teacherId = 1;
        Integer empId = 1;
        String empName = "無詠致";
        session.setAttribute("authCode", authCode);
        session.setAttribute("teacherId", teacherId);
        session.setAttribute("teacherName", empName);
        session.setAttribute("empId", empId);

    %>



</head>

<body>
    <form action="/${ctxPath}/addNewCourse" method="post" enctype="multipart/form-data">
    <c:choose>
    <c:when test="${authCode == 1}">
    <div id="teacherIdField" >
        <label for="teacherId">師傅編號: </label>
        <input type="text" id="teacherId" name="teacherId" ><br>
    </div>
    </c:when>
    <c:otherwise>
    <div id="teacherIdField" >
        <label for="teacherId">師傅編號: </label>
        <input type="text" id="teacherId" name="teacherId" value= ${teacherId} readonly style="background-color: #f2f2f2;"><br>
    </div>
    </c:otherwise>
    </c:choose>
    <div id="courseNameField" >
        <label for="courseName">課程名稱: </label>
        <input type="text" id="courseName" name="courseName" ><br>
    </div>

    <div id="courseDateBlock">
    <label for="courseDate">課程日期：</label>
    <input type="date" id="courseDate" name="courseDate" required>
    <%-- <button type="button" id="calendarButton">選擇日期</button> --%>
    <label for="courseSeq">課程場次：</label>
    <select id="courseSeq" name="courseSeq">
        <option value="0">早上</option>
        <option value="1">中午</option>
        <option value="2">晚上</option>
    </select><br>
    </div>

    <div id="registerEndDateBlock">
    <label for="registerEndDate">註冊截止日期：</label>
    <input type="date" id="regEndDate" name="regEndDate" required>
    <span class="error" style="display: none">請輸入有效的日期(yyyy-mm-dd : hh:mm:ss)。</span><br>
    </div>

    <div id="ingredientBlock">
    <label for="ingredient"> 食材1: </label>
    <select id="ingredientType1" name="ingredientType" class="ingredient-row">
    </select>
    <input id="ingredientQuantity1" name="ingredientQuantity" data-field="ingredientQuantity" class="ingredientQuantity-row" required>
    <button type="button" id="ingIncreaseButton">追加食材</button>
    <span class="error" style="display: none">食材數量請輸入數字</span><br>
    </div>

    <div id="intorBlock">
    <label for="intro">簡介：</label>
    <textarea id="intro" name="courseIntro" rows="4" maxlength="500" required></textarea>
    <span class="error" style="display: none">簡介不可超過500字。</span><br>
    </div>

    <div id="courseLimitBlock">
    <label for="courseLimit">人數上限：</label>
    <input id="courseLimit" name="courseLimit" required>
    <%-- <span id="teaemail.errors" class="error">${errorMsgs.teaEmail}<br/></span> --%>
    <span class="error" style="display: none">請輸入數字。</span><br>
    </div>

    <div id="priceBlock">
    <label for="price">課程價格：</label>
    <input id="price" name="price" required>
    <%-- <span id="teaemail.errors" class="error">${errorMsgs.teaEmail}<br/></span> --%>
    <span class="error" style="display: none">請輸入數字。</span><br>
    </div>

    <div id="picBlock">
    <label for="coursePic">上傳圖片：</label>
    <input type="file" id="coursePic" name="coursePic" accept="image/*"><br>
    </div>
    <div id="picPreviewBlock" style="display: none;">
        <img id="picPreview" src="#" alt="圖片預覽" style="max-width: 300px; max-height: 300px;">
    </div>
    <input type="submit" value="新增" id="submitButton" disabled>
    <button type="button" id="clearbutton" >清除所有欄位</button>
</form>


    <script>
        $(document).ready(function () {
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
           if(${authCode == 0}) {
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
        var newIngredientBlock = $("<div>").addClass("ingredient-row");

        $("<label>").text("食材" + ingredientIndex + ": ").appendTo(newIngredientBlock);
        var selectElement = $("<select>").addClass("ingredientType").attr("name", "ingredientType").appendTo(newIngredientBlock);
        $("<input>").addClass("ingredientQuantity").attr({
          "name": "ingredientQuantity",
          "data-field": "ingredientQuantity",
          "required": true
        }).appendTo(newIngredientBlock);
        $("<button>").addClass("removeButton").attr("type", "button").text("移除食材").appendTo(newIngredientBlock);
        $("<span>").addClass("error").css("display", "none").text("食材數量請輸入數字").appendTo(newIngredientBlock);

        // 將食材列表新增至選擇框內
        selectElement.html(ingOptionString);

        $("#ingredientBlock").append(newIngredientBlock);

        ingredientIndex = $(".ingredient-row").length + 1; // 重新計算index

        updateIngredientLabels(); // 更新所有食材欄位的標籤
    });

    // 更新所有食材編號的處理
    function updateIngredientLabels() {
        $(".ingredient-row").each(function(index) {
            $(this).find("label").text("食材" + (index + 1) + ": ");
        });
    }

    // 移除食材欄位的事件處理
    $("#ingredientBlock").on("click", ".removeButton", function() {
        $(this).closest(".ingredient-row").remove();
        ingredientIndex = $(".ingredient-row").length + 1; // 重新計算index
        updateIngredientLabels(); // 更新所有食材欄位的標籤
    });



        });
    </script>
</body>

</html>
