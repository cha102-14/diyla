<%@ page import="com.cha102.diyla.diyforummodel.MemberEntity" %>
<%@ page import="com.cha102.diyla.member.MemVO" %>
<%@ page import="com.cha102.diyla.diycatemodel.DiyCateEntity" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--JSP 標籤，用於設置網頁的語言和編碼方式-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-Hant">

<%
    //檢查使用者是否已經登入，如果尚未登入則會重新導向使用者到登入頁面。
    //如果使用者已經登入，則會從 session 中獲取名為 "member" 的屬性並將其賦值給 memberEntity 變數。
    MemVO memVO = null;
    Integer memId = null;
    //檢查 session 中是否存在登入資訊
    if (session.getAttribute("memVO") == null) {
        // 未登入，重新導向到登入頁面
        // response.sendRedirect("login.jsp");
        // return;
    } else {
        memVO = (MemVO) session.getAttribute("memVO");
        memId = (memVO != null) ? memVO.getMemId() : null;
    }

    DiyCateEntity diyCateEntity = (DiyCateEntity) request.getAttribute("DiyCateEntity");
%>

<!-- 網頁的設定和樣式 css -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi">
    <!-- 頁面標題 -->
    <title>DIYLA! || 美好的體驗</title>

    <!-- 引入不同的CSS樣式表 -->
    <link rel="stylesheet" href="/diyla_front/diy/css/all.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/bootstrap.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/slick.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/nice-select.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/venobox.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/animate.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/jquery.exzoom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.7/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/spacing.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/style.css">
    <link rel="stylesheet" href="/diyla_front/diy/css/responsive.css">
    <link href="//unpkg.com/layui@2.8.15/dist/css/layui.css" rel="stylesheet">

</head>

<body>
<!-- 主要的網頁內容 js html-->
<!--
=============================
MENU DETAILS START
==============================
-->
<section class="tf__menu_details mt_100 xs_mt_75 mb_95 xs_mb_65">
    <div class="container">
        <div class="row">

            <div class="col-12 wow fadeInUp" data-wow-duration="1s">
                <div class="tf__menu_description_area mt_100 xs_mt_70">
                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-home-tab"
                                    data-bs-toggle="pill" data-bs-target="#pills-home"
                                    type="button" role="tab" aria-controls="pills-home"
                                    aria-selected="true">訂位須知
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pills-contact-tab"
                                    data-bs-toggle="pill" data-bs-target="#pills-contact"
                                    type="button" role="tab" aria-controls="pills-contact"
                                    aria-selected="false">評論區
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade" id="pills-home" role="tabpanel"
                             aria-labelledby="pills-home-tab" tabindex="0">
                            <div class="menu_det_description">
                                <p><span style="font-size: 18px; font-weight: bold; color: red;">訂位前請詳讀資訊以確保您的權益</span></p>
                                <ul>
                                    <li>● 因安全考量，無論是否有大人陪同，都無法接待12歲以下小朋友。
                                        (為避免小朋友年齡爭議，請攜帶可證明年齡之相關證件，供必要時核對)
                                    </li>
                                    <li>● 訂位『僅保留15分鐘』須全員到齊，逾時請現場候位。
                                        (晚上最後一場，逾時15分鐘就無法入場)
                                    </li>
                                    <li>● 甜點製作環境，寵物無法入店。</li>
                                    <li>● 店內嚴禁：外食、菸、酒、檳榔。</li>
                                    <li>● 每一場製作時間為3小時。(包含：製作、烘烤、清洗、裝飾、包裝)</li>
                                    <li>● 甜點製作為：平板教學+自助取材料。 (無老師教學、無販售成品、需自行清洗用具)</li>
                                    <li>● 費用依『甜點價格』收費。(無服務費)</li>
                                    <li>● 一份甜點價格限一人製作，其餘人數皆加收陪同費$100/人。</li>
                                </ul>
                                <p>【修改及取消訂位注意事項】</p>

                                <ul>
                                    <li>● 請在預約日三日前取消預約，否則不受理全額退費。 </li>
                                    <li>● 若須修改聯絡人、電話相關資訊請至"查詢我的訂單"內修改。</li>
                                    <li>● 代幣優惠折扣僅限商城使用，DIY體驗恕不折扣。</li>
                                    <li>● 營業時間: 9:00~12:00，14:00~16:00，18:00~21:00</li>

                                </ul>

                            </div>
                        </div>

                        <div class="tab-pane fade show active" id="pills-contact"
                             role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
                            <div class="tf__review_area">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <h4 id="count"></h4>
                                        <div class="sortOption">
                                            <div class="sortText">留言&nbsp;</div>
                                            <div id="sortByDateNew" onclick="toggleSort('date', 'new')"
                                                 class="sortText active">新&nbsp;|&nbsp;
                                            </div>
                                            <div id="sortByDateOld" onclick="toggleSort('date', 'old')"
                                                 class="sortText">舊
                                            </div>

                                            &nbsp;&nbsp;
                                            <div class="sortText">評分星星數&nbsp;</div>
                                            <div id="sortByRatingHigh" onclick="toggleSort('rating', 'high')"
                                                 class="sortText active">高&nbsp;|&nbsp;
                                            </div>
                                            <div id="sortByRatingLow" onclick="toggleSort('rating', 'low')"
                                                 class="sortText">低
                                            </div>
                                        </div>
                                        <div id="commentContainer" class="tf__comment pt-0 mt_20">
                                            <!-- 其他内容 -->
                                        </div>

                                    </div>
                                    <div class="col-lg-4">
                                        <div class="tf__post_review">
                                            <h4>新增評論</h4>
                                            <form id="myForm" onsubmit="submitForm(event)"
                                                  action="/diyla_front/diy/DiyForumController" method="GET">
                                                <p class="rating">
                                                    <span>選擇評分數 : </span> <i class="fas fa-star"></i> <i
                                                        class="fas fa-star"></i> <i class="fas fa-star"></i> <i
                                                        class="fas fa-star"></i> <i class="fas fa-star"></i>
                                                </p>
                                                <div class="row">
                                                    <%--<div class="col-xl-12">--%>
                                                    <%--    <input type="text" placeholder="Name">--%>
                                                    <%--</div>--%>
                                                    <%--<div class="col-xl-12">--%>
                                                    <%--    <input type="email" placeholder="Email">--%>
                                                    <%--</div>--%>
                                                    <input type="hidden" name="action" value="add">

                                                    <%--  TODO 整合項目後可以使用商品詳情頁面No --%>
                                                    <input type="hidden" name="diyNo" value="<%=diyCateEntity.getDiyNo()%>"> <input
                                                        type="hidden" name="diyGrade" value="0">

                                                    <div class="col-xl-12">
                                                        <textarea rows="5" placeholder="請輸入評論內容"
                                                                  name="artiCont"></textarea>
                                                    </div>
                                                    <div class="col-12">
                                                        <button class="common_btn" type="submit" >提交</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>


