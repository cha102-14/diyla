<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <!-- Basic -->
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png" type="image/x-icon">

    <title>
        DIYLA
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
</head>

<body>
<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="${ctxPath}/index.jsp">
                <img src="${ctxPath}/images/DIYLA_LOGO.png" alt="DIYLA!" class="logo-image">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  ">
                    <li class="nav-item ">
                        <a class="nav-link" href="${ctxPath}/aboutus/aboutus.jsp">關於我們
                            <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            DIY體驗
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            甜點課程
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctxPath}/shop/CommodityController?action=listAll">
                            商店
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}/art/art.jsp">
                            社群分享
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}/pbm/pbm.jsp">
                            常見問題
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}//memberOrder/OrderController?action=listOrder&memId=${memId}" id="myOrder">
                            我的訂單
                        </a>
                    </li>
                </ul>
                <div class="user_option">
                    <c:choose>
                        <c:when test="${empty memVO}">
                            <a href="${ctxPath}/member/mem_login.jsp">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>登入</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctxPath}/member/會員專區">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>${memVO.memName}你好</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <%--可自行更改href連結--%>
                    <form class="form-inline ">
                    </form>
                    <a href="${ctxPath}/shop/ShoppingCartServlet?action=getAll&memId=${memId}" id="shoppingcart">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
        </nav>
    </header>

    <!-- end header section -->
</div>
<script src="${ctxPath}/js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="${ctxPath}/js/custom.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.all.min.js"></script>
	<script>
$("#shoppingcart").click(function(e){
	let memVO = <%=session.getAttribute("memVO")%>;
	  if (memVO == null) {
		  e.preventDefault();
	    Swal.fire({
	      icon: 'warning',
	      title: '請登入',
	      text: '您需要登入才能使用購物車。',
	      confirmButtonText: '前往登入',
	      allowOutsideClick: false  
	    }).then((result) => {
	      if (result.isConfirmed) {
	        window.location.href = './member/mem_login.jsp';
	      }
	    });
	  } 
});
$("#myOrder").click(function(e){
	let memVO = <%=session.getAttribute("memVO")%>;
	  if (memVO == null) {
		  e.preventDefault();
	    Swal.fire({
	      icon: 'warning',
	      title: '請登入',
	      text: '您需要登入才能查看訂單。',
	      confirmButtonText: '前往登入',
	      allowOutsideClick: false  
	    }).then((result) => {
	      if (result.isConfirmed) {
	        window.location.href = './member/mem_login.jsp';
	      }
	    });
	  } 
});
  
</script>
</body>

</html>
