<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <title>甜點課程訂單</title>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
                crossorigin="anonymous"></script>
            <!-- Custom styles for this template -->
            <link href="${ctxPath}/css/style.css" rel="stylesheet" />
            <!-- responsive style -->
            <link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="${ctxPath}/js/back.js"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
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
            pageContext.setAttribute("reqTeaId", teacherId);
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
                    <div id="contentBlock">
                        <table id="reserveTable">
                            <thead>
                                <tr>
                                    <th data-field="reserveId">訂單編號</th>
                                    <th data-field="courseId">課程編號</th>
                                    <th data-field="courseDateTime">課程日期場次</th>
                                    <th data-field="courseName">課程名稱</th>
                                    <th data-field="memId">會員編號</th>
                                    <th data-field="memName">會員名稱</th>
                                    <th data-field="headcount">人數</th>
                                    <th data-field="status">訂單狀態</th>
                                    <th data-field="createTime">訂單創建日期</th>
                                    <th data-field="totalPrice">總金額</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    var type = "${type}";
                    if (type === "NOSESSION") {
                    Swal.fire({
                    title: "您沒有登入!",
                    icon: "error",
                    confirmButtonText: "確定"
                    }).then((result) => {
                if(result.isConfirmed) {
                    window.location.href="${ctxPath}/emp/empLogin.jsp";
                }
            });
            setTimeout(function() {
                window.location.href = "${ctxPath}/emp/empLogin.jsp";
                }, 2500);
                    } else{
                    var Id = null;
                    //若type為ADMIN,則將teaId設-1,可瀏覽全部課程, MASTER則為後台教師,則將teaId設為目前教師Id
                    if (type === "BACKADMIN") {
                        Id = -1;
                    } else if (type === "MASTER") {
                        Id = "${reqTeaId}";
                    } else { //若是其他type,則無權限瀏覽
                    setTimeout(function(){
                    window.location.href = "${ctxPath}" + "/desertcourse/listalldesertcoursecalendar.jsp";
                    }, 3000);
                    Swal.fire({
                    title: "您無權限瀏覽課程預約單。",
                    icon:"warning",
                    confirmButtonText: "確定"
                }).then(function(result) {
                    if(result.isConfirmed) {
                        window.location.href = "${ctxPath}" + "/desertcourse/listalldesertcoursecalendar.jsp";
                    }
                });
                    }
                    function loadReserve(Id) {
                        $.ajax({
                            url: '${ctxPath}/getReserve',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            type: "post",
                            data: {
                                teaId: Id
                            },
                            dataType: 'json',
                            success: function (data) {
                                // 使用 jQuery Table 來動態生成表格
                                //(0:預約單建立，1:預約單付款完成，2:預約單取消(未退款)，3.預約單取消(退款完成)，4.預約單完成)
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
                                    searching: true,
                                    searchDelay: 500,
                                    columns: [
                                        { data: 'reserveId' },
                                        { data: 'courseId' },
                                        { data: 'courseDateSeq' },
                                        { data: 'courseName' },
                                        { data: 'memId' },
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
                                                return '<div class="button-group"><button class="success-btn btn btn-success" data-reserveId="' + row.reserveId + '">完成訂單</button>'+
                                                '<button class="delete-btn btn btn-danger" data-reserveId="' + row.reserveId + '">取消訂單</button></div>'
                                                    ;
                                            }
                                            else {
                                                return '<div class="button-group"><button disabled class="success-btn btn btn-success" data-reserveId="' + row.reserveId + '">完成訂單</button>'+
                                                '<button class="delete-btn btn btn-danger" disabled data-reserveId="' + row.reserveId + '">取消訂單</button></div>'
                                                    ;
                                            }
                                        }
                                    }
                                    ],
                                    lengthMenu: [5, 10, 25, 50, 100],
                                    pageLength: 10
                                });
                            },
                            error: function () {
                                alert('Failed to fetch data from server.');
                            }
                        });
                    }
                    loadReserve(Id);
                    function deleteReserve(resId) {
                        $.ajax({
                            url: '${ctxPath}/modifyReserve',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                reserveId: resId,
                                action: "delete"
                            },
                                success: function (data) {
                                Swal.fire({
                                    title: '訂單已修改為取消狀態!',
                                    icon: 'success',
                                    confirmButtonText: '確定'
                                }); 
                                setTimeout(function(){
                                    location.reload();
                                }, 2500);
                            }
                        });
                    }
                    function completeReserve(resId) {
                        $.ajax({
                            url: '${ctxPath}/modifyReserve',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                reserveId: resId,
                                action: "complete"
                            },
                            success: function (data) {
                                Swal.fire({
                                    title: '訂單已修改為完成狀態!',
                                    icon: 'success',
                                    confirmButtonText: '確定'
                                }); 
                                setTimeout(function(){
                                    location.reload();
                                }, 2500);
                            }
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
                    $(document).on('click', '.success-btn', function () {
                        let reserveId = $(this).data('reserveid');
                        // 使用 SweetAlert 的確認視窗
                        Swal.fire({
                            title: '確定要完成訂單嗎？',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: '確定',
                            cancelButtonText: '取消'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                completeReserve(reserveId);
                            }
                        });
                    });
                    }
                });
            </script>

        </body>

        </html>
