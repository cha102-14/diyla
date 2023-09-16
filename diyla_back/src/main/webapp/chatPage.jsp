<!DOCTYPE html>
<html>

<head>
    <title>Chat Room</title>
    <style>
        #chatIcon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            background-color: #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            cursor: pointer;
            z-index: 1;
        }

        #chatContainer {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 600px;
            height: 455px;
            border: 1px solid #ccc;
            background-color: white;
            display: none;
            z-index: 1;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        #chatHeader {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }

        #chatMessages {
            padding: 10%;
            overflow-y: scroll;
            height: 400px;
        }

        .message {
            margin: 10px;
            padding: 10px;
            border-radius: 8px;
            max-width: 70%;
        }

        .user-message {
            background-color: #DCF8C6;
            align-self_chat: flex-end;
        }

        .other-message {
            background-color: #F4F4F4;
            align-self_chat: flex-start;
        }

        #chatInputContainer {
            /* display: flex; */
            align-items: center;
            border-top: 1px solid #ccc;
            /* padding: 200px; */
            position: fixed;
            /* position: sticky; */
            bottom: 10px;
            right: 0%;
        }

        #chatInput {
            flex-grow_chat: 1;
            padding: 8px;
            border: none;
            border-radius: 20px;
            margin-right: 10px;
        }

        #sendButton {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 8px 20px;
            cursor: pointer;
        }

        #closeChat {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            color: #555;
            cursor: pointer;
        }

        #friendList {
            padding: 10px;
            border-right: 1px solid #ccc;
            height: 100%;
            /* overflow-y: scroll; */
            width: 30%;
            float: left;
        }

        .friend {
            padding: 10px;
            cursor: pointer;
            border-bottom: 1px solid #ccc;
            background-color: rgb(93, 200, 93);
            text-align: left;
            display: inline-block;
            border-radius: 50%; /* 将边框半径设置为50%，使其变成圆形 */
        }

        .friend.active {
            background-color: #f5f5f5;
        }

        #activeChat {
            width: 70%;
            float: left;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .message-area {
            height: 70%;
            resize: none;
            box-sizing: border-box;
            overflow: auto;
            background-color: #ffffff;
        }
        .me {
            padding: 10px;
            cursor: pointer;
            border-bottom: 1px solid #ccc;
            background-color: rgb(222, 212, 212);
            text-align: right;
            display: inline-block;
            border-radius: 50%; /* 将边框半径设置为50%，使其变成圆形 */
        }
        .me_div{
            text-align: right; /* 将文本容器内的内容靠右 */
        }
        .friend.div{
            text-align: right; /* 将文本容器内的内容靠右 */
        }
        #row_chat{
            width: 30px;
        }
        /* 朋友圖片 */
        div.friendIng-div {
            width: 150px; /* 设置图片容器的宽度和高度 */
            height: 50px;
            border-radius: 0%; /* 将边框半径设置为50%，使其变成圆形 */
            overflow: hidden; /* 隐藏超出边界的部分 */
            /* display: inline-block; 使容器内的内容水平居中 */
            display: flex; /* 使用 flex 布局 */
            align-items: center; /* 垂直居中内容 */
        }
        .friendImg{
            width: 50px; /* 使图像充满容器 */
            height: auto; /* 自适应高度 */
            display: block; /* 确保图像占据其容器的全部空间 */
            object-fit: cover; /* 保持图片比例，填满容器 */
        }
        p.friendName{
            text-align: center;
            size: 16px;
            margin: inherit;
        }
    </style>
</head>

