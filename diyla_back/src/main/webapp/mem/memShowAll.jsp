<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <style>

                .bgc_memshowlist {
                    background-color: #FFE5E5(197, 218, 236);
                }


                .showAllMemPage {
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
            <div class="showAllMemPage">
                <table class="display" style="width:100%">
                    <thead>

                        <br>
                         <td></td>請輸入會員信箱</td>
                          <input type="TEXT" id ="memEmail" placeholder="請輸入要查詢的會員信箱" value="" >
                         <input type="HIDDEN" name="action" value="getEmail">
                         <button type="button" class="btn btn-primary" onclick="getAllMemList()">送出</button>

                        <tr style="background-color:#FFB7B7">
                            <th>筆數</th>
                            <th>會員編號</th>
                            <th>姓名</th>
                            <th>信箱</th>
                            <th>電話</th>
                            <th>討論區狀態</th>
                            <!-- <th>修改</th> -->
                        </tr>
                    </thead>
                    <tbody id="memcolumns" class="bgc_memshowlist">

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
                    <button type="button" class="btn btn-primary" onclick="getAllMemList()">送出</button>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <p>當前頁碼：<span id="currentPage"></span> / 總頁數：<span id="totalPages"></span></p>
                </div>

            </div>
            <jsp:include page="/index.jsp" />
            <!-- TODO  優化頁數傳至後端,跑出第一頁 最後頁,上一頁,下一頁 隱藏button -->
            <script>
                let mem_totalSize = 0;
                function resetCurrentPageIndex() {
                    document.getElementById("pageIndex").value = 1;
                    getAllMemList();
                }

                function getCurrentPage() {
                    let selectElement = document.getElementById("pageIndex");
                    return parseInt(selectElement.value);
                }

                function getTotalPageSize() {
                    let selectSizeElement = document.getElementById("select_size");
                    let totalPege = 0;
                    if (mem_totalSize % selectSizeElement.value === 0) {
                        totalPege = parseInt(mem_totalSize / selectSizeElement.value);
                    } else {
                        totalPege = parseInt(mem_totalSize / selectSizeElement.value) + 1;
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
                    getAllMemList();
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
                        getAllMemList();
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
                        getAllMemList();
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
                    getAllMemList();
                }

                function addMemList() {
                    // 獲取下拉選單元素數量
                    let selectElement = document.getElementById("select_size");
                    // 獲取選中的值
                    let selectedValue = selectElement.value;
                    // 獲取下拉選單元素
                    let pageIndexElement = document.getElementById("pageIndex");
                    // 獲取選中的值
                    let pageIndexValue = pageIndexElement.value;

                    let inputmemEmail = document.getElementById("memEmail");
                    let memEmailValue = inputmemEmail.value;
                    let memData = {
                        "pageIndex": pageIndexValue,
                        "pageSize": selectedValue,
                        "memEmail": memEmailValue
                    }
                    return memData; // 此時data裡面有pageIndex及pageSize、memEmail 3個參數

                }
                //新增提交 click按鈕送出呼叫以下funcation
                function getAllMemList() {
                    let memData = addMemList();
                    // fetch 可以接受第二個可選參數，一個可以控制不同配置的init物件
                    let tt = getMemList('getAllMemList', memData)
                }

                
                //  此處的url代表送出請求後端url的位置,要和controller的postMapping相同
                function getMemList(url, memData) {
                    return fetch(url, {//此括號開始為option
                        body: JSON.stringify(memData),
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
                            let mems = res.memList;
                            mem_totalSize = res.totalSize
                            document.getElementById("currentPage").textContent = getCurrentPage();
                            document.getElementById("totalPages").textContent = getTotalPageSize();
                            showMems(mems);
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

                    // function getMemInformation(){
                    // }

                    function showMems(mems) {
                    let html = "";
                    if (mems.length === 0) {
                        html = "<tr><td colspan='4' align='center'>尚無更多會員資料</td></tr>";
                    } else {
                        for (let i = 0; i < mems.length; i++) {
                            let mem = mems[i];
                            html += "<tr>";
                            html += `<td>` + (i + 1) + `</td>`;
                            html += `<td>` + mem.memId + `</td>`;
                            html += `<td>` + mem.memName + `</td>`;
                            html += `<td>` + mem.memEmail + `</td>`;
                            html += `<td>` + mem.memPhone + `</td>`;
                            html += `<td><button type="button" id="` + mem.memId + `" class="memStatus">` + (mem.memStatus ? "停用" : "正常") + `</button></td>`;
                            // html += `<td><input type="SUBMIT" value="修改"></td>`;
                            html += `</tr>`;
                        }
                        //將mems資料放入頁面中
                    }
                    // console.log(mems);
                    document.getElementById("memcolumns").innerHTML = html;
                    changeStatus();
                }

                function changeStatus() {
                    // 為所有具有 "status" 類別的 <input> 元素添加點擊事件
                    // 取出所有class="memStatus"的資料
                    const statusButtons = document.querySelectorAll('.memStatus');
                    statusButtons.forEach(button => {
                        button.addEventListener('click', function () {

                            let statusData = returnStatusData(button);

                            let isFetchSuccess = sendStatusChange(statusData);
                            // if (isFetchSuccess != "") {
                            //     console.log(isFetchSuccess.memStatus);
                            //     document.getElementById(empId).innerHTML = isFetchSuccess.memStatus ? '開啟' : '停用';
                            // } else {
                            //     console.log("請求失敗");
                            // }
                        })
                        // return;
                        // console.log(statusData.memId);
                        // console.log(statusData.memStatus);
                    });
                };


                function returnStatusData(button) {
                    //  取得該標籤屬性為id的值
                    const memId = button.getAttribute('id');
                    //   (mem.memStatus ? "開啟" : "停用") 為取得innerHTML動態生成的值
                    const memStatus = button.innerHTML;
                    let statusData = {
                        "memId": memId,
                        "memStatus": (memStatus === "正常") ? 1 : 0
                    }
                    return statusData;
                }
                
                function sendStatusChange(statusData) {
                    
                    // 這邊option為傳給後端的值
                    return fetch("changeMemStatus", {
                        body: JSON.stringify(statusData),
                        headers: {
                            'content-type': 'application/json'
                        },
                        method: 'POST',
                    })//此處為從後端拿回的值
                        .then(res => res.json())
                        .then(function (res) {
                            console.log(res);
                            document.getElementById(statusData.memId).innerHTML = res.memStatus ? '停用' : '正常';
                        })
                        .catch(function (error) {
                            console.log(error)
                            return "";
                        })
                }

                //  一進入網頁即呼叫該函式,抓取資料
                window.onload(getAllMemList());
            </script>

        </body>

        </html>