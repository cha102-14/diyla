<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品評論頁面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #B26021;
            text-align: center;
        }

        .rating {
            unicode-bidi: bidi-override;
            direction: rtl;
            text-align: center;
        }

        .rating > input {
            display: none;
        }

        .rating > label {
            display: inline-block;
            width: 25px;
            font-size: 24px;
            padding: 0;
            margin: 0;
            cursor: pointer;
            color: #ccc;
        }

        .rating > label::before {
            content: '\2605';
        }

        .rating > input:checked ~ label,
        .rating > input:checked ~ label ~ label {
            color: #ffcc00;
        }

        .comment {
            margin-top: 20px;
        }

        .comment textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
        }

        .submit-btn {
            margin-top: 10px;
        }

        .button {
            border: none;
            border-radius: 1rem;
            background-color: #B26021;
            color: #ffffff;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #934e1a;
        }
    </style>
</head>
<body>
<h1>${commodityVO.comName}</h1><br>

<form action="${ctxPath}/shop/commodityComment/insertComment/${commodityVO.comNO}" method="post" enctype="application/x-www-form-urlencoded">
<div class="comment">
    <div class="" style="text-align: left">
        <label for="rating">評分：</label>
        <select id="rating" name="rating">
            <option value="5">5顆星</option>
            <option value="4">4顆星</option>
            <option value="3">3顆星</option>
            <option value="2">2顆星</option>
            <option value="1">1顆星</option>
        </select>
    </div>
    <label for="comment">撰寫評論：</label><br>
    <textarea id="comment" name="comContent" placeholder="請輸入您的評論"></textarea>
</div>
<button type="submit" class="button" >提交評論</button>
</form>
</body>
</html>