<body>
    <div id="chatIcon" onclick="closeChat()">Chat</div>
    <div id="chatContainer" style="display: none;">
        <div id="closeChat" onclick="closeChat()">-</div>
        <!-- <div id="row_chat"></div> -->

        <div id="friendList">
            <span>Talk to : </span><div id="statusOutput" class="statusOutput"></div>
            <hr>
        <div id="row_chat"></div>
        <!-- <div id="friendImg"></div> //測試用-->
        </div>
        <div id="activeChat">
            <div id="chatHeader" onclick="closeChat()">Chat Room</div>
            <div id="messagesArea" class="panel message-area"></div>
            <!-- <div id="chatMessages"></div> -->
            <div id="chatInputContainer">
                <input type="text" id="message" placeholder="Type your message...">
                <button id="sendButton" type="button" onclick="sendMessage()">Send</button>
            </div>
        </div>
    </div>

    <script>
        const chatIcon = document.getElementById('chatIcon');
        const chatContainer = document.getElementById('chatContainer');
        const closeChatButton = document.getElementById('closeChat');
        const friendList = document.querySelectorAll('.friend');
        // const activeChat = document.getElementById('activeChat');
        const chatInput = document.getElementById('message');
        const sendButton = document.getElementById('sendButton');
        let date = new Date();
        let dateTimeNow = formatDate(date, 'MM-dd HH:mm');
        let dateTimeNowToBackend = formatDate(date, 'yyyy-MM-dd HH:mm:ss');




        let MyPoint = "/chat/Master_${empId}_${empName}";
        let port = window.location.host.port;
        let host = window.location.host;
        let path = window.location.pathname;
        let webCtx = path.substring(0, path.indexOf('/', 1));
        let endPointURL = "wss://" + host + webCtx + MyPoint;

        let statusOutput = document.getElementById("statusOutput");
        let messagesArea = document.getElementById("messagesArea");
        // 可替換成名稱
        let self_chat = "Master_" + '${empId}_${empName}';

        let webSocket;

        function formatDate(date, format) {
        const yyyy = date.getFullYear();
        const MM = String(date.getMonth() + 1).padStart(2, '0');
        const dd = String(date.getDate()).padStart(2, '0');
        const HH = String(date.getHours()).padStart(2, '0');
        const mm = String(date.getMinutes()).padStart(2, '0');
        const ss = String(date.getSeconds()).padStart(2, '0');

        format = format.replace('yyyy', yyyy);
        format = format.replace('MM', MM);
        format = format.replace('dd', dd);
        format = format.replace('HH', HH);
        format = format.replace('mm', mm);
        format = format.replace('ss', ss);

        return format;
        }

        const formattedDate = formatDate(date, 'yyyy-MM-dd HH:mm:ss');
        console.log(formattedDate);


        // 定义将ArrayBuffer转换为Base64字符串的函数
        function arrayBufferToBase64(buffer) {
        let binary = '';
        const bytes = new Uint8Array(buffer);
        const len = bytes.byteLength;

        for (let i = 0; i < len; i++) {
            binary += String.fromCharCode(bytes[i]);
        }
        return btoa(binary);
        }

        // 過濾其他非師傅權限的員工
        function notMasterEmpfilter(){
            let empFunList = `${typeFun}`;
            // 判斷是否存在多筆 權限
            if(empFunList.includes(",")){
                return true;
            }
            let empFun = empFunList.substring(1, empFunList.length-1);
            let isMaster = !empFun.includes("MASTER");
            return isMaster;
        }
        // 開啟網頁就建立連線
        window.onload(webSocketOnloadConnect());
        function webSocketOnloadConnect() {
            webSocket = new WebSocket(endPointURL);

            webSocket.onopen = function (event) {
                // 停止且隱藏
                if(notMasterEmpfilter()){
                chatIcon.style.display = "none";
                webSocket.close();

                } else {
                    console.log("connect success!");
                }
            };

            // 收到訊息
            webSocket.onmessage = function (event) {
                var jsonObj = JSON.parse(event.data);
                if ("open" === jsonObj.type) {
                    refreshFriendList(jsonObj);
                // 當點選對話對象的時候，觸發後端返回歷史訊息
                } else if ("history" === jsonObj.type) {
                    messagesArea.innerHTML = '';
                    var ul = document.createElement('ul');
                    ul.id = "area";
                    messagesArea.appendChild(ul);
                    // 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
                    var messages = JSON.parse(jsonObj.message);
                    for (var i = 0; i < messages.length; i++) {
                        var historyData = JSON.parse(messages[i]);
                        let fixedSender = historyData.sender;
                        var showMsg = historyData.message;
                        var li = document.createElement('li');
                        var div = document.createElement('div');
                        div.appendChild(li);
                        let nameLi = document.createElement('li');
                        // 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
                        fixedSender === self_chat ? div.className +='me_div' : div.className += 'friend_div';
                        fixedSender === self_chat ? nameLi.className +='me_div' : nameLi.className += 'friend_div';
                        fixedSender === self_chat ? li.className += 'me' : li.className += 'friend';

                        // TODO 接收到訊息時 顏色變更
                        let getMesageColor = "#007bff"
                        chatIcon.style.backgroundColor = getMesageColor;
                        let historyTime = historyData.dateTime;
                        // 從redis拿出的時間再切割 只顯示 月-日 時:分:秒
                        historyTime = historyTime.substring(5,historyTime.length-3);
                        li.innerHTML = showMsg;
                        // 多插入發言名稱 ＋時間
                        nameLi.innerHTML = fixedSender + "  " + historyTime;
                        ul.appendChild(nameLi);
                        ul.appendChild(div);
                    }
                    messagesArea.scrollTop = messagesArea.scrollHeight;
                // 在寫入後端，同時傳給對象跟自己
                } else if ("chat" === jsonObj.type) {
                    var li = document.createElement('li');
                    let nameLi = document.createElement('li');
                    var div = document.createElement('div');
                    div.appendChild(li);
                    let sender = jsonObj.sender;
                    let receiver = jsonObj.receiver;
                    // TODO 接收到訊息時 顏色變更
                    let getMesageColor = "#f55454"
                    chatIcon.style.backgroundColor = getMesageColor;
                    console.log(jsonObj);
                    if (self_chat != receiver && self_chat != sender){
                        return;
                    }
                    let talkToName = document.getElementById("statusOutput").textContent;
                    if (talkToName != sender && talkToName != receiver){
                        return;
                    }


                    sender === self_chat ? div.className +='me_div' : div.className += 'friend_div';
                    sender === self_chat ? li.className += 'me' : li.className += 'friend';
                    sender === self_chat ? nameLi.className += 'me_div' : nameLi.className += 'friend_div';
                    li.innerHTML = jsonObj.message;

                    nameLi.innerHTML = jsonObj.sender + "  " + dateTimeNow;
                    document.getElementById("area").appendChild(nameLi);
                    document.getElementById("area").appendChild(div);
                    messagesArea.scrollTop = messagesArea.scrollHeight;
                // 再斷線的時候，從別人好友列表移除
                } else if ("close" === jsonObj.type) {
                    refreshFriendList(jsonObj);
                }

            };

        }

        function appendEmpIdToReceiver(originNameList, friend){
            console.log(originNameList);
            let friendNameArr = friend.split("_");
            let uLength = friendNameArr.length;
            if(uLength == 2 && friendNameArr[0] == "Master"){
                for(let originEmpName of originNameList){
                    if(originEmpName.includes(friendNameArr[1])){
                        return originEmpName;
                    }
                }
            }
            return friend;
        }

        chatIcon.addEventListener('click', () => {
            chatContainer.style.display = 'block';
        });

        closeChatButton.addEventListener('click', closeChat);

        friendList.forEach((friend) => {
            friend.addEventListener('click', () => {
                friendList.forEach((f) => f.classList.remove('active'));
                friend.classList.add('active');
                chatHeader.textContent = `Chat with ${friend.textContent}`;
            });
        });

        // 把視窗縮小
        function closeChat() {
            if (chatContainer.style.display == 'none') {
                chatContainer.style.display = 'flex';
            } else {
                chatContainer.style.display = 'none';
            }
        }

        // 發送訊息
        function sendMessage() {
            var inputMessage = document.getElementById("message");
            var friend = statusOutput.textContent;
            var message = inputMessage.value.trim();
            console.log("sendMessage: "+ message);
            if (message === "") {
                alert("Input a message");
                inputMessage.focus();
            } else if (friend === "") {
                alert("Choose a friend");
            } else {
                var jsonObj = {
                    "type": "chat",
                    "sender": self_chat,
                    "receiver": friend,
                    "message": message,
                    "dateTime": dateTimeNowToBackend
                };
                webSocket.send(JSON.stringify(jsonObj));
                inputMessage.value = "";
                inputMessage.focus();
            }
        }

        // 有好友上線或離線就更新列表
        function refreshFriendList(jsonObj) {
            var friends = jsonObj.users;
            var row_chat = document.getElementById("row_chat");
            let friendPic;
            row_chat.innerHTML = '';
            for (var i = 0; i < friends.length; i++) {
                if (friends[i] === self_chat  || "Master_" === friends[i].substring(0,7)) {
                     continue;
                }
                // 取得好友列表名稱與圖片
                getMyPic(friends[i]);
                // // 等待一秒后执行的代码
                setTimeout(function() {
                }, 1000); // 1000 毫秒等于 1 秒
            }
            addListener();
        }
        // 註冊列表點擊事件並抓取好友名字以取得歷史訊息（推送給後端onMessage)
        function addListener() {
            var container = document.getElementById("row_chat");
            container.addEventListener("click", function (e) {
                var friend = e.srcElement.textContent;
                updateFriendName(friend);
                var jsonObj = {
                    "type": "history",
                    "sender": self_chat,
                    "receiver": friend,
                    "message": ""
                };
                webSocket.send(JSON.stringify(jsonObj));
            });
        }
        // 更新statusOutput 標籤內容
        function updateFriendName(name) {
            statusOutput.innerHTML = name;
        }
        // fetch請求後端
        function getMyPic(friendEmpId){
            let data = {"empId":friendEmpId};
            let url = "/diyla_back/emp/getChatPic";
            fetch(url, {
                body: JSON.stringify(data),
                headers: {
                            'user-agent': 'Mozilla/4.0 MDN Exam',
                            'content-type': 'application/json'
                        },
                        mode: 'no-cors', // no-cors, cors,
                method: 'POST'
            })
            .then(res => res.json()) // 把回傳的JSON字串取回，放在promise物件中回傳


            .then(function (res) { //一樣有then
                let empIdObj = res.EMP_PIC;
                // let empName = "Master_"+res.empName;
                let empName = res.empId;
                let picData = arrayBufferToBase64(empIdObj);
                let temp =  `<img class="friendImg" src="data: image/jpeg;base64,` + picData + `">`;
                var row_chat = document.getElementById("row_chat");
                let count = 0;
                // 把返回來的圖片直接放入好友列表
                if(empIdObj != null || empIdObj == ''){
                    row_chat.innerHTML += '<div id=' + count++ + ' class="column" name="friendName" value=' + empName + ' ><div class="friendIng-div">'+temp +'<p class="friendName">' +empName + '</p></div></div>';
                } else {
                    row_chat.innerHTML += '<div id=' + count++ + ' class="column" name="friendName" value=' + empName + ' ><div class="friendIng-div"><p class="friendName">' +empName + '</p></div></div>';
                }
            })
            .catch(function (error) {
                console.log(error)
            })
        }

    </script>
</body>

</html>