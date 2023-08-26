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

    class CommodityClassEntity {
        comClassNo;
        comClassName;
        updateTime;
    }
    document.addEventListener("DOMContentLoaded", () => {
        axios.get("${ctxPath}/shop/commodityClass/getAll").then((res) => {
            console.log(res);
            commodityClasses = res.data;

            for (i = 0; i < commodityClasses.length; i++) {

                $('#commodityClasses').append(
                    `<div class="category-item" id="commodityClassDiv`+commodityClasses[i].comClassNo+`">
                        <span class="" id="commodityClass`+commodityClasses[i].comClassNo+`">` + commodityClasses[i].comClassName +
                    `   </span>
                        <button id="commodityClassEditButton`+commodityClasses[i].comClassNo+`" onclick="editClass(`+commodityClasses[i].comClassNo+`)">修改</button>
                    </div>`
                )

            }


        })


    });
    function editClass(id) {
        let no = commodityClasses[id - 1].comClassNo;
        let name = commodityClasses[id - 1].comClassName;
        $('#commodityClassDiv' + id).html(
            `<input type="text" id="comClassName`+no+`" value="` + commodityClasses[id - 1].comClassName + `">
             <button id="commodityClassSubmitButton`+no+`" onclick="editSubmit(`+no+`)">完成</button>
             <button id="commodityClassCancelButton`+no+`" onclick="editCancel(`+no+`)">取消</button>`

        );

    }
    function editCancel(id){
        let no = commodityClasses[id - 1].comClassNo;
        let name = commodityClasses[id - 1].comClassName;

        $('#commodityClassDiv' + id).html(
            `<span class="" id="commodityClass`+no+`">` + name +
        ` </span>
        <button id="commodityClassEditButton`+no+`" onclick= " editClass(`+no+`)">修改</button>
        `
        )
    }

    function editSubmit(id) {
        let name=$('#comClassName'+id).val();
        let commodityClassEntity= {
            "comClassName":name,
            "comClassNo":commodityClasses[id - 1].comClassNo,
            "updateTime": null
        }

        axios.post('${ctxPath}/shop/commodityClass/update',commodityClassEntity)
            .then((res)=>{
                commodityClasses=res.data
                $('#commodityClassDiv' + id).html(
                    `<span class="" id="commodityClass`+commodityClasses[id-1].comClassNo+`">` + commodityClasses[id-1].comClassName +
                    `</span>
                     <button id="commodityClassEditButton`+commodityClasses[id-1].comClassNo+`" onclick="editClass(`+commodityClasses[id-1].comClassNo+`)">修改</button>`
                )

            }
        )
    }
</script>
</body>
</html>
