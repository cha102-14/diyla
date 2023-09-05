<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單列表</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<jsp:include page="/front_header.jsp" />
<section id="navibar">
<jsp:include page="/desertcourse/navibar.jsp" />
</section>
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


<script>
        $(document).ready(function () {
            var getMemId = 1;

            function loadReserve(getMemId) {
                $.ajax({
                    url: "${ctxPath}/getReserve",
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: { memberId: getMemId },
                    dataType: 'json',
                    success: function (data) {
                        // 使用 jQuery Table 來動態生成表格
                        $('#reserveTable').DataTable({
                            data: data,
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
                                        return '<button class="delete-btn" data-reserveId="' + row.reserveId + '">取消預約單</button>';
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

        });
    </script>
    <jsp:include page="/front_footer.jsp" />
</body>

</html>