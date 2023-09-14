<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/front_header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單列表</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Arial:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/datatable_style.css" />
        <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/front_basic_style.css" />
</head>

<body>
<section id="navibar">
<jsp:include page="/desertcourse/navibar.jsp" />
</section>
<div id="contentBlock">
    <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
        <h2 id="title" class="title-tag" >會員訂單</h2>
    </div>
    <div id="tableBlock" class="shadow p-3 mb-5 bg-body rounded">
    <table id="reserveTable">
        <thead>
        <tr>
            <th data-field="reserveId">訂單編號</th>
            <th data-field="courseId">課程編號</th>
            <th data-field="courseName">課程名稱</th>
            <th data-field="courseDate">課程日期</th>
            <th data-field="courseSeq">課程場次</th>
            <th data-field="memName">姓名</th>
            <th data-field="headcount">報名人數</th>
            <th data-field="status">訂單狀態</th>
            <th data-field="createTime">訂單創建日期</th>
            <th data-field="totalPrice">總金額</th>
            <th>操作</th>
        </tr>
        </thead>
    </table>
    </div>
</div>

<script>
        $(document).ready(function () {
            var getMemId = "${memId}";
            if (getMemId == '') {
                // 啟動定時器，3秒後導航到其他網頁
                setTimeout(function() {
                window.location.href = "${ctxPath}/member/mem_login.jsp";
                }, 3000); 
                Swal.fire({
                    title: "您尚未登入，請登入。",
                    icon: "warning",
                    confirmButtonText: "確定"
                }).then(function(result){
                    if(result.isConfirmed) {
                        window.location.href="${ctxPath}/member/mem_login.jsp";
                    }
                });
            } else{

            function loadReserve(getMemId) {
                $.ajax({
                    url: "${ctxPath}/getReserve",
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: { memberId: getMemId },
                    dataType: 'json',
                    success: function (data) {
                        // 使用 jQuery Table 來動態生成表格
                        $('#reserveTable').DataTable({
                            language: {
                                "sProcessing": "處理中...",
                                "sLengthMenu": "顯示 _MENU_ 項結果",
                                "sZeroRecords": "沒有匹配結果",
                                "sInfo": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                                "sInfoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                                "sInfoFiltered": "(從 _MAX_ 項結果過濾)",
                                "sInfoPostFix": "",
                                "sSearch": "搜索:",
                                "sUrl": "",
                                "sEmptyTable": "表格中無可用數據",
                                "sLoadingRecords": "載入中...",
                                "sInfoThousands": ",",
                                "oPaginate": {
                                    "sFirst": "首頁",
                                    "sPrevious": "上一頁",
                                    "sNext": "下一頁",
                                    "sLast": "末頁"
                                },
                                "oAria": {
                                    "sSortAscending": ": 升冪排列",
                                    "sSortDescending": ": 降冪排列"
                                }
                            },
                            data: data,
                            lengthMenu: [5, 10, 25, 50],
                            pageLength: 5,
                            columns: [
                                { data: 'reserveId' },
                                { data: 'courseId', visible: false },
                                { data: 'courseName' },
                                { data: 'courseDate' },
                                { data: 'courseSeq' },
                                { data: 'memName' },
                                { data: 'headcount' },
                                { data: 'status' },
                                { data: 'createTime' },
                                { data: 'totalPrice' }
                            ],
                            columnDefs: [{
                                targets: 10,
                                render: function (data, type, row, meta) {
                                    if (row.status === "預約單成立") {
                                        return '<button class="delete-btn btn btn-warning" data-reserveId="' + row.reserveId + '">取消預約單</button>';
                                    }
                                    else {
                                        return '';
                                    }
                                }
                            }
                            ],
                            lengthMenu: [5, 10, 25, 50, 100],
                            pageLength: 5
                        });
                    },
                    error: function () {
                        alert('Failed to fetch data from server.');
                    }
                });
            }
            loadReserve(getMemId);
            function deleteReserve(resId) {
                $.ajax({
                    url: '${ctxPath}/modifyReserve',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: { reserveId: resId,
                    action: "delete"},
                    success: location.reload()
                });
            }
            $(document).on('click', '.delete-btn', function () {
                let reserveId = $(this).data('reserveid');

                // 使用 SweetAlert 的確認視窗
                Swal.fire({
                    title: '確定要刪除訂單嗎？',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '確定',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        deleteReserve(reserveId);
                    }
                });
            });
            }
        });
    </script>
    <jsp:include page="/front_footer.jsp" />
</body>

</html>