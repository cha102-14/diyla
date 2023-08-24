<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
        商店單品
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
    <link rel="stylesheet" type="text/css" href="../css/shop/commodityPage.css">
</head>
<body>
<jsp:include page="../front_header.jsp"/>

<div class="prod">
    <div class="img">
        <img src="${commodity.showPic}" class="commodityPhoto" style="width: 100%">
    </div>

    <div class="commodityPage">
        <label>商品名稱：</label>
        <span>${commodity.comName}</span>
        <br>
        <label>商品類別：</label>
        <span>${classNameMap[commodity.comClassNo]}</span>
        <br>
        <label>商品描述：</label>
        <span>${commodity.comDes}</span> <br>
        <br>
        <label>價格：</label><span id="price">${commodity.comPri}元</span>
        <br>
<!--         <form action="ShoppingCartServlet" method="post" enctype="application/x-www-form-urlencoded" id="addCart"> -->
        	<input type="hidden" name="memId" value="${memId}">
            <input type="hidden" name="action" value="addItem">
            <input type="text" value="${commodity.comNO}" hidden="hidden" name ="comNo" class="icomNo">
            <label style="font-size: 18px">請輸入購買數量：</label><span id="amount_value" style="font-size: 18px">1</span>
            <input name="amount" type="range" min="1" max="99" value="1" class="iamount" id="itemAmount">
<!--         </form> -->
		<br>
        <button type="button" class="button" form="addCart" id="addItem">加入購物車</button>
        <button type="submit" class="button">加入追蹤</button>

    </div>

    <!-- 商品評論 -->
    <div class="review-container">
        <div class="average-rating">
            <div class="star-rating">
                <span class="star-icon">★</span>
                <span class="star-icon">★</span>
                <span class="star-icon">★</span>
                <span class="star-icon">★</span>
                <span class="star-icon">★</span>
                <!-- 這裡可以根據平均評分設定星星數量 -->
            </div>
            <div>
                平均評分：4.5
            </div>
        </div>
        <div class="filter-options">
            <button>有評論</button>
            <button>有照片</button>
            <button>由最高到低</button>
            <button>由最低到高</button>
        </div>
        <div class="comment">
            <div class="member-info">
                會員名稱：John Doe
                <span class="rating">★★★★★</span>
            </div>
            <div class="date">2023-08-20</div>
            <div class="comment-content">
                商品品質很好，物超所值！
            </div>
        </div>
    </div>
</div>


<jsp:include page="../front_footer.jsp"/>


<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="../js/custom.js"></script>
<script>
	    $(document).ready(function () {
	        $('#itemAmount').mousemove(function () {
	            $('#amount_value').html($('#itemAmount').val());
	        });
	        $('#itemAmount').change(function () {
	            $('#amount_value').html($('#itemAmount').val());
	        });
	    });
</script>
<script>
$("#addItem").click(function(e){
	const button =$(this);
	let memId = <%=session.getAttribute("memId")%>;
	  if (memId == null) {
		  e.preventDefault();
	    Swal.fire({
	      icon: 'warning',
	      title: '請登入',
	      text: '您需要登入才能加入購物車。',
	      confirmButtonText: '前往登入',
	      allowOutsideClick: false  
	    }).then((result) => {
	      if (result.isConfirmed) {
	        window.location.href = '../member/mem_login.jsp';
	      }
	    });
	  }  else {
		  const amount = $('.iamount').val();
		  const comNo =$('.icomNo').val();
		  console.log(amount);
		  console.log(comNo);
		  addCartItem(memId,comNo,amount)
	  }
});

function addCartItem(memId,comNo,amount){
	 $.ajax({
           url: "ShoppingCartServlet",
           type: "POST",
           data: {
        	   amount:amount,
        	   comNo:comNo,
               memId: memId,
               action: "addItem"
           },
           dataType: "json",
           success: function(data) {
               if (data.success) {
               	 swal("成功新增", "", "success");
                    // 延遲 1 秒後刷新
                    setTimeout(function() {
                        window.location.reload();
                    }, 1500);
               } else {
                   // 處理刪除失敗的情況
               }
           },
           error: function() {
               // 處理AJAX錯誤的情況
           }
       });
   }

</script>
</body>
</html>
