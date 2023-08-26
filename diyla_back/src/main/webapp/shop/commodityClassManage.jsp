<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%-- List<String> productCategories = (List<String>) request.getAttribute("productCategories"); --%>
<!DOCTYPE html>
<html>
<head>
    <title>商品類別管理</title>
    <link rel="stylesheet" type="text/css" href="../css/commodityClass.css">
    <script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="${ctxPath}/vendors/axios/axios.min.js"></script>
</head>
<body>
<div class="header">商品類別管理</div>
<div class="container">
    <div class="category-list">
    </div>
    <div class="input-container">
        <form action="${ctxPath}/shop/CommodityClassController" method="post">
            <input type="text" name="action" value="insert" hidden="hidden">
            <input type="text" class="input-field" id="className" name="className" placeholder="新增新的類別">
            <span style="display: block; color: red;">${errMsgs["className"]}</span>
            <input type="submit" id="submitButton" value="提交">

        </form>
    </div>
    <div id="commodityClasses">
    </div>
    <a href="${ctxPath}/shop/CommodityController?action=listAll"><button class="button" >返回商品清單</button></a>
</div>
<script>
    let commodityClasses;
    document.addEventListener("DOMContentLoaded", () => {
        axios.get("${ctxPath}/shop/commodityClass/getAll").then((res) => {
            console.log(res);
            commodityClasses = res.data;
            for (i = 0; i < commodityClasses.length; i++) {
                $('#commodityClasses').append(
                    `<div class="category-item" id="commodityClassDiv`+i+`">
                        <span class="" id="commodityClass`+i+`">` + commodityClasses[i].comClassName +
                    `   </span>
                        <button id="commodityClassEditButton`+i+`" onclick="editClass(`+i+`)">修改</button>
                    </div>`
                )
            }
        })


    });

    function editClass(i) {
        $('#commodityClassDiv' + i).html(
            `<input type="text" id="comClassName`+i+`" value="` + commodityClasses[i].comClassName + `">
             <button id="commodityClassSubmitButton`+i+`" onclick="editSubmit(`+i+`)">完成</button>
             <button id="commodityClassCancelButton`+i+`" onclick="editCancel(`+i+`)">取消</button>`

        );
    }


    function editCancel(i){
        let name = commodityClasses[i].comClassName;
        $('#commodityClassDiv' + i).html(
            `<span class="" id="commodityClass` + i + `">` + name +
            `</span>
        <button id="commodityClassEditButton` + i + `" onclick= " editClass(` + i + `)">修改</button>
        `
        );
    }

    function editSubmit(i) {
        let name=$('#comClassName'+i).val();
        if (name.length === 0 || name === null) {
            alert("類別名稱不得為空白，請輸入類別名稱！")
            return
        }
        let commodityClassEntity= {
            "comClassName":name,
            "comClassNo":commodityClasses[i].comClassNo,
            "updateTime": null
        };

        axios.post('${ctxPath}/shop/commodityClass/update',commodityClassEntity)
            .then((res)=>{
                commodityClasses=res.data
                $('#commodityClassDiv' + i).html(
                    `<span class="" id="commodityClass`+i+`">` + commodityClasses[i].comClassName +
                    `</span>
                     <button id="commodityClassEditButton`+i+`" onclick="editClass(`+i+`)">修改</button>`
                )
            }
        )
    }
</script>
</body>
</html>
