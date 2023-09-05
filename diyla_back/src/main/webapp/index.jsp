<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>DIYLA</title>
</head>
<body>
    <div class="wrapper">
        <aside id="aside">
            <h1 class="logo"><a href="http://localhost:8081/diyla_back/"><img src="${ctxPath}/img/DIYLA_LOGO.png" alt="DIYLA!" class="logo-image"></a></h1>
            <ul>
            <c:choose>
			<c:when test="${empty typeFun}">
			
			</c:when>
			<c:otherwise>
					<c:forEach var="typeFun" items="${typeFun}">
				<c:if test="${typeFun eq 'BACKSTAGEADMIN'}">
                <li class="func">
                    <a href="#" class="func_link">
                        <svg fill="#b45f06" version="1.1" id="Capa_1" width="20" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 124 124" xml:space="preserve" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <circle cx="62" cy="66.7" r="12"></circle> <path d="M110,117V34c0-5.5-2.6-10.8-6.6-14.8L89.6,5.9C85.7,1.9,80.2,0,74.6,0H21c-3.8,0-7,3.1-7,7v110c0,3.8,3.2,7,7,7h29.6h22.7 H103C106.8,124,110,120.8,110,117z M99,100.7c0,2.6-1.9,4.3-4.5,4.3h-11C83.1,93.4,73.6,84.2,62,84.2c-11.6,0-21.1,9.2-21.5,20.8 h-11c-2.6,0-4.5-1.7-4.5-4.3V43.9c0-2.6,1.9-4.9,4.5-4.9h65.1c2.601,0,4.5,2.4,4.5,4.9v56.8H99z"></path> </g> </g></svg>
                        後台帳號管理
                    </a>
                </li>
				</c:if>
<%--                 	</c:forEach> --%>
<%-- 					<c:forEach var="typeFun" items="${typeFun}"> --%>
				<c:if test="${typeFun eq 'MEMADMIN'}">
                <li class="func">
                    <a href="http://127.0.0.1:5500/sideBar/test.html" class="func_link">
                        <svg fill="#b45f06" version="1.1" id="Capa_2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 122.699 122.699" xml:space="preserve" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <circle cx="19.5" cy="12.2" r="12.1"></circle> <path d="M6,66.699h1.2v24c0,3.301,2.7,6,6,6h12.6c3.3,0,6-2.699,6-6V89.3c-1.1-2.101-1.8-4.5-1.8-7v-31.4c0-6.1,3.7-11.4,9-13.7 v-2.4c0-3.3-2.7-6-6-6H6c-3.3,0-6,2.7-6,6v25.9C0,64,2.6,66.699,6,66.699z"></path> <circle cx="103.3" cy="12.2" r="12.1"></circle> <path d="M83.699,34.7v2.4c5.301,2.3,9,7.6,9,13.7v31.3c0,2.5-0.6,4.9-1.799,7v1.4c0,3.3,2.699,6,6,6h12.6c3.3,0,6-2.7,6-6v-24 h1.199c3.301,0,6-2.7,6-6V34.7c0-3.3-2.699-6-6-6h-27C86.4,28.7,83.699,31.399,83.699,34.7z"></path> <path d="M39.1,50.899L39.1,50.899v9.8v21.6c0,3.3,2.7,6,6,6h2.3v28.3c0,3.3,2.7,6,6,6h16.1c3.3,0,6-2.7,6-6v-28.4h2.3 c3.3,0,6-2.699,6-6V60.7v-9.8l0,0c0-3.3-2.7-6-6-6H45.1C41.7,44.899,39.1,47.6,39.1,50.899z"></path> <circle cx="61.4" cy="26" r="13.9"></circle> </g> </g></svg>
                        會員管理
                    </a>
                </li>
				</c:if>