<!-- 捲動按鈕 -->

<div class="tf__scroll_btn">
    <i class="fas fa-hand-pointer"></i>
</div>


<!-- 引入必要的 JavaScript  -->
<!--jquery library js-->
<script src="/diyla_front/diy/js/jquery-3.6.0.min.js"></script>
<!--bootstrap js-->
<script src="/diyla_front/diy/js/bootstrap.bundle.min.js"></script>
<!--font-awesome js-->
<script src="/diyla_front/diy/js/Font-Awesome.js"></script>
<!-- slick slider -->
<script src="/diyla_front/diy/js/slick.min.js"></script>
<!-- isotop js -->
<script src="/diyla_front/diy/js/isotope.pkgd.min.js"></script>
<!-- counter up js -->
<script src="/diyla_front/diy/js/jquery.waypoints.min.js"></script>
<script src="/diyla_front/diy/js/jquery.countup.min.js"></script>
<!-- nice select js -->
<script src="/diyla_front/diy/js/jquery.nice-select.min.js"></script>
<!-- venobox js -->
<script src="/diyla_front/diy/js/venobox.min.js"></script>
<!-- sticky sidebar js -->
<script src="/diyla_front/diy/js/sticky_sidebar.js"></script>
<!-- wow js -->
<script src="/diyla_front/diy/js/wow.min.js"></script>
<!-- ex zoom js -->
<script src="/diyla_front/diy/js/jquery.exzoom.js"></script>

<!--main/custom js-->
<script src="/diyla_front/diy/js/main.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.7/dist/sweetalert2.min.js"></script>
<!-- 自訂的 JavaScript 腳本 -->

