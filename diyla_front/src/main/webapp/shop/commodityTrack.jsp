<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/front_header.jsp" />

<c:choose>
    <c:when test="${not empty commodityList}">
        <h1>我的追蹤清單</h1>
        <c:forEach items="${commodityList}" var="commodity">
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="box">
                    <a href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${commodity.comNO}">
                        <div class="img-box">
                            <img src="${commodity.showPic}" alt="">
                        </div>
                        <div class="detail-box">
                            <h6>
                                    ${commodity.comName}
                            </h6>
                            <h6>
                    <span>
                        NT$${commodity.comPri}元
                  </span>
                            </h6>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <span>您目前還沒有追蹤的商品</span>
        <a href="${ctxPath}/shop/CommodityController?action=listAll"><button>前往商店</button></a>
    </c:otherwise>
</c:choose>

<jsp:include page="../front_footer.jsp"/>
</body>
</html>