<%--                 	</c:forEach> --%>
<%-- 					<c:forEach var="typeFun" items="${typeFun}"> --%>
                <c:if test="${typeFun eq 'MASTER'}">
                <li class="func">
                    <a href="http://127.0.0.1:5500/sideBar/test.html" class="func_link">
                        <svg fill="#b45f06" version="1.1" id="Capa_3" width="20" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 125.344 125.345" xml:space="preserve" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M37.873,124.4l6-6.301c1.2-1.199,3.2-1.199,4.3,0l6,6.301c1.9,2,5.2,0.6,5.2-2.101V110.9h48.6c1.4,0,2.9-0.5,3.9-1.601 c1.6-1.8,1.7-4.399,0.399-6.3c-1.199-1.7-2-4-2.3-6s-0.2-4,0.4-6c0.7-2.2,2.8-4.301,2.8-6.6V6c0-3.3-2.7-6-6-6h-89 c-3.3,0-6,2.7-6,6v78.3V104.9c0,3.299,2.7,6,6,6h14.5V122.3C32.672,125,35.972,126.3,37.873,124.4z M32.072,13.1c0-1.7,1.3-3,3-3 h65c1.699,0,3,1.3,3,3v63.2c0,1.7-1.301,3-3,3h-65c-1.7,0-3-1.3-3-3V13.1z M25.172,100.9c-1.7,0-3-1.301-3-3V92.3c0-1.7,1.3-3,3-3 h75.2c-1.101,4.3-0.7,8.399,0.2,11.601h-41.2V94.6h-26.7v6.301H25.172z"></path> <path d="M42.873,29.6h6.3c1.7,0,3-1.3,3-3v-6.3c0-1.7-1.3-3-3-3h-6.3c-1.7,0-3,1.3-3,3v6.3C39.873,28.3,41.172,29.6,42.873,29.6z"></path> <path d="M42.873,51.3h6.3c1.7,0,3-1.3,3-3V42c0-1.7-1.3-3-3-3h-6.3c-1.7,0-3,1.3-3,3v6.3C39.873,49.9,41.172,51.3,42.873,51.3z"></path> <path d="M42.873,72.9h6.3c1.7,0,3-1.301,3-3V63.6c0-1.7-1.3-3-3-3h-6.3c-1.7,0-3,1.3-3,3V69.9C39.873,71.5,41.172,72.9,42.873,72.9 z"></path> </g> </g></svg>
                        甜點課程管理
                    </a>
                </li>
				</c:if>
<%--                 	</c:forEach> --%>
<%-- 					<c:forEach var="typeFun" items="${typeFun}"> --%>
                <c:if test="${typeFun eq 'CLASS'}">
                <li class="func">
                    <a href="http://127.0.0.1:5500/sideBar/test.html" class="func_link">
                        <svg fill="#b45f06" version="1.1" id="Capa_4" width="20" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 963.4 963.4" xml:space="preserve" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M114.3,59.2H69.7c-33.1,0-60,26.9-60,60V903.4c0,33.1,26.9,60,60,60h824c33.1,0,60-26.9,60-60V119.2c0-33.1-26.9-60-60-60 H568.9c0,0.3,0,0.5,0,0.8v420.3c0,25.6-10.2,49.2-28.8,66.5c-17,15.799-39.2,24.5-62.4,24.5c-12.4,0-24.4-2.5-35.7-7.301 c-11.899-5.1-22.399-12.6-31.2-22.301L341.601,466.1l-69.2,75.599C263.5,551.4,253,558.9,241.2,564 c-11.3,4.9-23.3,7.301-35.7,7.301c-23.2,0-45.4-8.701-62.4-24.5c-18.6-17.301-28.8-40.9-28.8-66.5V60 C114.3,59.7,114.3,59.4,114.3,59.2z"></path> <path d="M228.2,501.1l90.6-99.1c6.101-6.699,14.5-10.1,22.9-10.1s16.7,3.4,22.9,10.1l90.6,99.1c6.4,7,14.6,10.1,22.6,10.1 c15.9,0,31.301-12.299,31.301-31.099V60c0-0.3,0-0.5,0-0.8C508.7,26.4,482,0,449.101,0H234.3c-32.9,0-59.6,26.4-60,59.2 c0,0.3,0,0.5,0,0.8v420.3c0,18.799,15.3,31.1,31.3,31.1C213.6,511.301,221.7,508.199,228.2,501.1z"></path> </g> </g></svg>
                        DIY管理
                    </a>
                </li>
				</c:if>
