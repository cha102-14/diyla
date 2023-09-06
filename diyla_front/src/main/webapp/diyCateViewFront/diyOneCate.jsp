<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
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
        DIY品項明細
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
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/shop/commodityPage.css">
    <script src="${ctxPath}/js/axios/axios.min.js"></script>
    <style>
    #gap{
    margin-top: 15px;
    
    }
    </style>
    
</head>
<body>
<jsp:include page="../front_header.jsp"/>

<div class="prod">
    <div class="img">
    	<img src="data:image/*;base64,${Base64.getEncoder().encodeToString(DiyCateEntity.diyPicture) }" alt="Image" class="commodityPhoto" style="width: 100%">
    </div>

    <div class="commodityPage">
        <label>DIY品項名稱：</label>
        <span>${DiyCateEntity.diyName}</span>
        <br>
        <label>DIY品項類別：</label>
        <span>
            	<c:choose>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 0}">
								<span>小點心</span>
						</c:when>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 1}">
								<span>蛋糕</span>
						</c:when>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 2}">
								<span>塔派</span>
						</c:when>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 3}">
								<span>生乳酪</span>
						</c:when>
				</c:choose>

        </span>
        <br>
        <label>DIY品項詳情：</label>
        <span>${DiyCateEntity.itemDetails}</span> <br>
        <br>
        <label>價格：</label><span id="price">${DiyCateEntity.amount}元</span>
        <br>
        <!--         <form action="ShoppingCartServlet" method="post" enctype="application/x-www-form-urlencoded" id="addCart"> -->
        <input type="hidden" name="memId" value="${memId}">
        <input type="hidden" name="action" value="addItem">
        <!--         </form> -->
        <br>
        <button type="button" class="button" id="addItem">開始訂位</button>
        <br>
        <div id="gap">
        <button type="submit" class="button" onclick="window.location.href='${ctxPath}/diyCate/diyCateList'">回到商品瀏覽</button>
        <button type="submit" class="button" onclick="window.location.href='${ctxPath}/diyOrder/diyOrder_front.jsp'">回到訂單管理首頁</button>
		</div>
    </div>

    <!-- 商品評論 -->
    <div class="review-container">
        <div class="average-rating">
            <div id="averageRating">
            </div>
        </div>
        <div class="filter-options">

        </div>
        <div class="commentArea" id="commentArea">
        </div>
    </div>
</div>


<jsp:include page="../front_footer.jsp"/>


<script src="${ctxPath}/js/jquery-3.4.1.min.js"></script>
<script src="${ctxPath}/js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="${ctxPath}/js/custom.js"></script>

<script>
    let commodityComments;
    let sum=0;
    let average=0;
    $(document).ready(function() {
        axios.get("${ctxPath}/shop/commodityComment/get/${commodity.comNO}").then((res)=>{
            commodityComments=res.data
            for (i = 0; i < commodityComments.length; i++) {
                sum += commodityComments[i].rating;

                $('#commentArea').append(

                  `  <div className="comment" style="border-top: 1px solid #ccc;margin-top: 20px; padding-top: 20px;">
                        <div className="member-info" style="font-weight: bold;margin-bottom: 5px;color: #B26021;">
                            會員名稱：` + commodityComments[i].memName + `
                            <span className="rating" style="color: gold; font-size: 1.2em;margin-left: 5px;">` + commodityComments[i].star + `</span>
                        </div>
                        <div className="date" style="color: #888;font-size: 0.8em;">` + commodityComments[i].commentTime + `</div>
                        <div className="comment-content" style="margin-top: 10px;color: #333;">
                            ` + commodityComments[i].comContent + `
                        </div>
                    </div>`
                )
            }

            average = (sum / commodityComments.length).toFixed(1);
            $('#averageRating').html("平均評分" + average);
    })
    });
    function sortComment(sort) {
        axios.get("${ctxPath}/shop/commodityComment/get/${commodity.comNO}?sort="+sort).then((res) => {
            $('#commentArea').empty();
            commodityComments = res.data
            for (i = 0; i < commodityComments.length; i++) {

                $('#commentArea').append(
                    `  <div className="comment"  id="comment`+commodityComments[i].comCommentNo+`" style="border-top: 1px solid #ccc;margin-top: 20px; padding-top: 20px;">
                        <div className="member-info" style="font-weight: bold;margin-bottom: 5px;color: #B26021;">
                            會員名稱：` + commodityComments[i].memName + `
                            <span className="rating" style="color: gold; font-size: 1.2em;margin-left: 5px;">` + commodityComments[i].star + `</span>
                        </div>
                        <div className="date" style="color: #888;font-size: 0.8em;">` + commodityComments[i].commentTime + `</div>
                        <div className="comment-content" style="margin-top: 10px;color: #333;">
                            ` + commodityComments[i].comContent + `
                        </div>
                    </div>`
                )
            }

            average = (sum / commodityComments.length).toFixed(1);
            $('#averageRating').html("平均評分" + average);

        })

    }

</script>


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
    $("#addItem").click(function (e) {
        const button = $(this);
        console.log("click");
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
        } else {
            const amount = $('.iamount').val();
            const comNo = $('.icomNo').val();
            console.log(amount);
            console.log(comNo);
            addCartItem(memId, comNo, amount)
        }
    });

    function addCartItem(memId, comNo, amount) {

        fetch("http://localhost:8081/diyla_front/shop/insert", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
               memId:memId,
               comNo:comNo,
               comAmount:amount
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                swal("成功新增", "", "success");
                // 延遲 1 秒後刷新
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            } else {
                // 處理刪除失敗的情況
            }
        })
        .catch(error => {
            // 處理錯誤情況
        });
    }

</script>
</body>
</html>
