<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>新增diy項目</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- select2 css -->
    <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />

    <!-- dropzone css -->
    <link href="assets/css/dropzone.min.css" rel="stylesheet" type="text/css" />

    <!-- preloader css -->
    <link rel="stylesheet" href="assets/css/preloader.min.css" type="text/css" />

    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

    <link href="//unpkg.com/layui@2.8.15/dist/css/layui.css" rel="stylesheet">
    <!-- 引入 SweetAlert2 的 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">

    <!-- 引入 SweetAlert2 的 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
</head>


<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->
<div>

    <div class="page-content" style="padding:20px">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">新增DIY品項</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="back_diycate.jsp">DIY項目管理</a></li>
                                <li class="breadcrumb-item active">新增DIY品項</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-12">
                    <div class="card">

                        <div class="card-body">
                            <form id="cateForm">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <!--<div class="mb-3">-->
                                        <!--    <label for="productname">DIY品項編號</label>-->
                                        <!--    <input id="productname" name="productname" type="text" class="form-control">-->
                                        <!--</div>-->
                                        <div class="mb-3">
                                            <label for="diyName">DIY品項名稱</label>
                                            <input id="diyName" name="diyName" type="text" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label for="amount">DIY金額</label>
                                            <input id="amount" name="amount" type="text" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label class="control-label">DIY類別</label>

                                            <select id="diyCategoryName" name="diyCategoryName" class="select2 form-control select2-multiple" >
                                                <option value="0">小點心</option>
                                                <option value="1">蛋糕</option>
                                                <option value="2">派塔</option>
                                                <option value="3">生乳酪</option>
                                            </select>

                                        </div>

                                    </div>

                                    <div class="col-sm-6">

                                        <div class="mb-3">
                                            <label class="control-label">品項上/下架狀態</label>

                                            <select id="diyStatus" class="select2 form-control select2-multiple" >
                                                <option value="0">上架</option>
                                                <option value="1">下架</option>
                                            </select>

                                        </div>
                                        <div class="mb-3">
                                            <label for="itemDetails">DIY品項詳情</label>
                                            <textarea class="form-control" id="itemDetails" name="itemDetails" rows="10"></textarea>
                                        </div>

                                    </div>
                                </div>

                                <div class="d-flex flex-wrap gap-2">
                                    <button id="submitBtn" type="submit" class="btn btn-primary waves-effect waves-light">確定新增</button>
                                    <button id="cancelBtn" type="button" class="btn btn-secondary waves-effect waves-light">取消</button>
                                </div>
                            </form>

                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title mb-0">DIY圖片上傳</h4>
                        </div>
                        <div class="card-body">

                            <button type="button" class="layui-btn" id="ID-upload-demo-btn">
                                <i class="layui-icon layui-icon-upload"></i> 上傳圖片
                            </button>
                            <div style="width: 132px;">
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" id="ID-upload-demo-img" style="width: 200px; height: 150px;">
                                </div>
                                </div>
                                <!--<div class="layui-progress layui-progress-big" lay-showPercent="yes" lay-filter="filter-demo">-->
                                <!--    <div class="layui-progress-bar" lay-percent=""></div>-->
                                <!--</div>-->
                            </div>
                        </div>


                    </div> <!-- end card-->


                </div>
            </div>
            <!-- end row -->

        </div> <!-- container-fluid -->
    </div>
    <!-- End Page-content -->



</div>
<!-- end main content-->



<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<!-- JAVASCRIPT -->
<script src="assets/libs/jquery/jquery.min.js"></script>
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/libs/metismenu/metisMenu.min.js"></script>
<script src="assets/libs/simplebar/simplebar.min.js"></script>
<script src="assets/libs/node-waves/waves.min.js"></script>
<script src="assets/libs/feather-icons/feather.min.js"></script>
<!-- pace js -->
<script src="assets/libs/pace-js/pace.min.js"></script>

<!-- select 2 plugin -->
<script src="assets/libs/select2/js/select2.min.js"></script>

<!-- dropzone plugin -->
<script src="assets/js/dropzone.min.js"></script>

<!-- init js -->
<script src="assets/js/ecommerce-select2.init.js"></script>

<script src="assets/js/app.js"></script>

