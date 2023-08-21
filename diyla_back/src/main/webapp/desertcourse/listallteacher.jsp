<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <%
        request.setAttribute("requestTeaId", 1);

    %>
</head>

<body>
<table id="teacherTable">
    <thead>
    <tr>
        <th data-field="teacherId">師傅編號</th>
        <th data-field="teacherName">師傅姓名</th>
        <th data-field="teacherStatus">師傅狀態</th>
        <th data-field="gender">性別</th>
        <th data-field="speciality">專長</th>
        <th data-field="teacherPhone">電話號碼</th>
        <th data-field="teacherEmail">電子信箱</th>
        <th data-field="teacherPic">照片</th>
        <th data-field="teacherIntro">教師簡介</th>
        <th>操作</th>
    </tr>
    </thead>
</table>

<script>
        $(document).ready(function () {
            // if(${request.requestTeaId} !== null) {
            //     teacherId = ${request.requestTeaId};
            //     }
            //判斷瀏覽人能對list的控制權, 回傳-1代表管理員,0代表該後台員工無法修改, 1~n代表回回傳師傅id
            function checkAuth(empId){
                return empId;
            }
            teacherId = checkAuth(-1);
            function loadTeacher(teaId) {
                $.ajax({
                    url: '/${ctxPath}/getAllTeacher', // 替換成實際的後端 servlet URL
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: { teacherId: teaId },
                    dataType: 'json',
                    success: function (data) {
                        // 使用 jQuery Table 來動態生成表格
                        $('#reserveTable').DataTable({
                            data: data,
                            searching: true,
                            //追加預設值搜尋的功能
                            if(${param.defaultSearchValue} !== null){
                                let defaultSearchValue = ${param.defaultSearchValue};
                            search: { search: defaultSearchValue },
                            }
                            columns: [
                                { data: 'teacherId' },
                                { data: 'teacherName' },
                                { data: 'teacherStatus' },
                                { data: 'gender' },
                                { data: 'speciality' },
                                { data: 'teacherPhone' },
                                { data: 'teacherEmail' },
                                { data: 'teacherPic' },
                                { data: 'teacherIntro'}
                            ],
                            columnDefs: [{
                                targets: 9,
                                render: function (data, type, row, meta) {
                                    if (teacherId === -1){
                                        return '<button class="modify-btn" data-teacherId="' + row.teacherId + '">修改師傅資訊</button>'
                                        + '<button class="delete-btn" data-teacherId="' + row.teacherId + '">刪除師傅</button>';
                                    }
                                    else if(teacherId > 0 && row.teacherId === teacherId){
                                        return '<button class="modify-btn" data-teacherId="' + row.teacherId + '">修改師傅資訊</button>';
                                    }
                                    else {
                                        return '';
                                    }
                                }
                            }
                            ]
                        });
                    },
                    error: function () {
                        alert('Failed to fetch data from server.');
                    }
                });
            }
            loadTeacher(teacherId);
            // function modifyTeacher(teaId) {
            //     $.ajax({
            //         url: '/diyla_back/modifyTeacher',
            //         method: 'post',
            //         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            //         data: { teacherId: teaId },
            //         success: function(response){
            //                 window.location.href='/${ctxPath}/teacherActionVerify?action=modify&teacherId=' + teaId;
            //         }
            //     });
            // }
            $(document).on('click', '.modify-btn', function(){
                //導向servlet,傳送teacherId,再從目前連線session抓取相關權限id,若合格的話便導向修改頁面
                window.location.href='/${ctxPath}/teacherActionVerify?action=modify&teacherId=' + teaId;
            });

            $(document).on('click', '.delete-btn', function () {
                let delTeacherName = $(this).data('teacherName');
                let delTeacherId = $(this).data('teacherId');

                // 使用 SweetAlert 的確認視窗
                Swal.fire({
                    title: '確定要刪除該位師傅嗎？',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '確定',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        //導向servlet,傳送teacherId,再從目前連線session抓取相關權限id,若合格的話便導向修改頁面
                        $.ajax({
                    url: '/${ctxPath}/teacherActionVerify',
                    method: 'post',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: 'json',
                    data: {
                        action: "delete"
                        teacherId: delTeacherId },
                    success: function(response){
                            if(response.isAllowed) {
                                Swal.fire({
                                    title:'刪除師傅成功!',
                                    icon: 'success',
                                    confirmButtonText: '確定'
                                }).then((result) => {
                                    if(result.isConfirmed) {
                                        let searchValue = delTeacherName;
                                        let url= "/${ctxPath}/listallteacher.jsp?defaultSearchValue=" + encodeURIComponment(delTeacherName);
                                        window.location.href= url;
                                    }
                                })
                            } else{
                                Swal.fire({
                                    title: '無權限! 刪除師傅失敗!',
                                    icon: 'error',
                                    confirmButtonText: '確定'
                                })
                            }
                    }
                });
                    }
                });
            });

        });
    </script>

</body>

</html>