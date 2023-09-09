<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DIY後台</title>
    <!--DataTable的連結 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css"/>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <!--樣式連結 -->
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <!-- Page level plugins -->
    <script src="/diyla_back/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/diyla_back/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/diyla_back/js/demo/datatables-demo.js"></script>

    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css"/>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" href="../css/style.css">

    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <!-- Bootstrap core JavaScript-->
    <script src="/diyla_back/vendors/jquery/jquery-3.7.0.min.js"></script>
    <script src="/diyla_back/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/diyla_back/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/diyla_back/js/sb-admin-2.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/diyla_back/js/demo/datatables-demo.js"></script>

    <script src="//unpkg.com/layui@2.8.15/dist/layui.js"></script>

    <!-- 自訂css -->
    <style>
        .product-image {

        }

        .table-bordered th,
        .table-bordered td {
            text-align: center;
            vertical-align: middle;
        }

        /* 設置表格容器的最大高度，超過該高度時出現滾動條 */
        .table-container {
            max-height: 1px; /* 調整為適當的值 */
            overflow-y: scroll; /* 顯示縱向滾動條 */
        }

        /* 設置表格的最小寬度 */
        .custom-datatable {
            min-width: 800px; /* 調整為適當的值 */
        }

        /* 設置表格每列的最小寬度 */
        .custom-datatable th,
        .custom-datatable td {
            min-width: 100px; /* 調整為適當的值 */
            max-width: 150px; /* 設置最大寬度，調整為適當的值 */
            white-space: nowrap; /* 防止內容換行 */
            overflow: hidden; /* 隱藏溢出內容 */
            text-overflow: ellipsis; /* 在溢出時顯示省略號 */
        }

        #demo-laypage-theme-3 {
            display: flex;
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
        }


    </style>
    <link href="//unpkg.com/layui@2.8.15/dist/css/layui.css" rel="stylesheet">


</head>

<body id="page-top">
<aside class="topPage">
    <jsp:include page="../index.jsp" />
</aside>
<!-- Page Wrapper -->



<main id="main">
    <div id="content-wrapper" class="d-flex flex-column"
         style="padding-left: 0px; padding-right: 0px; padding-top: 10px;">
        <!-- Main Content -->
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">DIY項目管理</h4>
                    </div>
                    <div class="card-body">
                        <div class="text-sm-end">
                            <a href="back_add_diycate.jsp">
                                <button type="button"
                                        class="btn btn-success btn-rounded waves-effect waves-light mb-2 me-2">
                                    新增DIY品項
                                </button>
                            </a>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th class="sorting">DIY品項編號</th>
                                    <th>DIY品項名稱</th>
                                    <th>DIY類別</th>
                                    <th>DIY狀態</th>
                                    <th>DIY金額</th>
                                    <th>DIY圖片</th>
                                    <th>編輯</th>
                                    <th>刪除</th>
                                </tr>
                                </thead>
                                <tbody id="cateContainer">

                                </tbody>
                            </table>
                            <!--分页条-->
                            <div id="demo-laypage-theme-3"></div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
</main>
</div>


<!-- Content Wrapper -->

<!-- End of Content Wrapper -->

<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>


<!-- 自定義 JavaScript -->


<script>

    $(document).ready(function () {
        new DataTable('#dataTable1', {
            "ajax": {
                url: "http://localhost:8081/diyla_back/api/diy-cates",
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                dataSrc: 'content',
            },
            "columns": [
                {data: "diyNo"},
                {data: "diyName"},
                {data: "diyCategoryDisplayName"},
                {data: "diyStatusName"},
                {data: "amount"},
                {
                    data: "diyPicture", "render": function (data, type, row, meta) {
                        return `<img src="data:image/jpeg;base64,${data}" alt="商品圖片" style="width: 100px;height: 100px" class="product-image">`
                    }
                },
                {
                    data: "diyNo", "render": function (data, type, row, meta) {
                        return `<button class="btn btn-outline-info"><a href="back_edit_diycate.jsp?${data}" style="color: inherit; text-decoration: none;">編輯</a></button>`
                    }
                },
                {
                    data: "diyNo", "render": function (data, type, row, meta) {
                        return `<button class="btn btn-outline-danger" onclick="deleteRow(this,${data})">刪除</button>`
                    }
                },
            ]
        });


        layui.use(function () {
            let laypage = layui.laypage;

            function getList(s) {
                // 使用 AJAX 請求從伺服器端獲取 JSON 數據
                let xhr = new XMLHttpRequest();
                let url = 'http://localhost:8081/diyla_back/api/diy-cates'; // Servlet URL
                let params = ''; // 請求參數，以鍵值對形式拼接

                if (s == null || s == "") {
                    params += "&page=1&pageSize=10";
                } else {
                    params += s;
                }

                xhr.open('GET', url + '?' + params, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        let jsonData = JSON.parse(xhr.responseText);
                        renderCates(jsonData);
                    }
                };
                xhr.send();
            }

            getList(null);

            // 渲染
            function renderCates(data) {
                let commentContainer = document.getElementById('cateContainer');
                if (data.length === 0) {
                    commentContainer.innerHTML = '<p>商品列表為空。</p>';
                } else {
                    let html = '';
                    for (let i = 0; i < data.content.length; i++) {
                        let item = data.content[i];
                        html += '<tr>'
                        html += '<th>' + item.diyNo + '</th>'
                        html += '<th>' + item.diyName + '</th>'
                        html += '<th>' + item.diyCategoryDisplayName + '</th>'
                        html += '<th>' + item.diyStatusName + '</th>'
                        html += '<th>' + item.amount + '</th>'
                        html += '<th><img\n' +
                            'src=\"data:image/jpeg;base64,' +
                            data.content[i].diyPicture
                            + '\"' +
                            'alt="商品圖片" style="width: 100px;height: 100px" class="product-image"></th>\n'
                        html += '<td>\n' +
                            '<button class="btn btn-outline-info"><a href=' +
                            '\"back_edit_diycate.jsp?' +
                            item.diyNo +
                            '\" style="color: inherit; text-decoration: none;" >編輯</a></button></td>' +
                            '<td><button class="btn btn-outline-danger" onClick="deleteRow(this,' + item.diyNo + ')">刪除</button></td>';
                        html += '</tr>'
                    }

                    // 添加分頁

                    // 自定義主題
                    laypage.render({
                        elem: 'demo-laypage-theme-3',
                        curr: data.number + 1,
                        count: data.totalElements,
                        theme: '#FFB800',
                        jump: function (obj, first) {
                            // 首次不執行
                            if (!first) {
                                getList('&page=' + (obj.curr) + '&pageSize=10');
                            }
                        }
                    });

                    commentContainer.innerHTML = html;
                }
            }
        });
    });

    function deleteRow(button, diyNo) {
        let row = button.closest('tr');
        layer.msg('已刪除', {
            icon: 1,
            time: 2000 // 2秒關閉
        });
        $.ajax({
            type: "DELETE",
            url: "http://localhost:8081/diyla_back/api/diy-cates/" + diyNo,
            success: function (data) {
                console.log("請求成功：", data);
                console.log(button)
                row.remove();
            },
            error: function (error) {
                console.log("請求失敗：", error);
            }
        });
    }
</script>


</body>
</html>