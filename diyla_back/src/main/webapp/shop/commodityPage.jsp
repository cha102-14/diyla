<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>商品詳情</title>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/listCommodity.css">
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/commodityPage.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <link rel="stylesheet" href="${ctxPath}/css/style.css">
</head>

<body style="margin-left: 280px">

<aside class="topPage">
    <jsp:include page="../index.jsp"/>
</aside>
<div class="container">
    <div class="header" style="margin-bottom: 20px;">商品詳情</div>
    <div class="prod">
        <div class="img">
            <img src="${commodity.showPic}" class="commodityPhoto" style="width: 100%">
        </div>

        <div class="commodityPage">
				<span class="commodityDescription">
					<label>商品名稱：</label>
					<span>${commodity.comName}</span>
					<br>
					<label>商品類別：</label>
					<span>${classNameMap[commodity.comClassNo]}</span>
					<br>
					<label>商品描述：</label>
					<span>${commodity.comDes}</span> <br>
					<br>
					<label>價格：</label><span id="price">${commodity.comPri}</span>
					<br>
					<label>商品狀態：</label><span>${commodityState[commodity.comState]}</span>
					<br>
					<label>更新時間：</label>
					<fmt:formatDate value="${commodity.updateTime}"
                                    pattern="yyyy-MM-dd HH:mm:ss"/> <br>
					<form method="post" action="${ctxPath}/shop/CommodityController"
                          id="form1">
						<input type="text" name="action" value="toUpdate" hidden>
						<input type="text" value="${commodity.comNO}" name="comNO" hidden>
					</form>
					<button type="submit" class="button" form="form1">修改資料</button>
					<a href="${ctxPath}/shop/CommodityController?action=listAll"><button
                            class="button">返回商品清單</button></a>
        </div>

        <div class="review-container">
            <div class="average-rating">
                <div id="averageRating">
                    平均評分：
                </div>
            </div>
            <div class="filter-options">
                <button onclick="sortComment('desc')">由最高到低</button>
                <button onclick="sortComment('asc')">由最低到高</button>
            </div>
            <div class="commentArea" id="commentArea">
            </div>
        </div>
    </div>
</div>

<script src="${ctxPath}/vendors/jquery/jquery-3.7.0.min.js"></script>
<script src="${ctxPath}/vendors/axios/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<script>
    let comCommentNo = 0;
    let commodityComments;
    let sum = 0;
    let average = 0;
    $(document).ready(function () {

        axios.get("${ctxPath}/shop/commodityComment/get/${commodity.comNO}").then((res) => {
            commodityComments = res.data
            for (i = 0; i < commodityComments.length; i++) {
                sum += commodityComments[i].rating;

                $('#commentArea').append(
                    `  <div className="comment"  id="comment` + commodityComments[i].comCommentNo + `" style="border-top: 1px solid #ccc;margin-top: 20px; padding-top: 20px;">
                        <div className="member-info" style="font-weight: bold;margin-bottom: 5px;color: #B26021;">
                            會員名稱：` + commodityComments[i].memName + `
                            <span className="rating" style="color: gold; font-size: 1.2em;margin-left: 5px;">` + commodityComments[i].star + `</span>
                        </div>
                        <div className="date" style="color: #888;font-size: 0.8em;">` + commodityComments[i].commentTime + `</div>
                        <div className="comment-content" style="margin-top: 10px;color: #333;">
                            ` + commodityComments[i].comContent + `
                        </div>
						<button class="delete-button" style="background-color: #F2E8DA;color: red; font-size: 0.8em; margin-top: 10px;" onclick="deleteByComCommentNo(` + i + `)">
							刪除
						</button>
                    </div>`
                )
            }

            average = (sum / commodityComments.length).toFixed(1);
            $('#averageRating').html("平均評分" + average);

        })


    });

    function sortComment(sort) {
        axios.get("${ctxPath}/shop/commodityComment/get/${commodity.comNO}?sort=" + sort).then((res) => {
            $('#commentArea').empty();
            commodityComments = res.data
            for (i = 0; i < commodityComments.length; i++) {

                $('#commentArea').append(
                    `  <div className="comment"  id="comment` + commodityComments[i].comCommentNo + `" style="border-top: 1px solid #ccc;margin-top: 20px; padding-top: 20px;">
                        <div className="member-info" style="font-weight: bold;margin-bottom: 5px;color: #B26021;">
                            會員名稱：` + commodityComments[i].memName + `
                            <span className="rating" style="color: gold; font-size: 1.2em;margin-left: 5px;">` + commodityComments[i].star + `</span>
                        </div>
                        <div className="date" style="color: #888;font-size: 0.8em;">` + commodityComments[i].commentTime + `</div>
                        <div className="comment-content" style="margin-top: 10px;color: #333;">
                            ` + commodityComments[i].comContent + `
                        </div>
						<button class="delete-button" style="color: red; font-size: 0.8em; margin-top: 10px;" onclick="deleteByComCommentNo(` + i + `)">
							刪除
						</button>
                    </div>`
                )
            }

            average = (sum / commodityComments.length).toFixed(1);
            $('#averageRating').html("平均評分" + average);

        })

    }

    function deleteByComCommentNo(commentIndex) {
        comCommentNo = commodityComments[commentIndex].comCommentNo;

        axios.post("${ctxPath}/shop/commodityComment/delete/" + comCommentNo)
            .then((res) => {
                if (res.data === "success") {
                    $('#comment' + comCommentNo).remove();
                } else {
                    console.log("刪除失敗");
                    return;
                }


            })
            .catch((error) => {
                console.error("刪除請求錯誤:", error);
            });
    }
</script>

</body>
</html>