<%--                 	</c:forEach> --%>
<%-- 					<c:forEach var="typeFun" items="${typeFun}"> --%>
                <c:if test="${typeFun eq 'SHOP'}">
                <li class="func">
                    <a href="${ctxPath}/shop/CommodityController?action=listAll" class="func_link">
                        <svg fill="#b45f06" version="1.1" id="Capa_5" width="20" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 963.139 963.139" xml:space="preserve" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M174.839,11.069c-33.1,0-60,26.9-60,60v118h534.1v-118c0-33.1-26.9-60-60-60H174.839z"></path> <path d="M781.74,662.869c0,0,30.699-340,40.898-453.1c1.4-15.5,14.4-27.3,29.9-27.3h62.4c26.301,0,48.199-21.9,48.199-48.2 s-21.898-48.2-48.199-48.2H787.639c-13.898,0-26.699,6.8-36.299,16.5c-10.801,11-15.201,22.7-17.1,37.6l-10.4,82.7 c-1.9,15-14.6,26.2-29.801,26.2h-45.1h-534.1h-57c-33.5,0-60,28.4-57.7,61.8l28,350c2.2,31.5,28.3,55.9,59.9,55.9h636 C754.34,716.67,779.639,693.17,781.74,662.869z"></path> <path d="M230.239,861.869c0-39.399-25.3-72.899-60.5-85.199c-9.3-3.2-19.3-5-29.7-5c-10.4,0-20.4,1.8-29.7,5 c-35.2,12.3-60.5,45.8-60.5,85.199c0,49.801,40.4,90.2,90.2,90.2C189.839,952.069,230.239,911.67,230.239,861.869z"></path> <path d="M760.139,861.869c0-39.399-25.299-72.899-60.5-85.199c-9.299-3.2-19.299-5-29.699-5s-20.4,1.8-29.699,5 c-35.201,12.3-60.5,45.8-60.5,85.199c0,49.801,40.398,90.2,90.199,90.2C719.84,952.069,760.139,911.67,760.139,861.869z"></path> </g> </g></svg>
                        商店管理
                    </a>
                </li>
				</c:if>
<%--                 	</c:forEach> --%>
<%-- 					<c:forEach var="typeFun" items="${typeFun}"> --%>
                <c:if test="${typeFun eq 'STORADMIN'}">
                <li class="func">
                    <a href="http://127.0.0.1:5500/sideBar/test.html" class="func_link">
                        <svg fill="#b45f06" version="1.1" id="Capa_6" width="20" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 973.199 973.199" xml:space="preserve" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M924,828.75V315.649c-3.6,0.3-7.199,0.5-10.801,0.5H60c-3.6,0-7.3-0.2-10.8-0.5V828.75c0,33.1,26.9,60,60,60H864 C897.1,888.75,924,861.949,924,828.75z M687,513.35c0,16.6-13.4,30-30,30H316.2c-16.6,0-30-13.4-30-30v-79.6 c0-16.601,13.4-30,30-30H656.9c16.6,0,30,13.399,30,30v79.6H687z"></path> <path d="M973.199,196.149v-51.7c0-33.1-26.898-60-60-60H60c-33.1,0-60,26.9-60,60v51.7c0,29.4,21.2,53.9,49.2,59 c3.5,0.6,7.1,1,10.8,1h853.1c3.701,0,7.301-0.4,10.801-1C952,250.049,973.199,225.549,973.199,196.149z"></path> </g> </g></svg>
                        倉儲管理
                    </a>
                </li>
				</c:if>
