<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.cha102.diyla.empmodel.EmpVO" %>
<%@ page import="com.cha102.diyla.empmodel.EmpService" %>
<%@ page import="com.cha102.diyla.empmodel.EmpDAOImpl" %>
<%@ page import="com.cha102.diyla.empmodel.EmpDAO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
<%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="/index.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教師列表</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/back_datatable_style.css" />
    <%
        //默認使用者type為notAuth
        String type = "notAuth"; 
        EmpService empService = new EmpService();
        EmpDAO empDAO = new EmpDAOImpl();
        TeacherService teacherService = new TeacherService();
        //若session並非為null才往下
        Integer empId = (Integer) (session.getAttribute("empId"));
        List<String> typeFun = (List<String>) session.getAttribute("typeFun");
        if(session != null && empId != null && typeFun != null){
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
            Integer teacherId = null;
            TeacherVO teacher = null;
            if("BACKADMIN".equals(type)) {
                List<TeacherVO> teacherList = teacherService.getAllTeacher();
                pageContext.setAttribute("teacherList", teacherList);
            } else if ("MASTER".equals(type)) {
                teacher = teacherService.getOneTeacherByEmpId(empId);
                teacherId = teacher.getTeaId();
            }
            pageContext.setAttribute("type", type);
            pageContext.setAttribute("requestTeaId", teacherId);
            pageContext.setAttribute("teacherName", empName);
        } else {
            type = "NOSESSION";
            pageContext.setAttribute("type", type);
        }
        
    %>
</head>

<body>
<div id="pageContent">
        <div id="naviContentBlock">
            <div id="naviBlock">
                <jsp:include page="/desertcourse/navibar.jsp" />
            </div>
                <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
                    <h2 id="title" class="title-tag" >教師列表</h2>
                </div>
        <div id="contentBlock">
        <div id="tableBlock">