<!--    這段程式碼實現了一個圖片上傳和表單提交的功能。使用者可以選擇一張圖片，填寫表單資訊，然後點擊提交按鈕。
提交按鈕的點擊事件會透過 AJAX 發送表單數據和圖片文件到指定的後端接口，並在成功時跳轉回上一頁。同時，還有一個取消按鈕，點擊後可以返回上一頁。-->
<script src="/diyla_back/vendors/jquery/jquery-3.7.0.min.js"></script>
<script src="//unpkg.com/layui@2.8.15/dist/layui.js"></script>
<script>
    let imageData;

    layui.use(function() {
        var upload = layui.upload;
        var layer = layui.layer;
        var element = layui.element;
        var $ = layui.$;
        // 單圖片上傳

        upload.render({
            elem: $("#ID-upload-demo-btn"),
            url: "url",
            accept: 'images',
            auto: false, // 禁止自動上傳
            acceptMime: "image/*",
            size: 10000,
            choose: function(obj){
                // 預讀本地文件示例，不支援 IE8
                obj.preview(function(index, file, result){
                    $('#ID-upload-demo-img').attr('src', result); // 圖片連結（base64）
                    console.log(result)
                    console.log(file); // 取得文件對象

                    imageData = file;
                });
            }
        });

    });

    $(document).ready(function() {

        $("#submitBtn").click(function(event) {
            event.preventDefault(); // 阻止表單提交


            // 手動驗證带有 required 属性的字段
            var nameInput = document.querySelector('#diyName');
            var amountInput = document.querySelector('#amount');

            if (nameInput.value === '' && amountInput.value === '') {
                Swal.fire({
                    icon: 'error',
                    title: '錯誤',
                    text: '請輸入DIY品項名稱及DIY金額'
                });
                return; // 不繼續提交表單
            } else if (nameInput.value === '') {
                Swal.fire({
                    icon: 'error',
                    title: '錯誤',
                    text: '請輸入DIY品項名稱'
                });
                return; // 不繼續提交表單
            } else if (amountInput.value === '') {
                Swal.fire({
                    icon: 'error',
                    title: '錯誤',
                    text: '請輸入DIY金額'
                });
                return; // 不繼續提交表單
            }
            // 驗證價格輸入是否為數字
            var amountValue = parseFloat(amountInput.value);
            if (isNaN(amountValue)) {
                alert('請輸入有效的數字作為DIY金額');
                return; // 不繼續提交表單
            }
            // 添加额外的防呆机制：检查金额是否小于100
            if (amountValue < 100) {
                Swal.fire({
                    icon: 'error',
                    title: '錯誤',
                    text: 'DIY金額必須大於或等於100'
                });
                return; // 不继续提交表单
            }
            // 發送 POST 請求
            var formData = new FormData();

            // 添加 JSON 數據
            var jsonData = {
                diyName : $('#diyName').val(),
                amount  : $('#amount').val(),
                diyCategoryName : $('#diyCategoryName').val(),
                diyStatus : $('#diyStatus').val(),
                itemDetails : $('#itemDetails').val(),

                // JSON 數據的屬性
            };

            $("#amount").on("input", function() {
                // 移除非數字字符
                $(this).val($(this).val().replace(/[^0-9]/g, ""));
            });

            // 發送 POST 請求

            var formData = new FormData();

            // 添加 JSON 數據
            var jsonData = {
                diyName : $('#diyName').val(),
                amount  : $('#amount').val(),
                diyCategoryName : $('#diyCategoryName').val(),
                diyStatus : $('#diyStatus').val(),
                itemDetails : $('#itemDetails').val(),

                // JSON 數據的屬性
            };
            formData.append("diyCate", JSON.stringify(jsonData));

            if (imageData !== undefined){
                formData.append("image",imageData)

            }

            // 添加圖片文件
            // formData.append("image", imageData);

            $.ajax({
                type: "POST",
                url: "/diyla_back/api/diy-cates",
                data: formData,
                dataType: 'json',
                processData: false,  // 不處理數據
                contentType: false,  // 不設置內容類型
                success: function(data) {
                    console.log("請求成功：", data);
                    // 跳轉回上一頁
                    // 跳轉到此 URL
                    location.href = '/diyla_back/diycate/back_diycate.jsp';
                },
                error: function(error) {
                    console.log("請求失敗：", error);
                }
            });
        });

        $("#cancelBtn").click(function(event) {
            event.preventDefault();
            // 跳轉回上一頁
            history.back();
            location.href = '/diyla_back/diycate/back_diycate.jsp';
        });
    });
</script>
</body>
</html>

