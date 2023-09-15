<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<title>DIY管理後台首頁</title>

<style>
/* 重置默认样式 */
body, p, ul, li, form {
    margin: 0;
    padding: 0;
}


header { 
	
 	background-color: #f8a229; /* 背景顏色 */ 
 	color: white; /* 文字顏色 */ 
 	padding: 8px 0; /* 上下內邊距 10px，左右內邊距 0 */ 
 	text-align: center; /* 文字置中 */ 
 } 

/* 整个页面背景颜色和文本样式 */
body {
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
/*     border: 1px solid red; */
    height: 100%;
    text-align: center;
    line-height: 50px;
    margin-left: 480px;
}

/* 页面容器，水平居中 */
.flex-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 10vh;
}

/* 右侧内容容器 */
.center-div {
    background-color: #f0e49b; /* 添加白色背景 */
    padding: 20px;
    min-height: 600px;
    width: calc(100% - 300px);
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* 陰影*/
}

/* 标题样式 */
h1 {
    font-size: 24px;
    margin-bottom: 20px; /* 添加下边距 */
}

/* 输入框和按钮样式 */
form {
    margin-bottom: 20px; /* 添加下边距 */
}

label {
    font-weight: bold;
}

input[type="text"] {
    padding: 5px;
    width: 150px;
}

input[type="submit"], .button {
	font-weight: bold;
    background-color: #eca56c;
    font-size:16px;
    color: black;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin-left: 10px;
}

input[type="submit"]:hover, .button:hover {
    background-color: #f17814;

}

/* 错误信息样式 */
.error-message {
    color: red;
    font-weight: bold;
}

/* 返回DIY首頁按钮样式 */
.pennyrequest1 {
    margin-top: 20px;
    text-align: center;
}

.pennyrequest1 a {
    font-size: 1.3rem;
    text-decoration: none;
    color: #333;
}

.pennyrequest1 a:hover {
    text-decoration: underline;
    color: red;
    font-weight: bold;
}
</style>

</head>
<body>
<div class="flex-container">
    
</div>
<div class="center-div">
    <h1 style="font-weight: bold;">DIY管理後台首頁</h1>
    <input type="hidden" class="uuu" value="${uuu}">
    <ul>
    <button type="submit" class="button" style="margin:0px 0px 20px 7px;" onclick="window.location.href='${ctxPath}/diycate/back_diycate.jsp'">DIY項目管理</button>
    
        <form method="post" action="DiyOrderController">
            <input type="hidden" name="action" value="getAllOrder">
            <input type="submit" value="查詢所有訂單"> 
        </form>
        <li>
            <form method="post" action="DiyOrderController">
                <b style="font-weight: bold; margin-left: -45px;">輸入訂單編號:</b>
                <c:choose>
                    <c:when test="${uuu == 404}">
                        <input type="text" name="diyOrderNo" value="${diyorderNo} ">
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="diyOrderNo">
                    </c:otherwise>
                </c:choose>
                <input type="hidden" name="action" value="getOne_For_Display">
                <input type="submit" value="查詢單筆訂單資料" style="margin-left:10px;">
                <p class="error-message">${errorMsgs.diyOrderNo}${errorMsgs.diyOrderVO}</p>
            </form>
        </li>
        <li>
            <form method="post" action="DiyOrderController">
                <b style="font-weight: bold;">輸入會員編號:</b>
                <c:choose>
                    <c:when test="${uuu == 405}">
                        <input type="text" name="memId" value="">
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="memId">
                    </c:otherwise>
                </c:choose>
                <input type="hidden" name="action" value="getOneMemId_For_Display">
                <input type="submit" value="查詢會員所有訂單資料">
                <p class="error-message">${errorMsgs.memId}${errorMsgs.diyOrderList}</p>
            </form>
        </li>
        <button type="button" class="button" onclick="window.location.href='getodByPeriod_front.jsp'"  style="margin-top: 50px;">時段參加會員及訂單(點名系統)</button>
        <form method="post" action="DiyOrderController" style="margin-top:25px;" >
            <input type="hidden" name="action" value="getAllRefund">
            <input type="submit" value="查詢未退款完成訂單"> 
            <p class="error-message">${errorMsgs.refundNot}</p>
        </form>
        <button type="submit" class="button" onclick="window.location.href='${ctxPath}/diyReserveResult/total.jsp'">訂單彙總日程明細</button>
        
        
    </ul>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
window.onload = function() {
    const uuu = document.querySelector('.uuu');
    if (uuu.value === '40') {
        swal('請更正以下資訊', '${errorMsgs.diyOrderVO1}', 'error');
    }
}
</script>
</body>
</html>
