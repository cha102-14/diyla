<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>會員查詢</title>
            <style>

                .serchMember {
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

              
                .meminput {
                    margin-left: 23%;
                }
                .showAllMemPage {
                    margin-left: 300px;
                    width:72%;
                    min-height: 612px;
                    font-family: "微軟正黑體", Arial, sans-serif;
                    font-weight: bold;
                    font-size: 18px;
                    background-color: #FFEEDD;
                }

                input.inputtext {
                    border: 1px solid #B26021;
                    margin: 5px;
                    border-radius: 0.5rem;
                    font-size: 1rem;
                    color: #B26021;
                    height: 25px;
                    letter-spacing: 1px;
                }

                .serchEmail{
                    margin-left: 50%;
                }
                
                .selectpage{
                    position: absolute;
                    top: 90%;
                    left: 58%;
                    width: 45%;
                    margin-left: 60px;
                    transform: translate(-50%, -50%);
                }

                .currentTotalPage{
                    position: absolute;
                    top: 95%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                }

                .memCount{
                    text-align: center;
                }

                .memId{
                    text-align: center;
                }

                .memName{
                    text-align: center;
                }

                .memEmail{
                    text-align: center;
                }

                .memPhone{
                    text-align: center;
                }

                .memArt{
                    text-align: center;
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

                .memStatus{
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
            <div class="showAllMemPage">
                <table class="memListDisplay" style="width:100%">
                    <div class="serchMember">
                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45px" height="45px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" fill="#a75d5d" stroke="#a75d5d">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier"> <g> <g> <path fill="#FFF8EA" d="M302.188,279.563C313.36,263.875,320,244.727,320,224c0-53.032-42.984-96-96-96c-53.017,0-96,42.968-96,96 c0,53.016,42.983,96,96,96c20.727,0,39.875-6.64,55.563-17.812l77.124,77.124c6.25,6.252,16.375,6.252,22.624,0 c6.252-6.249,6.252-16.374,0-22.623L302.188,279.563z M278.953,256.319c-5.53,9.36-13.273,17.104-22.634,22.634 C246.805,284.563,235.843,288,224,288c-35.345,0-64-28.656-64-64s28.655-64,64-64c35.344,0,64,28.656,64,64 C288,235.843,284.563,246.805,278.953,256.319z M256,0C114.609,0,0,114.609,0,256s114.609,256,256,256s256-114.609,256-256 S397.391,0,256,0z M256,472c-119.298,0-216-96.702-216-216c0-119.297,96.702-216,216-216s216,96.703,216,216 C472,375.298,375.298,472,256,472z"></path> </g> </g> </g></svg>
                            &nbsp
                        會員查詢
                        
                    </div>

                    <div class="serchEmail">
                    <br><br>
                    <td> <td></td><span class="meminput">請輸入會員信箱</span></td></td>
                    <input type="TEXT" class="inputtext" id ="memEmail" placeholder="請輸入要查詢的會員信箱" value="" >
                    <input type="HIDDEN" name="action" value="getEmail">
                    <button type="button" class="sendbutton" onclick="getAllMemList()">送出</button><br>
                    </div>
                    <br><br>

                    <thead class="informationTitle">
                        <tr >
                            <th>筆數</th>
                            <th>會員編號</th>
                            <th>姓名</th>
                            <th>信箱</th>
                            <th>電話</th>
                            <th>討論區狀態</th>
                        </tr>
                    </thead>
                    <tbody id="memcolumns" class="bgc_memshowlist">

                    </tbody>

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
                    <button type="button" class="selectbutton" class="" class="firstPage" onclick="firstPageAndSubmit()">第一頁</button>
                    <button type="button" class="selectbutton" class="previousPage" onclick="prePageSizeAndSubmit()">上一頁</button>
                    <input id="pageIndex" class="textbutton" class="inputtext" type="text" size="1" value="1">
                    <button type="button" class="selectbutton" class="nextPage" onclick="nextPageSizeAndSubmit()">下一頁</button>
                    <button type="button" class="selectbutton" class="lastPage" onclick="lastPageAndSubmit()">最末頁</button>
                    <button type="button" class="sendbutton" onclick="getAllMemList()">送出</button>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <p class="currentTotalPage">當前頁碼：<span id="currentPage"></span> / 總頁數：<span id="totalPages"></span></p>
                </div>
            </table>


            </div>
           
            <!-- TODO  優化頁數傳至後端,跑出第一頁 最後頁,上一頁,下一頁 隱藏button -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
            <script>
                let mem_totalSize = 0;
                function resetCurrentPageIndex() {
                    document.getElementById("pageIndex").value = 1;
                    getAllMemList();
                }

                let memEmail = document.getElementById('memEmail');
                memEmail.onclick = resetCurrentPage;

                function resetCurrentPage(){
                    document.getElementById("pageIndex").value = 1;
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
                        Swal.fire('此為最末頁 !');
                        return;
                    }
                    document.getElementById("pageIndex").value = currentPege + 1;
                    getAllMemList();
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
                        getAllMemList();
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
                        getAllMemList();
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
                            // console.log(mems)
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
                            // console.log(error)
                        })
                    }

                    // function getMemInformation(){
                    // }

                    function showMems(mems) {
                    let html = "";
                    if (mems.length === 0) {
                        html = "<tr><td colspan='4' align='center'>尚無更多會員資料</td></tr>";
                    } else {
                            html += "<br>";
                        for (let i = 0; i < mems.length; i++) {
                            let mem = mems[i];
                            html += "<tr>";
                            html += `<td class="memCount">` + (i + 1) + `</td>`;
                            html += `<td class="memId">` + mem.memId + `</td>`;
                            html += `<td class="memName">` + mem.memName + `</td>`;
                            html += `<td class="memEmail">` + mem.memEmail + `</td>`;
                            html += `<td class="memPhone">` + mem.memPhone + `</td>`;
                            html += `<td class="memArt"><button  type="button" id="` + mem.memId + `" class="memStatus">` + (mem.blacklistArt ? "停用" : "正常") + `</button></td>`;
                            // html += `<td><input type="SUBMIT" value="修改"></td>`;
                            html += `</tr>`;
                            html += `<br>`
                            // console.log(mem.blacklistArt);
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
                            // console.log(res);
                            document.getElementById(statusData.memId).innerHTML = res.memStatus ? '停用' : '正常';
                        })
                        .catch(function (error) {
                            // console.log(error)
                            return "";
                        })
                }

                //  一進入網頁即呼叫該函式,抓取資料
                window.onload(getAllMemList());
            </script>

        </body>

        </html>