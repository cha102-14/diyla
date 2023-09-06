<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <style>

                .bgc_empshowlist {
                    background-color: rgb(197, 218, 236);
                }


                .showAllEmpPage {
                    text-align: center;
                    padding-left: 280px;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    font-weight: bold;
                    font-size: 18px;
                    background-color: #FFEEDD;
                }
            </style>
            <link rel="stylesheet" href="../css/style.css">
        </head>

        <body>
            <jsp:include page="/index.jsp" />
            <div class="showAllEmpPage">
                <table class="display" style="width:100%">
                    <thead>

                        <br>

                        <div>
                            <td>請選擇權限類別</td>
                            <td><select id="chooseTypeFun" ><option select="selected" value="" >請選擇權限類別</option>
                                <option value="SHOP">商店管理員</option>
                                <option value="CLASS">課程管理員</option>
                                <option value="MEMADMIN">會員權限管理人員</option>
                                <option value="MASTER">師傅</option>
                                <option value="STORADMIN">倉儲管理人員</option>
                                <option value="CUSTORSERVICE">客服人員</option>
                           </select>
                           <button type="button" class="btn btn-primary" onclick="getAllEmpList()">查詢</button>
                        </div>
                        <br>
                        <tr style="background-color:#b45f06">
                            <th>筆數</th>
                            <th>編號</th>
                            <th>姓名</th>
                            <th>照片</th>
                            <th>信箱</th>
                            <th>權限</th>
                            <th>狀態</th>
                        </tr>
                    </thead>
                    <tbody id="empcolumns" class="bgc_empshowlist">

                    </tbody>
                </table>

                <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


                <br>
                <!-- 分頁選單及頁數頁碼button -->
                <div class="selectpage">
                    <label for="select_size">分頁顯示筆數 </label>
                    <select id="select_size" name="PageSize" onchange="resetCurrentPageIndex()">
                        <option select="selected" value="3">3</option>
                        <option value="5">5</option>
                        <option value="10">10</option>
                    </select>
                    <button type="button" class="firstPage" onclick="firstPageAndSubmit()">第一頁</button>
                    <button type="button" class="previousPage" onclick="prePageSizeAndSubmit()">上一頁</button>
                    <input id="pageIndex" type="text" size="1" value="1">
                    <button type="button" class="nextPage" onclick="nextPageSizeAndSubmit()">下一頁</button>
                    <button type="button" class="lastPage" onclick="lastPageAndSubmit()">最末頁</button>
                    <button type="button" class="btn btn-primary" onclick="getAllEmpList()">送出</button>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <p>當前頁碼：<span id="currentPage"></span> / 總頁數：<span id="totalPages"></span></p>
                </div>

            </div>
            
            <!--   優化頁數傳至後端,跑出第一頁 最後頁,上一頁,下一頁 隱藏button -->
            <script>
                let emp_totalSize = 0;
                function resetCurrentPageIndex() {
                    document.getElementById("pageIndex").value = 1;
                    getAllEmpList();
                }

                
                let chooseTypeFun = document.getElementById('chooseTypeFun');
                chooseTypeFun.onchange = resetCurrentPage;
                
                function resetCurrentPage(){
                    // 當使用者按下 (click) 按鈕時，執行 triggerAlert 函數
                    console.log('resetCurrentPage');
                    document.getElementById("pageIndex").value =1;

                }

                function getCurrentPage() {
                    let selectElement = document.getElementById("pageIndex");
                    return parseInt(selectElement.value);
                }

                function getTotalPageSize() {
                    let selectSizeElement = document.getElementById("select_size");
                    let totalPege = 0;
                    if (emp_totalSize % selectSizeElement.value === 0) {
                        totalPege = parseInt(emp_totalSize / selectSizeElement.value);
                    } else {
                        totalPege = parseInt(emp_totalSize / selectSizeElement.value) + 1;
                    }

                    return totalPege;
                }
                //  下一頁筆數及送出
                function nextPageSizeAndSubmit() {

                    let currentPege = getCurrentPage();
                    let totalPege = getTotalPageSize();
                    if (currentPege === totalPege) {
                        alert("此為最末頁")
                        return;
                    }
                    document.getElementById("pageIndex").value = currentPege + 1;
                    getAllEmpList();
                }

                //   第一頁提醒
                function firstPageAndSubmit() {
                    let currentPage = getCurrentPage();
                    if (currentPage === 1) {
                        alert("當前頁面為第一頁");
                        return;
                    } else {
                        // 如當前頁面非第一頁 帶至第一頁資料顯示
                        $("#pageIndex").val(1);
                        getAllEmpList();
                    }
                }

                //   最末頁提醒
                function lastPageAndSubmit() {
                    let currentPage = getCurrentPage();
                    let totalPages = getTotalPageSize();
                    if (currentPage === totalPages) {
                        alert("此為最末頁");
                        return;
                    } else {
                        //如目前非為最末頁,將跳至最末頁資料
                        $("#pageIndex").val(totalPages);
                        getAllEmpList();
                    }
                }

                //   上一頁比數及送出
                function prePageSizeAndSubmit() {
                    let currentPege = getCurrentPage();
                    if (currentPege < 2) {
                        alert("沒有前一頁可顯示");
                        return;
                    }
                    document.getElementById("pageIndex").value = currentPege - 1;
                    getAllEmpList();
                }

                function addEmpList() {
                    // 獲取下拉選單元素數量
                    let selectElement = document.getElementById("select_size");
                    // 獲取選中的值
                    let selectedValue = selectElement.value;
                    // 獲取下拉選單元素
                    let pageIndexElement = document.getElementById("pageIndex");
                    // 獲取選中的值
                    let pageIndexValue = pageIndexElement.value;
                    // 抓取權限類別元素
                    let typeFunElement = document.getElementById("chooseTypeFun");
                    // 抓取選中的值
                    let typeFunValue = typeFunElement.value;

                    console.log(typeFunValue);
                    let empData = {
                        "pageIndex": pageIndexValue,
                        "pageSize": selectedValue,
                        "chooseTypeFun":typeFunValue
                    }
                    return empData; // 此時data裡面有pageIndex及pageSize 2個參數

                }
                //新增提交 click按鈕送出呼叫以下funcation
                function getAllEmpList() {
                    let data = addEmpList();
                    // fetch 可以接受第二個可選參數，一個可以控制不同配置的init物件
                    let tt = getFunc('getAllEmpList', data)

                }
                //  此處的url代表送出請求後端url的位置,要和controller的postMapping相同
                function getFunc(url, data) {
                    return fetch(url, {//此括號開始為option
                        body: JSON.stringify(data),
                        // cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
                        // credentials: 'same-origin', // include, same-origin, *omit
                        //          此處的headers 為Key 裡面有另外2個Key及value
                        headers: {
                            // 'user-agent': 'Mozilla/4.0 MDN Exam',
                            'content-type': 'application/json'
                        },
                        method: 'POST', // GET/POST/PUT/DELETE
                        // mode: 'no-cors', // no-cors, cors, * same-origin
                        // redirect: 'follow', // manual, *follow, error
                        // referrer: 'no-referrer' // *client, no-referrer
                    })
                        .then(res => res.json()) // 把回傳的JSON字串取回，放在promise物件中回傳


                        .then(function (res) { //一樣有then
                            console.log(res);
                            let emps = res.empList;
                            emp_totalSize = res.totalSize
                            document.getElementById("currentPage").textContent = getCurrentPage();
                            document.getElementById("totalPages").textContent = getTotalPageSize();
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
                    // console.log(emps);
                    let html = "";
                    if (emps.length === 0) {
                        html = "<tr><td colspan='4' align='center'>尚無管理員資料</td></tr>";
                    } else {
                        for (let i = 0; i < emps.length; i++) {
                            let emp = emps[i];
                            // console.log(emp.empId);
                            html += "<tr>";
                            html += `<td>` + (i + 1) + `</td>`;
                            html += `<td>` + emp.empId + `</td>`;
                            html += `<td>` + emp.empName + `</td>`;
                            console.log(emp);  
                            if(emp.empPic == "" || emp.empPic == undefined){
                                html += `<td><img style="height: 150px; width: 150px;" class="imgWH_" src="../img/NoImage.jpg"></td>`;
                            } else {
                                html += `<td><img style="height: 150px; width: 150px;" class="imgWH_" src="data: image/jpeg;base64,` + emp.empPic + `"></td>`;
                            }
                            html += `<td>` + emp.empEmail + `</td>`;
                            html += `<td>` + emp.typeFun + `</td>`;
                            html += `<td><button type="button" id="` + emp.empId + `" class="empStatus">` + (emp.empStatus ? "開啟" : "停用") + `</button></td>`;
                            // html += `<td><input type="SUBMIT" value="修改"></td>`;
                            html += `</tr>`;
                        }
                        //將emps資料放入頁面中
                    }
                    // console.log(emps);
                    document.getElementById("empcolumns").innerHTML = html;
                    changeStatus();


                }

                function changeStatus() {
                    // 為所有具有 "status" 類別的 <input> 元素添加點擊事件
                    // 取出所有class="empStatus"的資料
                    const statusButtons = document.querySelectorAll('.empStatus');
                    statusButtons.forEach(button => {
                        button.addEventListener('click', function () {

                            let statusData = returnStatusData(button);

                            let isFetchSuccess = sendStatusChange(statusData);
                            // if (isFetchSuccess != "") {
                            //     console.log(isFetchSuccess.empStatus);
                            //     document.getElementById(empId).innerHTML = isFetchSuccess.empStatus ? '開啟' : '停用';
                            // } else {
                            //     console.log("請求失敗");
                            // }
                        })
                        // return;
                        // console.log(statusData.empId);
                        // console.log(statusData.empStatus);
                    });
                };


                function returnStatusData(button) {
                    //  取得該標籤屬性為id的值
                    const empId = button.getAttribute('id');
                    //   (emp.empStatus ? "開啟" : "停用") 為取得innerHTML動態生成的值
                    const empStatus = button.innerHTML;
                    let statusData = {
                        "empId": empId,
                        "empStatus": (empStatus === "停用") ? 1 : 0
                    }
                    return statusData;
                }
                
                function sendStatusChange(statusData) {
                    // console.log(statusData.empId);
                    // console.log(statusData.empStatus);
                    
                    // 這邊option為傳給後端的值
                    return fetch("changeEmpStatus", {
                        body: JSON.stringify(statusData),
                        headers: {
                            'content-type': 'application/json'
                        },
                        method: 'POST',
                    })//此處為從後端拿回的值
                        .then(res => res.json())
                        .then(function (res) {
                            console.log(res);
                            document.getElementById(statusData.empId).innerHTML = res.empStatus ? '開啟' : '停用';
                        })
                        .catch(function (error) {
                            console.log(error)
                            return "";
                        })
                }

                //  一進入網頁即呼叫該函式,抓取資料
                window.onload(getAllEmpList());
            </script>

        </body>

        </html>