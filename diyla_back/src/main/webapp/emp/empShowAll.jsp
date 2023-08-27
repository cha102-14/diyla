<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .bgc_empshowlist{
            background-color: rgb(197, 218, 236);
        }


                                      .showAllEmpPage {
                                           width: 100%;
                                           text-align: center;
                                           margin-left: 45%;
                                           padding-left: 70%;
                                           margin-bottom: 20px;
                                           font-family: "微軟正黑體", Arial, sans-serif;
                                           font-weight: bold;
                                           font-size: 18px;
                                           padding: 10px 300px;
                                           background-color: #FFEEDD;
                                           border-radius: 5px;
                                           background-color: #FFEEDD;
                                      }
    </style>
                            <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<div class="showAllEmpPage">
<table class="display" style="width:100%">
    <thead>
    <label for="select_page">分頁顯示筆數 </label>
    <select id="select_page" name="PageSize">
        <option select="selected" value="3">3</option>
        <option value="5">5</option>
        <option value="10">10</option>
    </select>
    <!-- TODO 8/24 select page 頁數傳至後端,跑出第一頁 最後頁,上一頁,下一頁 -->
    <!-- TODO 8/24 補管理員圖片 -->
    <br>
    <tr style="background-color:#b45f06">
        <th>筆數</th>
        <th>編號</th>
        <th>照片</th>
        <th>姓名</th>
        <th>信箱</th>
        <th>權限</th>
        <th>狀態</th>
        <th>修改</th>
    </tr>
    </thead>
    <tbody id="empcolumns" class="bgc_empshowlist">

    </tbody>
</table>

<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div>
    <h2>請輸入查詢id</h2>
    <input class="GoodsAddModal" type="text" name="id" value=1>
    <button type="button" class="btn btn-primary" onclick="addGoodsSubmit()">提交</button>
</div>
<div>
    <input class="result" type="text" name="result" value="">
</div>
</div>
<jsp:include page="/index.jsp" />
<script>

    function addEmpList() {
        // 獲取下拉選單元素
        let selectElement = document.getElementById("select_page");

        // 獲取選中的值
        let selectedValue = selectElement.value;
        let empData = {
            "pageIndex": 1,
            "pageSize": selectedValue
        }
        return empData;

    }
    //新增提交 click按鈕送出呼叫以下funcation
    function addGoodsSubmit() {
        let data = addEmpList();
        console.log(data);
        // fetch 可以接受第二個可選參數，一個可以控制不同配置的init物件
        // getFunc('http://127.0.0.1:8081/user/getUserData',data)
        let tt = getFunc('getAllEmpList', data)
        console.log(tt.toString);
    }
    //   var data = {
    //     id: $(".GoodsAddModal").val()
    //   };
    function getFunc(url, data) {
        return fetch(url, {
            body: JSON.stringify(data),
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, same-origin, *omit
            headers: {
                'user-agent': 'Mozilla/4.0 MDN Exam',
                'content-type': 'application/json'
            },
            method: 'POST', // GET/POST/PUT/DELETE
            mode: 'no-cors', // no-cors, cors, * same-origin
            redirect: 'follow', // manual, *follow, error
            referrer: 'no-referrer' // *client, no-referrer
        })
            .then(res => res.json()) // 把回傳的JSON字串取回，放在promise物件中回傳


            .then(function (res) { //一樣有then
                let emps = res.empList;
                let emp_totalSize = res.totalSize
                console.log(res);
                console.log(res.empList);
                console.log(res.totalSize);
                showEmps(emps);
                // var r = JSON.stringify(res);
                // console.log(res.data.userName)
                // $(".result").val(res.data.userName)


            })
            // .then(response => response.json())
            // .then(respdata)
            .catch(function (error) {
                console.log(error)
            })
    }

    function showEmps(emps) {
        console.log(emps);
        let html = "";
        if (emps.length === 0) {
            html = "<tr><td colspan='4' align='center'>尚無管理員資料</td></tr>";
        } else {
            for (let i = 0; i < emps.length; i++) {
                let emp = emps[i];
                console.log(emp);
                console.log(emp.empId);
                html += "<tr>";
                html += `<td>${i+1}</td>`;
                html += `<td>`+emp.empId+`</td>`;
                html += `<td>${"照片"}</td>`;
                html += `<td>`+emp.empName+`</td>`;
                html += `<td>`+emp.empEmail+`</td>`;
                html += `<td>`+emp.typeFun+`</td>`;
                html += `<td>`+(emp.empStatus?"啟用":"停權")+`</td>`;
                html += `<td><input type="SUBMIT" value="修改"></td>`;
                html += `</tr>`;
            }
            //將emps資料放入頁面中
        }
        console.log(emps);
        document.getElementById("empcolumns").innerHTML = html;

    }


</script>

</body>

</html>