<script>

    // 自訂的 JavaScript 腳本，處理評論和表單相關的操作
    let starIndex = 0;
    let sortParam = "cSort=DESC";

    function getList(s) {
        // 使用 AJAX 請求從伺服器端獲取 JSON 數據
        var xhr = new XMLHttpRequest();
        var url = '/diyla_front/diy/diy-forum/list'; // Servlet URL
        // 後期需要傳入當前 diyNo，目前預設值為4
        var params = '&diyNo=<%=diyCateEntity.getDiyNo()%>'; // 請求參數，以鍵值對形式拼接

        if (s == null || s == "") {
            params += "&page=1&cSort=DESC";
        } else {
            params += s;
        }

        xhr.open('GET', url + '?' + params, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var jsonData = JSON.parse(xhr.responseText);
                renderComments(jsonData);
            }
        };
        xhr.send();
    }

    getList(null);

    // 渲染評論列表
    function renderComments(data) {
        var commentContainer = document.getElementById('commentContainer');
        if (data.length === 0) {
            commentContainer.innerHTML = '<p>評論列表為空。</p>';
        } else {
            var html = '';
            for (var i = 0; i < data.content.length; i++) {
                var item = data.content[i];
                html += '<div class="tf__single_comment">';

//根據item.memberEntity.memGender的值來判斷評論作者的性別,0是男,1是女
                if (item.memberEntity.memGender == 0) {
                    html += '<img src="/diyla_front//images/Male.png" alt="review" class="img-fluid">';
                } else if (item.memberEntity.memGender == 1) {

                    html += '<img src="/diyla_front//images/Female.png" alt="review" class="img-fluid">';
                } else {
                    html += '<img src="/diy/picture/client_1.png" alt="review" class="img-fluid">';

                }
                html += '<div class="tf__single_comm_text">';

                //插入評論作者的名字
                html += '<h3>' + item.memberEntity.memName + '</h3>';
                //插入評論的創建時間，並設置文字顏色為橘色。
                html += '<h6 style="color: #ff7c08">' + item.createTime + '</h6>';
                //根據item.diyGrade的值，使用迴圈生成相應數量的星星圖示，表示評分。
                html += '<span class="rating">';
                for (var j = 0; j < item.diyGrade; j++) {
                    html += '<i class="fas fa-star"></i>';
                }
                html += '</span>';
                //插入評論的內容。
                html += '<p>' + item.artiCont + '</p>';


                //先註釋掉，然後在登入後取消註釋，這樣就可以使用了
                // <%--var memId = '<%=memberEntity.getMemId() %>';--%>
                // <%--                if (memId == item.memberEntity.memId --%>
                // <%--                預設值4--%>


                let memId = <%=memId%>

                if (memId !=null) {
                    if (item.memberEntity.memId == memId) {
                        // html += '<div>';

                        html += '<button type="button" class="layui-btn layui-btn-sm layui-btn-normal" style="float: right;" onclick=\"deleteById(' + item.artiNo + ')\"><i class="layui-icon layui-icon-delete"></i> 删除</button>'

                        // html += '</div>';
                    }
                }


                html += '</div>';


                html += '</div>';

            }
            document.getElementById("count").innerText = data.totalElements + " 評論";
            // commentContainer.innerHTML = html;

            // 添加分頁
            // var paginationContainer = document.querySelector(".tf__pagination");
            var currentPage = data.number + 1;   // 當前頁數
            var totalPages = data.totalPages;    // 總頁數

            //&page=1&commentSort=DESC
            var preParams = "";
            if (currentPage != 1) {
                preParams = "&page=" + (currentPage - 1) + "&cSort=DESC";
            }

            var nextParams = "";
            if (currentPage != totalPages) {
                nextParams = "&page=" + (currentPage + 1) + "&cSort=DESC";
            }

            var paginationHtml = '';
            paginationHtml += '<div class="tf__pagination mt_30">';
            paginationHtml += '<div class="row">';
            paginationHtml += '<div class="col-12">';
            paginationHtml += '<nav aria-label="...">';
            paginationHtml += '<ul class="pagination">';
            paginationHtml += '<li class="page-item">';
            paginationHtml += '<a class="page-link" onclick="getList(\'' + preParams + '\')"><i class="fas fa-long-arrow-alt-left" style="margin-top: 16px"></i></a>';
            paginationHtml += '</li>';
            for (var page = 1; page <= totalPages; page++) {
                if (page === currentPage) {
                    paginationHtml += '<li class="page-item active"><a class="page-link" href="#">' + page + '</a></li>';
                } else {
                    var params = "&page=" + page + "&cSort=DESC";
                    paginationHtml += '<li class="page-item"><a class="page-link" onclick="getList(\'' + params + '\')">' + page + '</a></li>';
                }
            }

            paginationHtml += '<li class="page-item">';
            paginationHtml += '<a class="page-link" onclick="getList(\'' + nextParams + '\')"><i class="fas fa-long-arrow-alt-right" style="margin-top: 16px"></i></a>';
            paginationHtml += '</li>';
            paginationHtml += '</ul>';
            paginationHtml += '</nav>';
            paginationHtml += '</div>';
            paginationHtml += '</div>';
            paginationHtml += '</div>';
            paginationHtml += '</div>';

            commentContainer.innerHTML = html + paginationHtml;
        }
    }

    // 獲取所有星星
    var stars = document.querySelectorAll('.rating i');
    // 遍歷每個星星元素，為其添加點擊事件監聽器
    stars.forEach(function (star, index) {
        star.addEventListener('click', function () {
            // 將選中星星及其之前的星星都恆亮顯示
            for (var i = 0; i <= index; i++) {
                stars[i].classList.add('selected');
            }

            // 其他未點擊的星星元素恢復原來的顏色
            for (var i = index + 1; i < stars.length; i++) {
                stars[i].classList.remove('selected');
            }

            // 更新 starIndex
            starIndex = index + 1;
        });
    });
    function deleteById(id) {
        // 建立 XMLHttpRequest 物件
        var xhr = new XMLHttpRequest();

        // 設定請求方法和 URL
        var url = "/diyla_front/diy/diy-forum/delete/" + id;
        xhr.open("DELETE", url, true);

        // 設定請求完成後的回調函式
        xhr.onload = function () {
            if (xhr.status === 200) {
                // 請求成功，在這裡處理成功的邏輯
                console.log("刪除成功");
                getList(null);
            } else {
                // 請求失敗，在這裡處理失敗的邏輯
                console.log("刪除失敗");
            }
        };

        // 設定請求失敗時的回調函式
        xhr.onerror = function () {
            // 在這裡處理請求異常的邏輯
            console.log("請求異常");
        };

        // 發送請求
        xhr.send();
    }


    function submitForm(event) {
        // 阻止預設提交表單行為
        event.preventDefault();
        let memId = <%=memId%>;

        if (memId == null) {
            //使用sweetAlert2彈窗
            Swal.fire({
                icon: 'error',
                title:'請登入後再評論!',
            });

            return;
        }



        // 獲取表單數據
        var formData = new FormData(event.target);
        var diyNo = formData.get("diyNo");
        var diyGrade = starIndex;
        var artiCont = formData.get("artiCont");
        //TODO

        var memberId = <%=memId%>;

        var xhr = new XMLHttpRequest();
        var url = '/diyla_front/diy/diy-forum/add';
        var params = 'diyNo=' + diyNo + "&diyGrade=" + diyGrade + "&artiCont=" + artiCont + "&memId=" + memberId; // 請求參數，以鍵值對形式拼接
        xhr.open('GET', url + '?' + params, true);
        xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 請求成功後處理邏輯
                var r = JSON.parse(xhr.responseText);
                console.log(r);
                getList(null);
                // 清空評論框的內容
                document.querySelector('textarea[name="artiCont"]').value = ""; // 這裡清空評論框的內容
            }
            if (xhr.readyState === 4 && xhr.status === 405) {
                Swal.fire({
                    icon: 'info',
                    title: '注意',
                    html: '您沒有上過此DIY品項課程，因此無法留下評論！<br>誠摯歡迎您參加DIY體驗哦',
                });
            }


        };
        xhr.send();
    }


    let sortBy = 'date'; // 預設按照留言新舊排序
    let sortDirection = 'new';

    function toggleSort(sortType, direction) {
        sortBy = sortType;
        sortDirection = direction;

        // 修改文字顏色
        document.getElementById('sortByDateNew').style.color = direction === 'new' ? '#ff7c08' : 'initial';
        document.getElementById('sortByDateOld').style.color = direction === 'old' ? '#ff7c08' : 'initial';
        document.getElementById('sortByRatingHigh').style.color = direction === 'high' ? '#ff7c08' : 'initial';
        document.getElementById('sortByRatingLow').style.color = direction === 'low' ? '#ff7c08' : 'initial';

        // 執行相應的排序邏輯
        if (sortBy === 'date') {
            sortByDate();
        } else if (sortBy === 'rating') {
            sortByRating();
        }
    }

    function sortByDate() {
        // 執行按留言新舊排序的邏輯
        if (sortDirection === 'new') {
            sortParam = "&cSort=DESC"
            getList(sortParam);
        } else {
            sortParam = "&cSort=ASC"
            getList("&cSort=ASC");

        }
    }

    function sortByRating() {
        // 執行按評分星數排序的邏輯
        if (sortDirection === 'high') {
            sortParam = "&sSort=DESC"
            getList("&sSort=DESC");
        } else {
            sortParam = "&sSort=ASC"
            getList("&sSort=ASC");

        }
    }


</script>
<style>
    .rating i.selected {
        color: red !important;

    }


    .sortOption {
        display: flex;
    }

    .sortText {
        /*padding: 10px;*/
        cursor: pointer;
    }

    .sortText.active {
        /*background-color: lightblue;*/
    }

</style>

</body>

</html>