<%--                 	</c:forEach> --%>
<%-- 					<c:forEach var="typeFun" items="${typeFun}"> --%>
                <c:if test="${typeFun eq 'CUSTORSERVICE'}">
                <li class="func">
                    <a href="http://127.0.0.1:5500/sideBar/test.html" class="func_link">
                        <svg fill="#b45f06" version="1.1" id="Capa_7" width="20" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 973.1 973.1" xml:space="preserve" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M502.29,788.199h-47c-33.1,0-60,26.9-60,60v64.9c0,33.1,26.9,60,60,60h47c33.101,0,60-26.9,60-60v-64.9 C562.29,815,535.391,788.199,502.29,788.199z"></path> <path d="M170.89,285.8l86.7,10.8c27.5,3.4,53.6-12.4,63.5-38.3c12.5-32.7,29.9-58.5,52.2-77.3c31.601-26.6,70.9-40,117.9-40 c48.7,0,87.5,12.8,116.3,38.3c28.8,25.6,43.1,56.2,43.1,92.1c0,25.8-8.1,49.4-24.3,70.8c-10.5,13.6-42.8,42.2-96.7,85.9 c-54,43.7-89.899,83.099-107.899,118.099c-18.4,35.801-24.8,75.5-26.4,115.301c-1.399,34.1,25.8,62.5,60,62.5h49 c31.2,0,57-23.9,59.8-54.9c2-22.299,5.7-39.199,11.301-50.699c9.399-19.701,33.699-45.701,72.699-78.1 C723.59,477.8,772.79,428.4,795.891,392c23-36.3,34.6-74.8,34.6-115.5c0-73.5-31.3-138-94-193.4c-62.6-55.4-147-83.1-253-83.1 c-100.8,0-182.1,27.3-244.1,82c-52.8,46.6-84.9,101.8-96.2,165.5C139.69,266.1,152.39,283.5,170.89,285.8z"></path> </g> </g></svg>
                        網站資訊管理
                    </a>
                </li>
                <li class="func">
                    <a href="http://127.0.0.1:5500/sideBar/test.html" class="func_link">
                        <svg viewBox="0 0 512 512" id="Capa_8" width="20" height="20" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path fill="#b45f06" d="M165.262 25.154c-38.376 0-73.092 6.462-97.408 16.405-12.159 4.97-21.669 10.834-27.706 16.67-6.036 5.835-8.459 11.144-8.459 16.218 0 5.075 2.423 10.384 8.46 16.219 6.036 5.835 15.546 11.699 27.705 16.67 24.316 9.942 59.032 16.404 97.408 16.404.162 0 .32-.006.482-.006l-38.95 108.504 88.065-112.265c18.283-2.87 34.592-7.232 47.81-12.637 12.16-4.971 21.671-10.835 27.708-16.67 6.037-5.836 8.459-11.144 8.459-16.219 0-5.074-2.422-10.383-8.46-16.219-6.036-5.835-15.548-11.698-27.706-16.67-24.316-9.942-59.032-16.404-97.408-16.404zm183.797 94.815c-38.377 0-73.092 6.462-97.409 16.404-12.158 4.971-21.668 10.835-27.705 16.67-6.036 5.835-8.459 11.144-8.459 16.219 0 5.074 2.423 10.385 8.46 16.22 6.036 5.836 15.546 11.697 27.704 16.668 3.106 1.27 6.387 2.481 9.819 3.631l82.965 105.764-34.2-95.274c12.3 1.47 25.327 2.284 38.825 2.284 38.376 0 73.091-6.462 97.408-16.405 12.158-4.97 21.67-10.832 27.707-16.668 6.036-5.835 8.459-11.146 8.459-16.22 0-5.075-2.423-10.384-8.46-16.219-6.036-5.835-15.548-11.699-27.706-16.67-24.317-9.942-59.032-16.404-97.408-16.404zM96 249c-25.37 0-47 23.91-47 55s21.63 55 47 55 47-23.91 47-55-21.63-55-47-55zm320 0c-25.37 0-47 23.91-47 55s21.63 55 47 55 47-23.91 47-55-21.63-55-47-55zM58.166 363.348c-7.084 8.321-13.03 19.258-17.738 31.812-10.33 27.544-14.433 62.236-15.131 91.84h141.406c-.698-29.604-4.802-64.296-15.13-91.84-4.709-12.554-10.655-23.49-17.739-31.812C123.246 371.9 110.235 377 96 377c-14.235 0-27.246-5.1-37.834-13.652zm320 0c-7.084 8.321-13.03 19.258-17.738 31.812-10.33 27.544-14.433 62.236-15.131 91.84h141.406c-.698-29.604-4.802-64.296-15.13-91.84-4.709-12.554-10.655-23.49-17.739-31.812C443.246 371.9 430.235 377 416 377c-14.235 0-27.246-5.1-37.834-13.652z"></path></g></svg>
                        討論區管理
                    </a>
                </li>
				</c:if>
                	</c:forEach>
			</c:otherwise>
            </c:choose>
            </ul>
