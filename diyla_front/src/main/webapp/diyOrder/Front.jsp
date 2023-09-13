<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.diyOrder.*"%>
<%@ page import="com.cha102.diyla.member.*"%>
<%@ page isELIgnored="false"%>

<%
// Integer memId = (Integer)session.getAttribute("memId");
// MemberService memSvc = new MemberService();
// MemVO memVO =  memSvc.selectMem(memId);
// pageContext.setAttribute("memVO", memVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DIY體驗</title>
<style>
    /* 添加样式以美化按钮 */
    .button-container {
        display: flex;
        opacity:0.3 ;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh; /* 拉伸页面高度 */
        background-image: url('https://static.vecteezy.com/system/resources/previews/000/112/607/original/free-cupcake-pattern-vector.png');
        background-size: cover;
        background-repeat: no-repeat;
    }

    .button {
        background-color: rgb(240, 170, 7);
        font-weight: bold;
        color: black; /* 白色文字颜色 */
        font-size: 30px; /* 增大字体大小 */
        padding: 20px 40px; /* 增大按钮内边距，上下间隔相等 */
        border: none; /* 去掉按钮边框 */
        cursor: pointer; /* 鼠标指针样式 */
        border-radius: 15px; /* 圆角边框 */
        margin: 0px 0 70px; /* 按钮之间的外边距 */
        background-size: cover;
        background-repeat: no-repeat;
        text-align: center;
    }

    /* 添加悬停样式 */
    .button:hover {
        background-color: rgba(0, 0, 0, 0.5); /* 悬停时的背景颜色 */
    }
</style>
</head>
<body>
<jsp:include page="/front_header.jsp"></jsp:include>
<!-- 创建三个按钮 -->
<div class="button-container">
    <button class="button" onclick="navigateToDIYList()" style="margin-top:-150px;background-image: url('https://pic.huitu.com/pic/20230723/1895743_20230723081515069200_0.jpg');">DIY品項總覽 / 新增訂位</button>
    <button class="button" onclick="navigateToOrderStatus()" style="background-image: url('sweet2.jpg');">訂單狀態</button>
    
    <form method="post" action="DiyOrderFrontController">
          <input type="hidden" name="memId" value="${memId}">
          <input type="hidden" name="action" value="getAllDeleteByMemId_front">
          <button class="button" type="submit" onclick="navigateToGmail()" style="background-image: url('sweet3.jpg');">未退款狀態查詢</button>
        </form>
    
</div>
<jsp:include page="/front_footer.jsp" />
<script>
    // JavaScript 函数，当按钮被点击时导航到 Google
    function navigateToDIYList() {
        window.location.href = '${ctxPath}/diyCate/diyCateList';
    }

    // JavaScript 函数，当按钮被点击时导航到 Yahoo奇摩
    function navigateToOrderStatus() {
        window.location.href = '${ctxPath}/diyOrder/diyOrder_front.jsp';
    }

    // JavaScript 函数，当按钮被点击时导航到 Gmail
    function navigateToGmail() {
        window.location.href = '${ctxPath}/diyOrder/AllDeleteById.jsp';
    }
</script>
</body>
</html>