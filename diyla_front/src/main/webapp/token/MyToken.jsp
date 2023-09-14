<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.articleModel.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.tokenModel.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    TokenService tokenSvc = new TokenService();
    Integer memId = (Integer)session.getAttribute("memId");
    List<TokenVO> list = tokenSvc.getAllTokenByMemId(memId);
    Integer total = tokenSvc.getTokenTotalByMemId(memId);
    pageContext.setAttribute("list", list);
    pageContext.setAttribute("total", total);
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>我的代幣紀錄</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>

    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-straight/css/uicons-thin-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <style>
        * {
            box-sizing: border-box;
            font-family: "jf open 粉圓 1.1";

        }

        body {
            margin: 0;
        }

        div.title {
            width: 800px;
            height: 700px;
            color: #B26021;
            position: relative;
            top: 50%;
            left: 50%;
            transform: translateX(-50%);
            letter-spacing: 3px;
            margin: 50px 0;
            display: flex;
        }

        aside {
            width: 200px;
            border: 1px solid #B26021;
            margin-right: 1.5rem;
            border-radius: 6px;
            background-color: snow;
        }

        h4.member {
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        div.member {
            border: 1px solid #B26021;
            flex: 1;
            padding: 10px 1.5rem 10px 1.5rem;
            font-size: 1rem;
            width: 400px;
            height: 700px;
            position: relative;
            border-radius: 6px;
            background-color: snow;
            overflow-y:auto;
        }

        aside>ul {
            margin-top: 2rem;
            padding-left: 0;
        }

        aside>ul>li {
            margin-bottom: 1rem;
            list-style: none;
            padding: 1rem;
            position: relative;
            width: 198px;
            display: block;
        }

        aside>ul>li:hover {

            background: #F1F1F1;
        }

        aside>ul>li>a {
            display: block;
            text-decoration: none;
            color: #B26021;
            width: 100%;
            height: 100%;
        }

        aside>ul>li>a:hover {
            text-decoration: none;
            color: #B26021;
        }

        i {
            padding-right: 0.4rem;
        }

        #a1::before {
            content: "";
            position: absolute;
            top: 7px;
            left: 0px;
            height: 40px;
            width: 4px;
            background-color: #B26021;
        }

        #a1 {
            font-weight: bold;
        }
        table{
            border-collapse:collapse;
            text-align:center;
            width:500px;
        }
        th{
            width:500px;
            text-align:center;
            padding:10px;
            background-color:#f3f3f3;
        }
         td{
             letter-spacing: 0.5px;
             background-color:#ffffff;
             width:380px;
             height:35px;
             text-align:center;
             padding:3px;
         }
        tr{
            border-bottom:1px solid #dddddd;
        }
        tr:nth-of-type(even) td{
            background-color:#f3f3f3;
        }
        input {
            border: 1px solid #B26021;
            border-radius: 3px;
            font-size: 1rem;
            color: #B26021;
            width:120px;
            height: 30px;
            letter-spacing: 1px;
            padding: 0 25px 0 8px;
            margin-top:5px;
        }
        input:focus {
              outline: 1.5px solid #B26021;
              box-shadow: 2px;
        }
        #token_length > label, #token_filter > label {
            display:inline-block;
            font-size:14px;
        }
        #token_wrapper > div {
            display:inline-block;
        }
        #token_filter,#token_paginate{
            position:absolute;
            right:40px;
        }
        #token_info,#token_paginate{
            margin-top:5px;
            font-size:14px;
        }
        #token_paginate >a,#token_paginate >span>a {
            color:#B26021;
            margin:2px;
        }
        #token_paginate >a:hover,#token_paginate >span>a:hover {
            color:#B26021;
            margin:2px;
            font-size:16px;
            text-decoration: underline;
        }
        label>select {
            display:inline-block;
            border: 1px solid #B26021;
            border-radius: 3px;
            font-size: 1rem;
            color: #B26021;
            height: 30px;
            letter-spacing: 1px;
            padding:3px;
            margin:5px;
        }
        select:focus{
            outline:1px solid #B26021;
        }
        .token{
            background-color:white;
            padding:15px;
            border-radius:4px;
            box-shadow:0 0 5px lightgray;
        }


    </style>


</head>
<body>
    <jsp:include page="../front_header.jsp"/>
        <div class="title">
                <aside>
                    <ul>
                        <li><a href="${ctxPath}/member/update?action=select&memId=${memId}"><i
                                    class="fi fi-ts-user-gear"></i>會員資訊管理</a></li>
                        <li><a href="${ctxPath}/member/updatePw.jsp"><i class="fi fi-tr-key-skeleton-left-right"></i>修改密碼</a></li>
                        <li><a href="${ctxPath}/allOrder/allOrder?memId=${memId}"><i class="fi fi-ts-ballot"></i>我的訂單</a></li>
                        <li><a href="${ctxPath}/track/track?memId=${memId}"><i class="fi fi-tr-hand-love"></i>我的商品追蹤</a></li>
                        <li><a id="a1" href="${ctxPath}/token/MyToken.jsp"><i class="fi fi-ts-piggy-bank"></i>我的代幣</a></li>
                        <li><a href="${ctxPath}/member/login?action=logout"><i class="fi fi-tr-hand-wave"></i>登出</a></li>
                    </ul>
                </aside>
                <div class="member">
                <h4 class="member">我的代幣</h4>
                 <br>
                 <div class="token">
                 <table id="token" class="display">
                     <thead>
                         <tr>
                             <th>代幣數量</th>
                             <th>取得與使用紀錄</th>
                             <th>時間</th>
                         </tr>
                     </thead>
                     <tbody>
                             <c:forEach var="list" items="${list}">
                                    <tr>
                                        <td>${list.tokenCount}</td>
                                        <c:choose>
                                            <c:when test="${list.tokenGetUse==0}">
                                            <td>討論區</td>
                                            </c:when>
                                            <c:when test="${list.tokenGetUse==1}">
                                            <td>商店</td>
                                            </c:when>
                                            <c:when test="${list.tokenGetUse==2}">
                                            <td>課程</td>
                                            </c:when>
                                            <c:otherwise>
                                            <td>過期</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td><fmt:formatDate value="${list.tokenTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    </tr>
                             </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <div class="total">
                        <i class="fi fi-ts-piggy-bank"></i>可使用代幣：${total}
                    </div>
                    </div>
                </div>
        </div>

    <jsp:include page="/front_footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#token").DataTable({
                "lengthMenu":[5,20],
                "pageLength":"5",
                "paging":true,
                "ordering":true,
                "language":{
                    "lengthMenu":"顯示_MENU_筆結果",
                    "zeroRecords":"尚無代幣紀錄",
                    "info":"顯示第_START_至_END_筆結果，共_TOTAL_筆",
                    "infoEmpty":"顯示第 0 筆 至 0 筆結果，共 0 筆",
                    "infoFiltered": "",
                    "search":"搜尋：",
                    "paginate":{
                        "first":"第一頁",
                        "previous":"上一頁",
                        "next":"下一頁",
                        "last":"最後一頁"
                    },
                    "aria":{
                        "sortAscending":"：升冪排列",
                        "sortDescending":"：降冪排列"
                    },

                }

            });
        });
    </script>
    </body>


    </html>