<!--             	判斷有無empId決定是登出/登入 -->
            <div>
            <c:choose>
            <c:when test="${not empty typeFun}">
                <a href="emp/logout?empId='${empId}'">
                    <svg fill="#b45f06" viewBox="0 0 32 32" version="1.1" id="logout" width="20" height="20" xmlns="http://www.w3.org/2000/svg" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M3.651 16.989h17.326c0.553 0 1-0.448 1-1s-0.447-1-1-1h-17.264l3.617-3.617c0.391-0.39 0.391-1.024 0-1.414s-1.024-0.39-1.414 0l-5.907 6.062 5.907 6.063c0.196 0.195 0.451 0.293 0.707 0.293s0.511-0.098 0.707-0.293c0.391-0.39 0.391-1.023 0-1.414zM29.989 0h-17c-1.105 0-2 0.895-2 2v9h2.013v-7.78c0-0.668 0.542-1.21 1.21-1.21h14.523c0.669 0 1.21 0.542 1.21 1.21l0.032 25.572c0 0.668-0.541 1.21-1.21 1.21h-14.553c-0.668 0-1.21-0.542-1.21-1.21v-7.824l-2.013 0.003v9.030c0 1.105 0.895 2 2 2h16.999c1.105 0 2.001-0.895 2.001-2v-28c-0-1.105-0.896-2-2-2z"></path> </g></svg>
                    登出
                </a>
            </c:when>
            <c:otherwise>
            	<a href="${ctxPath}/emp/empLogin.jsp">
                    <svg fill="#b45f06" viewBox="0 0 32 32" version="1.1" id="logout" width="20" height="20" xmlns="http://www.w3.org/2000/svg" stroke="#b45f06"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M3.651 16.989h17.326c0.553 0 1-0.448 1-1s-0.447-1-1-1h-17.264l3.617-3.617c0.391-0.39 0.391-1.024 0-1.414s-1.024-0.39-1.414 0l-5.907 6.062 5.907 6.063c0.196 0.195 0.451 0.293 0.707 0.293s0.511-0.098 0.707-0.293c0.391-0.39 0.391-1.023 0-1.414zM29.989 0h-17c-1.105 0-2 0.895-2 2v9h2.013v-7.78c0-0.668 0.542-1.21 1.21-1.21h14.523c0.669 0 1.21 0.542 1.21 1.21l0.032 25.572c0 0.668-0.541 1.21-1.21 1.21h-14.553c-0.668 0-1.21-0.542-1.21-1.21v-7.824l-2.013 0.003v9.030c0 1.105 0.895 2 2 2h16.999c1.105 0 2.001-0.895 2.001-2v-28c-0-1.105-0.896-2-2-2z"></path> </g></svg>
                    登入
                </a>
            </c:otherwise>
            </c:choose>
            </div>
        </aside>
    </div>
    
    <script src="./vendors/jquery/jquery-3.7.0.min.js"></script>    
    <script src="./js/back.js"></script>
    <script >
    
    </script>
    <jsp:include page="chatPage.jsp"/>
</body>
</html>