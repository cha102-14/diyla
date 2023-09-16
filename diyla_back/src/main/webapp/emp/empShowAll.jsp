<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>管理員查詢</title>
            <style>

                .serchEmp {
                    text-align:center;
                    padding-top: 10px;
                    padding-bottom:10px;
                    border-radius: 8px;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    font-weight: bold;
                    font-size: 45px;
                    color: #F6F4EB;
                    background-color: #A75D5D;
                }

                .showAllEmpPage {
                    margin-left: 300px;
                    width:72.5%;
                    height: 725px;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    font-weight: bold;
                    font-size: 18px;
                    background-color: #FFEEDD;
                }

                .iconaddemp{ 
                    float:right;
                    position: relative;
                    top:    5px; 
                    right: 120px; 
                }

                div.emptitle{
                    position: relative;

                }

                element.style {
                    position: absolute;
                }


                td.count {
                    text-align: center; /* 文本左对齐，根据需要调整 */
                }

                td.empid {
                    text-align: center; /* 文本左对齐，根据需要调整 */
                }

                td.empname {
                    white-space: nowrap; /* 防止文本折行 */
                    text-align: center; /* 文本左对齐，根据需要调整 */
                }

                td.empPic{
                    text-align: center;
                }

                td.empemail {
                    white-space: nowrap; /* 防止文本折行 */
                    text-align: center; /* 文本左对齐，根据需要调整 */
                }

                td.emptypefun {
                    white-space: nowrap; /* 防止文本折行 */
                    text-align: center; /* 文本左对齐，根据需要调整 */
                }

                .selectTypeFun{
                    position: relative;
                    left: 250px;
                }

                .selectpage{
                    margin-left: 180px;
                }

                .currentTotalPage{
                    position: relative;
                    top: 20px;
                    left: 66%;
                    transform: translate(-50%, -50%);
                }

                .informationTitle{
                    margin-top: 10px;
                    padding-top: 10px;
                    padding-bottom: 10px;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    font-weight: bold;
                    font-size: 20px;
                    color: #F8F1F1;
                    background-color:#A3816A;

                }

                .sendbutton{
                    width: 50px;
                    height: 25px;
                    border-width: 1px;
                    border-radius: 10px;
                    background-color: #A3816A;
                    cursor: pointer;
                    outline: none;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    color: #F8F1F1;
                    font-size: 15px;
                }

                .empStatus{
                    width: 50px;
                    height: 30px;
                    border-width: 3px;
                    border-radius: 10px;
                    background-color: #815B5B;
                    cursor: pointer;
                    outline: none;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    color: #FEFCF3;
                    font-size: 15px;
                    font-weight: bold;

                }

                .selectbutton{
                    width: 65px;
                    height: 25px;
                    border-width: 1px;
                    border-radius: 10px;
                    background-color: #A3816A;
                    cursor: pointer;
                    outline: none;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    color: #F8F1F1;
                    font-size: 15px;

                }

                .textbutton{
                    width: 30px;
                    height: 25px;
                    text-align: center;
                    border-width: 2px;
                    border-radius: 10px;
                    background-color: #A3816A;
                    cursor: pointer;
                    outline: none;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    color: #F8F1F1;
                    font-size: 15px;
                    
                }

                #chooseTypeFun{
                    font-family: "微軟正黑體", Arial, sans-serif;
                    text-align: center;
                    font-size: 15px; /*文字大小*/
                    color: F8F1F1; /*文字顏色*/
                    border-radius: 10px;
                    font-weight: bold;
                }

                #select_size{
                    font-family: "微軟正黑體", Arial, sans-serif;
                    text-align: center;
                    font-size: 15px; /*文字大小*/
                    color: F8F1F1; /*文字顏色*/
                    border-radius: 10px;
                    font-weight: bold;
                }


            </style>
            <link rel="stylesheet" href="../css/style.css">
        </head>

        <body>
            <jsp:include page="/index.jsp" />
            <div class="showAllEmpPage">

                <div class="serchEmp">
                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45px" height="45px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" fill="#a75d5d" stroke="#a75d5d">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier"> <g> <g> <path fill="#FFF8EA" d="M302.188,279.563C313.36,263.875,320,244.727,320,224c0-53.032-42.984-96-96-96c-53.017,0-96,42.968-96,96 c0,53.016,42.983,96,96,96c20.727,0,39.875-6.64,55.563-17.812l77.124,77.124c6.25,6.252,16.375,6.252,22.624,0 c6.252-6.249,6.252-16.374,0-22.623L302.188,279.563z M278.953,256.319c-5.53,9.36-13.273,17.104-22.634,22.634 C246.805,284.563,235.843,288,224,288c-35.345,0-64-28.656-64-64s28.655-64,64-64c35.344,0,64,28.656,64,64 C288,235.843,284.563,246.805,278.953,256.319z M256,0C114.609,0,0,114.609,0,256s114.609,256,256,256s256-114.609,256-256 S397.391,0,256,0z M256,472c-119.298,0-216-96.702-216-216c0-119.297,96.702-216,216-216s216,96.703,216,216 C472,375.298,375.298,472,256,472z"></path> </g> </g> </g></svg>
                        &nbsp
                    管理員查詢

                
                </div>

                <a href="/diyla_back/emp/insert.jsp">
                <svg fill="#000000" width="88px" height="88px" viewBox="0 0 24.00 24.00" data-name="Line Color" 
                xmlns="http://www.w3.org/2000/svg" class="iconaddemp"><g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                <path id="secondary" d="M8.54,13A4,4,0,1,0,12,7a3.66,3.66,0,0,0-1,.13" style="fill: none; stroke: #ffbfbf; stroke-linecap: round; stroke-linejoin: round; stroke-width:0.9600000000000002;"></path>
                <path id="secondary-2" data-name="secondary" d="M7,19.5a9,9,0,0,0,9.94,0A5,5,0,0,0,7,19.5ZM3,9H7M5,11V7" style="fill: none; stroke: #ffbfbf; stroke-linecap: round; stroke-linejoin: round; stroke-width:0.9600000000000002;"></path>
                <path id="primary" d="M8,3.94A9,9,0,1,1,5.64,18.36,8.86,8.86,0,0,1,3.52,15"  style="fill: none; stroke: #9a3b3b; stroke-linecap: round; stroke-linejoin: round; stroke-width:0.9600000000000002;"></path></g></svg>
                </a>
                <br><br>
                <div class="selectTypeFun">
                    <td>請選擇權限類別</td>
                    <td><select id="chooseTypeFun" ><option select="selected" value="" >請選擇權限類別</option>
                        <option value="SHOP">商店管理員</option>
                        <option value="CLASS">課程管理員</option>
                        <option value="MEMADMIN">會員權限管理人員</option>
                        <option value="MASTER">師傅</option>
                        <option value="STORADMIN">倉儲管理人員</option>
                        <option value="CUSTORSERVICE">客服人員</option>
                   </select>
                   <button type="button" class="sendbutton" onclick="getAllEmpList()">查詢</button>
                </div>
                <table class="display" style="width:100%">
                    <thead class="informationTitle">

                        <br>

                        
                        <br>

                        <div>
                        <tr>
                            <th>筆數</th>
                            <th>編號</th>
                            <th>姓名</th>
                            <th>照片</th>
                            <th>信箱</th>
                            <th>權限</th>
                            <th>狀態</th>
                        </tr>
                        </div>
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
                    <button type="button" class="selectbutton" class="firstPage" onclick="firstPageAndSubmit()">第一頁</button>
                    <button type="button" class="selectbutton" class="previousPage" onclick="prePageSizeAndSubmit()">上一頁</button>
                    <input id="pageIndex" class="textbutton" type="text" size="1" value="1">
                    <button type="button" class="selectbutton" class="nextPage" onclick="nextPageSizeAndSubmit()">下一頁</button>
                    <button type="button" class="selectbutton" class="lastPage" onclick="lastPageAndSubmit()">最末頁</button>
                    <button type="button" class="sendbutton" onclick="getAllEmpList()">送出</button>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <br>
                    <p class="currentTotalPage">當前頁碼：<span id="currentPage"></span> / 總頁數：<span id="totalPages"></span></p>
                </div>

            </div>

            <!--   優化頁數傳至後端,跑出第一頁 最後頁,上一頁,下一頁 隱藏button -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
                    // console.log('resetCurrentPage');
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
                        Swal.fire('此為最末頁 !');
                        return;
                    }
                    document.getElementById("pageIndex").value = currentPege + 1;
                    getAllEmpList();
                }

                //   第一頁提醒
                function firstPageAndSubmit() {
                    let currentPage = getCurrentPage();
                    if (currentPage === 1) {
                        Swal.fire('當前頁面為第一頁 !');
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
                        Swal.fire('此為最末頁！');
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
                        Swal.fire('沒有前一頁可顯示！');
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

                    // console.log(typeFunValue);
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
                            // console.log(res);
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
                            // console.log(error)
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
                            html += `<td class="count">` + (i + 1) + `</td>`;
                            html += `<td class="empid">` + emp.empId + `</td>`;
                            // html += `<td style="height:15px; width:15px;">` + (i + 1) + `</td>`;
                            // html += `<td style="height:5px; width:5px;">` + emp.empId + `</td>`;
                            html += `<td class="empname">` + emp.empName + `</td>`;
                            // console.log(emp);
                            if(emp.empPic == "" || emp.empPic == undefined){
                                html += `<td class="empPic"><img style="height: 150px; width: 150px;" class="imgWH_" src="../img/NoImage.jpg"></td>`;
                            } else {
                                html += `<td class="empPic"><img style="height: 150px; width: 150px;" class="imgWH_" src="data: image/jpeg;base64,` + emp.empPic + `"></td>`;
                            }
                            html += `<td class="empemail">` + emp.empEmail + `</td>`;
                            html += `<td class="emptypefun">` + emp.typeFun + `</td>`;
                            html += `<td><button type="button" id="` + emp.empId + `" class="empStatus">` + (emp.empStatus ? "開啟" : "停用") + `</button></td>`;
                            // html += `<td><input type="SUBMIT" value="修改"></td>`;
                            html += `</tr>`;
                            console.log(emp.empStatus);
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

                // TODO 修改 Script
                   // JavaScript 函数，用于显示选定的页签内容
                function showTab(tabId) {
                    // 隐藏所有页签内容块
                    var tabContents = document.querySelectorAll('.tab-content');
                    tabContents.forEach(function (tabContent) {
                        tabContent.classList.remove('active');
                    });

                    // 隐藏所有页签按钮的激活状态
                    var tabs = document.querySelectorAll('.tab');
                    tabs.forEach(function (tab) {
                        tab.classList.remove('active');
                    });

                    // 显示选定的页签内容块
                    var selectedTabContent = document.getElementById(tabId + '-content');
                    selectedTabContent.classList.add('active');

                    // 设置选定的页签按钮为激活状态
                    var selectedTab = document.querySelector('.tab[data-tab="' + tabId + '"]');
                    selectedTab.classList.add('active');
                }

                // 页面加载时，默认显示第一个页签内容
                showTab('tab1');

            </script>

        </body>

        </html>