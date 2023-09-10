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
            flex-grow: 1;
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
        /* .friend.div{
            text-align: right; /* 将文本容器内的内容靠右 
        } */
        /* 删除列表项的标记 */
        ul {
        list-style-type: none;
        }
        #row{
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
        ul#area{
            padding: inherit;
        }
    </style>
</head>

<body>
    <div id="chatIcon" onclick="closeChat()">Chat</div>
    <div id="chatContainer" style="display: none;">
        <div id="closeChat" onclick="closeChat()">-</div>

        <div id="friendList">
            <span>Talk to : </span><div id="statusOutput" class="statusOutput"></div>
            <!-- 好友列表產在這裡 -->
            <hr>
        <div id="row"></div>
        </div>
        <div id="activeChat">
            <div id="chatHeader" onclick="closeChat()">Chat Room</div>
            <div id="messagesArea" class="panel message-area"></div>
            <!-- 對話動態產生在這裡 -->
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
        const activeChat = document.getElementById('activeChat');
        const chatInput = document.getElementById('message');
        const sendButton = document.getElementById('sendButton');
        let date = new Date();
        let dateTimeNow = formatDate(date, 'MM-dd HH:mm');
        let dateTimeNowToBackend = formatDate(date, 'yyyy-MM-dd HH:mm:ss');


        let MyPoint = "/chat/${memVO.memName}";
        let host_chat = window.location.host;
        let domain = host_chat.split(":")[0];
        let port = '8082';
        let webCtx_chat = "/diyla_back";
        let endPointURL_chat = "ws://" + domain + ":" +port + webCtx_chat + MyPoint;
        let backendServer_chat = "http://" + domain + ":" +port + webCtx_chat;

        let statusOutput = document.getElementById("statusOutput");
        let messagesArea = document.getElementById("messagesArea");
        // 可替換成名稱
        let self_chat = '${memVO.memName}';
        let webSocket_chat;


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

        // 開啟網頁就建立連線
        window.onload(webSocketOnloadConnect());
        function webSocketOnloadConnect() {
            console.log(self_chat); 
            webSocket_chat = new WebSocket(endPointURL_chat);
            webSocket_chat.onopen = function (event) {
                console.log("connect success!");
            };

            // 收到訊息
            webSocket_chat.onmessage = function (event) {
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
                        
                        // 接收到訊息時 顏色變更
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
                } else if ("chat" === jsonObj.type) {
                    let fixedSender = jsonObj.sender;
                    let receiver = jsonObj.receiver;
                    var li = document.createElement('li');
                    let nameLi = document.createElement('li');
                    var div = document.createElement('div');
                    div.appendChild(li);
                    
                    // 接收到訊息時 顏色變更
                    let getMesageColor = "#f55454"
                    chatIcon.style.backgroundColor = getMesageColor;
                    if (self_chat != receiver && self_chat != fixedSender){
                        return;
                    }
                    let talkToName = document.getElementById("statusOutput").textContent;
                    if (talkToName != fixedSender && talkToName != receiver){
                        return;
                    }


                    fixedSender === self_chat ? div.className +='me_div' : div.className += 'friend_div';
                    fixedSender === self_chat ? li.className += 'me' : li.className += 'friend';
                    fixedSender === self_chat ? nameLi.className += 'me_div' : nameLi.className += 'friend_div';
                    li.innerHTML = jsonObj.message;
                    nameLi.innerHTML = fixedSender + "  " + dateTimeNow;
                    document.getElementById("area").appendChild(nameLi);
                    document.getElementById("area").appendChild(div);
                    messagesArea.scrollTop = messagesArea.scrollHeight;
                } else if ("close" === jsonObj.type) {
                    refreshFriendList(jsonObj);
                }

            };

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
                // 把empId 插入即可
                if("" == friend){
                    return;
                }
                var jsonObj = {
                    "type": "chat",
                    "sender": self_chat,
                    "receiver": friend,
                    "message": message,
                    "dateTime": dateTimeNowToBackend
                };
                webSocket_chat.send(JSON.stringify(jsonObj));
                inputMessage.value = "";
                inputMessage.focus();
            }
        }

        // 有好友上線或離線就更新列表
        function refreshFriendList(jsonObj) {
            var friends = jsonObj.users;
            var row = document.getElementById("row");
            let friendPic;
            row.innerHTML = '';
            for (var i = 0; i < friends.length; i++) {
                let root = friends[i].split("_")[1];
                if (friends[i] === self_chat || root == 1) { continue; }
                // 請求後端拿回好友列表名稱及圖片（只有管理者有圖片）
                getMyPic(friends[i]);
                // // 等待一秒后执行的代码
                setTimeout(function() {
                }, 1000); // 1000 毫秒等于 1 秒
            }
            addListener();
        }

        // 註冊列表點擊事件並抓取好友名字以取得歷史訊息
        function addListener() {
            var container = document.getElementById("row");
            container.addEventListener("click", function (e) {
                var friend = e.srcElement.textContent;
                updateFriendName(friend);
                var jsonObj = {
                    "type": "history",
                    "sender": self_chat,
                    "receiver": friend,
                    "message": ""
                };
                webSocket_chat.send(JSON.stringify(jsonObj));
            });
        }
        // 更新好友列表
        function updateFriendName(name) {
            statusOutput.innerHTML = name;
        }
        function getMyPic(friendMemId){

            if("Master_" != friendMemId.substring(0,7)){
                return;
            }

            let data = {"empId":friendMemId};
            let url = backendServer_chat+"/emp/getChatPic";
            fetch(url, {
                body: JSON.stringify(data),
                headers: {
                            'user-agent': 'Mozilla/4.0 MDN Exam',
                            'content-type': 'application/json'
                        },
                method: 'POST',
                // cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
                // credentials: 'include', // include, same-origin, *omit
                // mode: 'no-cors', // no-cors, cors, * same-origin
                // redirect: 'follow', // manual, *follow, error
                // referrer: 'no-referrer' // *client, no-referrer
            })
            .then(res => res.json()) // 把回傳的JSON字串取回，放在promise物件中回傳
            
            .then(function (res) { //一樣有then
                let memIdObj = res.EMP_PIC;
                let memId = res.EMP_ID;
                let memName = res.EMP_NAME;
                console.log("memIdObj : "+memIdObj +" , memId : "+ memId +" , memName : "+memName);
                let picData = arrayBufferToBase64(memIdObj);
                let temp =  `<img class="friendImg" src="data: image/jpeg;base64,` + picData + `">`;
                var row = document.getElementById("row");
                let count = 0;
                // 把返回來的圖片直接放入好友列表
                if(memIdObj != null || memIdObj == ''){
                    row.innerHTML += '<div id=' + count++ + ' class="column" name="friendName" value=' + "Master_"+ memId +"_"+ memName + ' ><div class="friendIng-div">'+temp +'<p class="friendName">' + "Master_"+memId+"_<br>"+ memName + '</p></div></div>';
                } else {
                    row.innerHTML += '<div id=' + count++ + ' class="column" name="friendName" value=' + memName + ' ><div class="friendIng-div"><p class="friendName">' +memName + '</p></div></div>';
                }
            })
            .catch(function (error) {
                console.log(error)
            })
        }
    </script>
</body>

</html>