<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.commodityOrder.*"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%
    CommodityOrderService comSvc = new CommodityOrderService();
    Integer memId = (Integer)session.getAttribute("memId");
    List<CommodityOrderVO> comList = comSvc.getAllByMemId(memId);
    pageContext.setAttribute("comList", comList);

    ClassOrderService classSvc = new ClassOrderService();
    List<ClassOrderDTO> classList = classSvc.getAllByMemId(memId);
    pageContext.setAttribute("classList",classList);
%>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
    <title>我的訂單</title>
    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet" />

    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet" />
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
        .allorder>a{
            display: block;
            color: #B26021;
        }

        aside>ul>li>a:hover {
            text-decoration: none;
            color: #B26021;
        }
        .allorder>a:hover{
            color: #B26021;
        }
        .order:hover{
            border:0;
            background-color:white;
            box-shadow:0 0 10px lightgray;
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

        div.order{
            border: 1px solid #B26021;
            border-radius:4px;
            padding:1rem;
            margin-bottom:10px;
        }
        div.order>div{
            display:inline-block;
            vertical-align: middle;
        }
        .status{
            position:absolute;
            right:40px;
            width:100px;
            height:70px;
            font-weight:bold;
            background-color:#FCE5CD80;
            text-align:center;
            border-radius:4px;
            line-height:70px;
        }
        .allOrder>h5{
            margin-bottom:10px;
            margin-top:20px;
        }
        button.data-button{
            border-radius: 0.5rem;
            background-color: #B26021;
            color: #FCE5CD;
            border: 1px #B26021;
            letter-spacing: 3px;
            padding:3px 8px;
        }
        button.data-button:hover{
            background-color: #FCE5CD;
            color:  #B26021;
            transition: all 0.3s;
        }
         button.data-button:focus{
             outline: none;
         }
         .button{
         margin-bottom:10px;
         }
    </style>
</head>

<body>
    <jsp:include page="../front_header.jsp" />
    <div class="title">
        <aside>
            <ul>
                <li><a href="${ctxPath}/member/update?action=select&memId=${memId}"><i
                            class="fi fi-ts-user-gear"></i>會員資訊管理</a></li>
                <li><a href="${ctxPath}/member/updatePw.jsp"><i class="fi fi-tr-key-skeleton-left-right"></i>修改密碼</a>
                </li>
                <li><a id="a1" href="${ctxPath}/allOrder/allOrder?memId=${memId}"><i
                            class="fi fi-ts-ballot"></i>我的訂單</a></li>
                <li><a href="${ctxPath}/track/track?memId=${memId}"><i class="fi fi-tr-hand-love"></i>我的商品追蹤</a></li>
                <li><a href="${ctxPath}/token/MyToken.jsp"><i class="fi fi-ts-piggy-bank"></i>我的代幣</a></li>
                <li><a href="${ctxPath}/member/login?action=logout"><i class="fi fi-tr-hand-wave"></i>登出</a></li>
            </ul>
        </aside>
        <div class="member">
            <h4 class="member">我的訂單</h4>
            <div class="button">
                <button class="data-button" value="3">全部</button>
                <button class="data-button" value="0">商店</button>
                <button class="data-button" value="1">DIY</button>
                <button class="data-button" value="2">課程</button>
            </div>
            <div class="allorder">
                <h5>商店</h5>
                <c:choose>
                    <c:when test="${not empty comList}">
                        <c:forEach var="comList" items="${comList}">
                            <a href="${ctxPath}/memberOrder/OrderController?action=listOrder&memId=${memId}">
                                <div class="order">
                                    <div>
                                        <i class="fi fi-tr-tags"></i>訂單編號#${comList.orderNO}<br>
                                        <i class="fi fi-ts-calendar-days"></i>
                                        <fmt:formatDate value="${comList.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <br>
                                        <i class="fi fi-tr-usd-circle"></i>${comList.actualPrice}元<br>
                                    </div>
                                    <div class="status">
                                        <c:choose>
                                            <c:when test="${comList.orderStatus==0}">
                                                訂單成立
                                            </c:when>
                                            <c:when test="${comList.orderStatus==1}">
                                                已付款
                                            </c:when>
                                            <c:when test="${comList.orderStatus==2}">
                                                備貨中
                                            </c:when>
                                            <c:when test="${comList.orderStatus==3}">
                                                已出貨
                                            </c:when>
                                            <c:when test="${comList.orderStatus==4}">
                                                已完成
                                            </c:when>
                                            <c:otherwise>
                                                已取消
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctxPath}/memberOrder/OrderController?action=listOrder&memId=${memId}">
                            <span>您目前還沒有商店訂單</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="allorder">
                <h5>DIY</h5>
                <a href="${ctxPath}/diyOrder/diyOrder_front.jsp">
                    <c:choose>
                        <c:when test="${not empty diyList}">
                            <c:forEach var="diyList" items="${diyList}">
                                <div class="order">
                                    <div>
                                        <i class="fi fi-tr-tags"></i>DIY品項#${diyList.diyCateName}<br>
                                        <i class="fi fi-ts-calendar-days"></i>${diyList.diyReserveDate}<br>
                                        <i class="fi fi-tr-usd-circle"></i>${diyList.diyPrice}元<br>
                                    </div>
                                    <div class="status">
                                        <c:choose>
                                            <c:when test="${diyList.reservationStatus==0}">
                                                訂位完成
                                            </c:when>
                                            <c:when test="${diyList.reservationStatus==1}">
                                                訂位已取消，尚未退款完成
                                            </c:when>
                                            <c:when test="${diyList.reservationStatus==2}">
                                                退款完成
                                            </c:when>
                                            <c:otherwise>
                                                當日未到
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <span>您目前還沒有DIY訂位訂單</span>
                        </c:otherwise>
                    </c:choose>
                </a>
            </div>
            <div class="allorder">
                <h5>課程</h5>
                <a href="${ctxPath}/desertcourse/memclassreserve.jsp">
                    <div class="order">
                        <c:choose>
                            <c:when test="${not empty classList}">
                                <c:forEach var="classList" items="${classList}">
                                    <div>
                                        <i class="fi fi-tr-tags"></i>${classList.className}<br>
                                        <i class="fi fi-ts-calendar-days"></i>${classList.classDate}<br>
                                        <i class="fi fi-tr-usd-circle"></i>${classList.totalPrice}元<br>
                                    </div>
                                    <div class="status">
                                        <c:choose>
                                            <c:when test="${classList.status==0}">
                                                預約單成立
                                            </c:when>
                                            <c:when test="${classList.status==1}">
                                                預約單取消
                                            </c:when>
                                            <c:otherwise>
                                                預約單完成
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <span>您目前還沒有課程訂單</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <script>
    let buttons = document.getElementsByClassName("data-button");

    let allOrder = document.getElementsByClassName("allorder");

    for(let button of buttons){
        button.addEventListener("click",function(){
        console.log(button.value);
        for(let i=0;i<allOrder.length;i++){
            let butCount = parseInt(button.value);
            if(butCount === 3){
                allOrder[i].style.display="block";
            } else if(i === butCount){
                allOrder[i].style.display="block";
            } else{
                allOrder[i].style.display="none";
            }
        }
        })
    }







    </script>
    <jsp:include page="/front_footer.jsp" />
</body>


</html>