<table id="teacherTable" class="hover display">
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
</div>
</div>
</div>
</div>
<script>
        $(document).ready(function () {
            //判斷瀏覽人能對list的控制權, 回傳-1代表管理員,0代表該後台員工無法瀏覽, 1~n代表回回傳師傅id
            var type = "${type}";
            var getTeaCode = 0;
            if (type === "NOSESSION"){
                                // 啟動定時器，3秒後導航到其他網頁
                setTimeout(function() {
                window.location.href = "${ctxPath}/emp/empLogin.jsp";
                }, 3000); // 3000 毫秒 = 3 秒

                Swal.fire({
                title: "您沒有登入!",
                icon: "warning",
                confirmButtonText: "確定"
             }).then(function(result){
                if(result.isConfirmed) {
                    window.location.href = "${ctxPath}/emp/empLogin.jsp";
                }
             });
            } else {
                if (type === "BACKADMIN") {
                    getTeaCode = -1;
                } else if (type === "MASTER") {
                    getTeaCode = "${requestTeaId}";
                }
            let defaultSearchValue = "${param.defaultSearchValue}";
            let searchOptions = defaultSearchValue !== null ? { search: defaultSearchValue } : {};
            function loadTeacher(Id) {
                $.ajax({
                    url: '${ctxPath}'+'/getAllTeacher',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: { teacherId: Id },
                    dataType: "json",
                    success: function (data) {
                        // 使用 jQuery Table 來動態生成表格
                        $('#teacherTable').DataTable({
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
                            searching: true,
                            searchDelay: 500,
                            lengthMenu: [5,10,25,50],
                            //追加預設值搜尋的功能
                            search: searchOptions,
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
                            columnDefs: [

                            {
                                targets: 7, // 對應 'teacherPic' 的索引（從 0 開始）
                                render: function (data, type, row, meta) {
                                    if (type === 'display') {
                                        return '<img src="' + '${ctxPath}' + '/DBPicReader?teacherId=' + row.teacherId + '&action=teacherPic" alt="Teacher Pic" width="100" height="100">';
                                    }
                                    return '';
                                }
                            }, {
                                targets: 9, // 對應操作按鈕的索引（從 0 開始）
                                render: function (data, type, row, meta) {
                                    if (getTeaCode === -1 && row.teacherStatus == "前台可見") {
                                        return '<div class="button-group"><button type="button" class="modify-btn btn btn-primary" data-teacherId="' + row.teacherId + '">修改師傅</button>'
                                            + '<button type="button" class="delete-btn btn btn-danger" data-teacherId="' + row.teacherId + '"data-teacherName="'+ row.teacherName +'">隱藏師傅</button></div>';
                                    } else if (getTeaCode === -1 && row.teacherStatus == "不可見") {
                                        return '<div class="button-group"><button type="button" class="modify-btn btn btn-primary" data-teacherId="' + row.teacherId + '">修改師傅</button>'
                                            + '<button type="button" class="back-btn btn btn-warning" data-teacherId="' + row.teacherId + '"data-teacherName="'+ row.teacherName +'">恢復師傅</button></div>';
                                    } else if (getTeaCode > 0 && row.teacherId == getTeaCode) {
                                        return '<div class="button-group"><button type="button" class="modify-btn btn btn-primary" data-teacherId="' + row.teacherId + '">修改師傅</button></div>';
                                    } else {
                                    return '';
                                    }
                                }
                            }]
                        });
                    },
                    error: function () {
                        Swal.fire({
                            title: '抱歉，網頁發生問題，請重新整理或登入。',
                            icon: 'error',
                            confirmButtonText: '確定'
                        });
                    }
                });
            }
            loadTeacher(getTeaCode);

            $(document).on('click', '.modify-btn', function(modifyAction){
                //導向servlet,傳送teacherId,再從目前連線session抓取相關權限id,若合格的話便導向修改頁面
                let rowTeacherId = $(this).data('teacherid');
                window.location.href="${ctxPath}"+"/verifyTeacherAction?action=modify&teacherId=" + rowTeacherId;
            });
            //處理刪除按鈕事件
            $(document).on('click', '.delete-btn', function () {
                let delTeacherName = $(this).data('teachername');
                let delTeacherId = $(this).data('teacherid');

                // 使用 SweetAlert 的確認視窗
                Swal.fire({
                    title: '確定要隱藏該位師傅嗎？',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '確定',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        //導向servlet,傳送teacherId,再從目前連線session抓取相關權限id,若合格的話便導向修改頁面
                    $.ajax({
                    url: "${ctxPath}"+"/verifyTeacherAction",
                    method: 'get',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: 'json',
                    data: {
                        action: "delete",
                        teacherId: delTeacherId },
                    success: function(response){
                            if(response.isAllowed) {
                                Swal.fire({
                                    title:'隱藏師傅成功!',
                                    icon: 'success',
                                    confirmButtonText: '確定'
                                }).then((result) => {
                                    if(result.isConfirmed) {
                                        let searchValue = delTeacherName;
                                        let url= "${ctxPath}"+"/desertcourse/listallteacher.jsp?defaultSearchValue=" + delTeacherName;
                                        window.location.href= url;
                                    }
                                })
                            } else{
                                Swal.fire({
                                    title: '無權限! 隱藏師傅失敗!',
                                    icon: 'error',
                                    confirmButtonText: '確定'
                                })
                            }
                    }
                });
                    }
                });
            });
            //覆職按鈕事件處理
            $(document).on('click', '.back-btn', function () {
                let backTeacherName = $(this).data('teachername');
                let backTeacherId = $(this).data('teacherid');

                // 使用 SweetAlert 的確認視窗
                Swal.fire({
                    title: '確定要覆職該位師傅嗎？',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '確定',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        //導向servlet,傳送teacherId,再從目前連線session抓取相關權限id,若合格的話便導向修改頁面
                    $.ajax({
                    url: "${ctxPath}"+"/verifyTeacherAction",
                    method: 'get',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: 'json',
                    data: {
                        action: "back",
                        teacherId: backTeacherId },
                    success: function(response){
                            if(response.isAllowed) {
                                Swal.fire({
                                    title:'恢復師傅成功!',
                                    icon: 'success',
                                    confirmButtonText: '確定'
                                }).then((result) => {
                                    if(result.isConfirmed) {
                                        let searchValue = backTeacherName;
                                        let url= "${ctxPath}"+"/desertcourse/listallteacher.jsp?defaultSearchValue=" + backTeacherName;
                                        window.location.href= url;
                                    }
                                })
                            } else{
                                Swal.fire({
                                    title: '無權限! 恢復師傅失敗!',
                                    icon: 'error',
                                    confirmButtonText: '確定'
                                })
                            }
                    }
                });
                    }
                });
            });
            }
        });
    </script>

</body>

</html>