INSERT INTO MEMBER(MEM_NAME, MEM_EMAIL, MEM_PASSWORD, MEM_PHONE,
                   MEM_BIRTHDAY, MEM_GENDER, MEM_ADDRESS, MEM_DATE)
VALUES ('apache', 'app@diyla.com', 'api123456', '0900111222', '2004-12-31', '0', '台北市信義區信義路五段7號89樓',
        '2021-4-1'),
       ('blob', 'border@diyla.com', 'b654321', '0900222333', '1997-12-9', '1', '桃園市中壢區復興路46號9樓之805',
        '2020-5-5'),
       ('const', 'chatgpt@diyla.com', '123c456', '0912333444', '1980-3-10', '1', '臺中市清水區美堤街8號', '2020-02-29'),
       ('david', 'doget@diyla.com', '098765d', '0955888999', '1950-6-30', '0', '花蓮縣壽豐鄉福德189號', '2022-12-31'),
       ('exception', 'error@diyla.com', '3456e78', '0977888666', '1977-9-3', '0', '屏東縣鹽埔鄉仕絨村東平街25號',
        '2023-4-4');


INSERT INTO diyla.commodity_class (COM_CLASS_NAME)
VALUES ('烘焙器材'),
       ('食材原料'),
       ('精緻點心');


INSERT INTO diyla.commodity (COM_CLASS_NO, COM_NAME, COM_PIC, COM_DES, COM_PRI, COM_QUA, COM_STATE, COMMENT_TOTAL,
                             RATING_SUM, UPDATE_TIME)
VALUES (1, '擀麵棍', null, '取材等級最高的A級櫸木,竹木紋理完全保留,木製品的美也源於此。麵粉不容易沾黏，桿麵團超便利！',
        150, 50, 1, 0, 0, DEFAULT),
       (1, '隔熱手套(單支)', null, '多彩微波爐手套，特製防滑硅膠，隔熱防滑。精選面料，經久耐用，牢固度高。', 50, 100, 1, 0, 0,
        DEFAULT),

       (1, '電動打蛋機', null,
        '七段變速，甜點、副食品等DIY輕鬆搞定！30秒迅速打發蛋白！機身輕巧，力氣較小的女生也可以輕鬆操作！', 250, 30, 1, 0, 0,
        DEFAULT),
       (1, '8吋派模', null, '氣炸鍋可用，耐磨、受熱均勻！表面不沾塗層，更好脫模！', 100, 50, 1, 0, 0, DEFAULT),

       (2, '肉桂棒50克', null, '本產品經檢驗合格，無農藥殘留。取自接近樹幹中心的樹皮所製成的品質上等肉桂。', 60, 20, 1, 0,
        0, DEFAULT),

       (2, '無鹽奶油300克', null,
        '純淨天然，絕無人工添加，新鮮的乳香味，爽口不油膩，溶點溫度低於體溫，入口即化，操作性更佳。',
        150, 30, 1, 0, 0, DEFAULT),

       (2, '細砂糖1公斤', null, '除了可產生梅納反應，上色等優點，對於食材也有保濕的功能。', 45, 50, 1, 0, 0, DEFAULT),

       (2, '低筋麵粉1公斤', null, '適用於精緻蛋糕、高級餅乾、高級西點和菓子。無添加任何漂白劑、防腐劑及其他添加物。', 50, 50,
        1, 0, 0, DEFAULT),

       (3, '可頌5入', null,
        '使用原裝進口的奶油精心調製而成，使用方便，不需發酵只要稍加解凍、復熱即可享用。酥脆表皮、Q軟內部組織、濃郁的奶油香，讓人垂涎欲滴。刷上楓糖漿成楓糖牛角、沾上巧克力成巧克力牛角、剖開夾入喜愛的餡料成美味的牛角堡等等，千變萬化，隨心所欲，正餐、午茶、點心皆適宜。 ',
        100, 15, 1, 0, 0, DEFAULT),

       (3, '手工曲奇餅乾280克', null,
        '嚴選頂級天然奶油、小麥麵粉、國產新鮮殺菌雞蛋，絕無添加任何防腐劑及人工香料。午茶點心必備！', 170, 15, 1, 0, 0,
        DEFAULT),

       (3, '布朗尼', null, '綿密鬆軟的布朗尼搭配香甜巧克力，吃起來甜而不膩。', 25, 20, 1, 0, 0, DEFAULT),

       (3, '年輪蛋糕', null, '手工慢火烘製，口感紮實綿密。', 35, 30, 1, 0, 0, DEFAULT);


INSERT INTO diyla.commodity_order (MEM_ID, ORDER_TIME, ORDER_STATUS, ORDER_PRICE, DISCOUNT_PRICE, ACTUAL_PRICE,
 UPDATE_TIME,RECIPIENT,RECIPIENT_ADDRESS,PHONE)

VALUES (1, DEFAULT, 3, 85, 0, 85, DEFAULT,'老爹',0987654321,'南方公園'),

       (2, DEFAULT, 2, 400, 0, 400, DEFAULT,'大頭',0987654321,'南方公園'),

       (3, DEFAULT, 2, 295, 0, 295, DEFAULT,'凱子',0987654321,'南方公園');

INSERT INTO diyla.commodity_order_detail (ORDER_NO, COM_NO, COM_QUANTITY, COM_PRICE)
VALUES (1, 11, 2, 25),

       (1, 12, 1, 35),

       (2, 3, 1, 250),

       (2, 6, 1, 150),

       (3, 7, 1, 45),

       (3, 8, 1, 50),

       (3, 9, 1, 100);

INSERT INTO diyla.commodity_comment (COM_NO, MEM_ID, RATING, COM_CONTENT, COM_TIME)
VALUES (11, 1, 5, '超級好吃', DEFAULT);


INSERT INTO LATESTNEWS (NEWS_CONTEXT)
VALUES ("【甜點DIY公告】
親愛的顧客們，

我們很高興宣佈將於本月底推出一系列有趣又美味的甜點DIY活動！這是一個難得的機會，讓您在家中也能享受親手製作精緻甜點的樂趣。請務必細讀以下詳情，並記得預約您心儀的DIY體驗。

活動日期：每週六和週日，從本月底開始，共持續四週

活動時間：上午10點至下午4點

地點：我們位於市中心的甜點工作坊

活動內容：

了解甜點製作的基本技巧：我們的專業師傅將向您展示製作各種甜點的基本步驟，從麵團的製作到烘焙、裝飾等細節。

DIY甜點體驗：您將有機會親手製作多種美味的甜點，包括香濃巧克力蛋糕、口感鬆軟的香草杯子蛋糕、多層次的水果塔等等。無需經驗，適合初學者和家庭參與。

專業指導：我們的甜點師傅將在整個DIY過程中全程指導，並分享一些秘訣，讓您的甜點更加完美。

交流和分享：在活動中，您將有機會認識其他喜歡甜點的朋友，一同分享您的烘焙心得和美味作品。

費用：
每人參與費用：650元（包括所有食材和材料）

預約方式：
請提前致電我們的客服中心，預約您想參加的日期。由於名額有限，請盡早預訂以確保您的位置。

備註：

本活動歡迎所有年齡層的人士參與，兒童必須由家長或監護人陪同參加。
請穿著舒適的衣物和防滑鞋，以確保您在工作坊中的安全。
我們期待著與您一同度過愉快的甜點DIY時光！讓我們一起創造美味與甜蜜的回憶。

感謝您的支持！

DIYLA");

INSERT INTO COMMONPROBLEM (PBM_SORT, PBM_TITLE, PBM_CONTEXT)
VALUES (1, '我沒有烘焙經驗，可以參加甜點DIY嗎？',
        '當然可以！我們的甜點DIY活動歡迎所有年齡層的人士參與，不需要任何烘焙經驗。我們的專業師傅將會在活動中向您展示製作甜點的基本步驟，並在整個過程中提供指導。您只需要帶著好奇心和熱情參與，一起體驗製作美味甜點的樂趣！'),
       (1, '我是否需要攜帶任何工具或材料？',
        '不用擔心，我們會為您準備所有的食材和所需的工具。您只需攜帶好心情前來參加活動即可。在DIY過程中，我們將提供您所需要的所有材料，讓您能夠順利完成美味的甜點。'),
       (3, '我可以攜帶孩子一同參加嗎？',
        '當然可以！我們歡迎家庭一同參加甜點DIY活動。您的孩子將有機會親自參與製作甜點，並在專業師傅的指導下學習烘焙技巧。請注意，兒童必須由家長或監護人陪同參與。');

INSERT INTO ARTICLE (ART_TITLE, ART_CONTEXT, MEM_ID)
VALUES ('台科大學生白飯之亂', '「白飯之亂」席捲全台！日前由北科大學生與熱炒店所引起的「白飯之亂」持續發酵，如今也成為影響餐飲業的議題。例如原本提供續飯續醬服務的咖哩飯「小灶咖」近期就宣佈，「可續飯續醬是出於好意，不代表本店有義務提供讓大家吃到飽」。另外也有網友透露，公司附近的熱炒店在事件之後，已將免費供應的白飯調整為「1碗10元」。

引發全台熱議的「白飯之亂」，衍生出一系列的討論話題，包括「白飯吃到飽的文字遊戲」、「學生的同理心」、「熱炒店的營利」等等內容，各方人馬各執一詞。然而在此風氣下，也開始有店家發布聲明，避免未來產生消費爭議。

位於台北公館商圈的人氣咖哩店「小灶咖」近日就宣佈「可續飯續醬是出於好意，不代表本店有義務提供讓大家吃到飽」。聲明中也解釋，當初提供續飯續醬本意，是擔心一般學生沒吃飽，但本店沒有義務無限制的供應白飯跟咖哩醬，這些都是成本而且負擔並不小，尤其現在通膨很嚴重，小店真的很難經營，未來還是會提供續飯續醬，但會以現場狀況為主。業者也表示，如果因為這樣的聲明造成不快，請可以不用來本店消費，避免引發兩造不愉快。

除此之外，在爆料公社app中的「匿名公社」，也有網友表示，公司附近的快炒店原本是免費供應白飯，如今老闆看到白飯事件後，如今改為一碗10元。另外隨著近年物價高漲，也有原本免費供應白飯的熱炒店、餐廳已調整店內的營運模式，需額外付費才能享用白飯。例如連鎖的大埔鐵板燒，即是在數年前將免費白飯調整成10元。',
        1);

INSERT INTO ARTICLE_MESSAGE (MSG_CONTEXT, MEM_ID, ART_NO)
VALUES ('好扯喔，大學生竟然為了吃到飽去刷一間店一星負評，
現在小孩越來越難教了，台灣要亡國了', 3, 1);

INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個人留言就為了刷流量，內容有夠主觀，爛死了', 1, 1);

INSERT INTO TOKEN (TOKEN_COUNT, TOKEN_GETUSE, MEM_ID)
values (10, 0, 1),
       (13, 0, 2),
       (5, 0, 3),
       (6, 0, 4),
       (7, 0, 5),
       (-5, 3, 1),
       (-3, 3, 2);

INSERT INTO diy_cate ( DIY_NAME, DIY_STATUS, DIY_CATE_NAME, ITEM_DETAILS, AMOUNT)
VALUES ('乳酪蛋糕', 0, 3, '我是乳酪蛋糕', 700),
       ('超大麵包', 0, 0, '我是大麵包', 450),
       ('巧克力蛋糕', 0, 1, '巧克力做成的蛋糕', 600),
       ('芒果蛋糕', 0, 1, '芒果做成的蛋糕', 550),
       ('巧克力餅乾', 0, 0, '巧克力做成的餅乾', 450),
       ('草莓蛋糕', 0, 1, '草莓做成的蛋糕', 790),
       ('芒果泡芙', 1, 0, '芒果做成的泡芙', 660);

INSERT INTO diy_order (MEM_ID, DIY_NO, CONTACT_PERSON, CONTACT_PHONE, RESERVATION_NUM, DIY_PERIOD, DIY_RESERVE_DATE,
                       CREATE_TIME, RESERVATION_STATUS, PAYMENT_STATUS, DIY_PRICE)
VALUES (1, 1, 'David', '0978127324', 4, 0, '2023-08-04', '2023-06-04', 0, 0, 580),
       (2, 2, 'Lucy', '0931344182', 4, 1, '2023-08-06', '2023-07-04', 0, 0, 1080);


INSERT INTO DIY_FORUM(MEM_ID, DIY_NO, ARTI_CONT, DIY_GRA, CREATE_TIME)
VALUES (4, 4, '我覺得超級好玩', 5, DEFAULT),
       (4, 4, '專題好累', 3, DEFAULT),
       (4, 4, '為了專題做蛋糕', 2, DEFAULT),
       (4, 4, '買85度C回家吃實在', 1, DEFAULT),
       (4, 4, '希望做完蛋糕能追到妹仔 讚讚讚 下次還要來', 5, DEFAULT);


INSERT INTO DIY_RESERVE_RESULT( DIY_RESERVE_DATE, DIY_PERIOD, PEO_COUNT
                              , RESERVE_STATUS, RESERVE_UPD_TIME, PEO_LIMIT, ITEM_QUANTITY)
VALUES ('2023-05-31', 0, 4, 0, default, 30, 20),
       ('2023-03-29', 2, 2, 1, default, 30, 20),
       ('2023-04-03', 1, 1, default, default, 30, 20),
       ('2023-05-31', 2, 4, default, default, 30, 20),
       ('2023-05-29', 1, 3, default, default, 30, 20);
INSERT INTO ING_STORAGE( BRAND, ING_NUMS, ING_NAME
                       , `STATUS`, SERVING_SIZE)
    VALUE ('A牌', 2000, '蛋白液', '0', '80'),
    ('B牌', 3300, '香料', '0', '10'),
    ('C牌', 3000, '麵粉', '0', '500'),
    ('D牌', 1800, '芒果', '0', '300');

INSERT INTO DIY_ING(DIY_NO, ING_ID, ING_COUNT)
    VALUE ('7', '1', '80'),
    ('7', '3', '500'),
    ('7', '4', '300');

INSERT INTO EMPLOYEE (EMP_NAME,EMP_ACCOUNT,EMP_PASSWORD,EMP_EMAIL,EMP_STATUS)
VALUES ('女王','Root','tibame515','while8@gmail.com','1'),
('襪襪是廚師', 'D100002', 'seefood', 'seefood@yahoo.tw', '1'),
('襪襪是隻貓', 'D100003', 'meowmeow', 'meowmeow@gmail.com', '1'),
('襪襪吃肉泥', 'D100004', 'eatmeat', 'eatmeat@gmail.com', '1'),
('襪襪睡覺覺', 'D100005', 'sleep666', 'sleep666@gmail.com', '1'),
('襪襪出去玩', 'D100006', 'outdoor', 'outdoor@msn.com', '1'),
('襪襪裝起來', 'D100007', 'bagmeow', 'bagmeow@yahoo.com', '1');


INSERT INTO BACKSTAGE_FUN (AUTH_ID,AUTH_FUN,TYPE_FUN)
VALUES ('1','商品訂單管理','SHOP'),
('2','商品管理','SHOP'),
('3','DIY類別設定','CLASS'),
('4','DIY訂單管理','CLASS'),
('5','甜點課程訂單管理','MASTER'),
('6','師傅資料管理','MASTER'),
('7','回覆聊天室訊息','MASTER'),
('8','甜點課程管理','MASTER'),
('9','會員帳號管理','MEMADMIN'),
('10','黑名單管理','MEMADMIN'),
('11','食材管理','STORADMIN'),
('12','進貨管理','STORADMIN'),
('13','常見問題管理','CUSTORSERVICE'),
('14','帖子討論區管理','CUSTORSERVICE'),
('15','後台帳號管理','BACKADMIN');

INSERT INTO BACKSTAGE_AUTH(EMP_ID,AUTH_ID)
VALUES
('1','1'),
('1','2'),
('1','3'),
('1','4'),
('1','5'),
('1','6'),
('1','7'),
('1','8'),
('1','9'),
('1','10'),
('1','11'),
('1','12'),
('1','13'),
('1','14'),
('1','15');



INSERT INTO NOTICE(MEM_ID, NOTICE_TITLE, NOTICE_TIME)
VALUES (1, '您的留言因受到檢舉並審核通過，提醒您若受到檢舉三次將只能瀏覽文章。',
        '2021-4-2 22:59:30'),
       (2, '您因多次受到檢舉已進入黑名單，無法再使用該功能。','2021-4-2 22:59:30'),
       (3, '您的文章有一個新留言，快來看看吧～',
        '2020-3-1 02:03:04'),
       (4, '您的文章有一個新留言，快來看看吧～',
        '2023-3-30 18:05:59'),
       (5, '您的留言因受到檢舉並審核通過，提醒您若受到檢舉三次將只能瀏覽文章。',
        '2023-7-7 07:07:07');


INSERT INTO CHATROOM(MEM_ID, TEA_ID, CHAT_TIME, CHAT_CONTEXT, CHAT_DIR)
VALUES (1, 5, '2023-7-26 13:20:45',
        '您好！我特別喜歡法式甜點。看到老師也有開關於法式甜點的課程很感興趣，不知道如果想要請老師規劃客製化課程要提供什麼資訊',
        1),
       (2, 4, '2023-7-15 03:20:45',
        '我設計了一堂包含製作克里姆布蓋和馬卡龍的課程計畫。這些甜點都有不同的製作技巧，從麵團的製作到烤焙都會涵蓋哦', 0),
       (3, 1, '2022-6-20 02:02:02', '考慮過後還是覺得算了，不好意思', 1),
       (4, 2, '2021-12-31 01:02:03',
        '想要做一個蛋糕可以帶來新年新氣象，同時展現台灣煙火文化又有新年傳統的寓意，老師您有辦法嗎', 1),
       (5, 1, '2020-01-01 22:22:22', '夢裡什麼都有哦', 0);
INSERT INTO diyla.teacher (`TEA_ID`, `EMP_ID`, `TEA_NAME`, `TEA_GENDER`, `TEA_PHONE`, `TEA_INTRO`, `TEA_EMAIL`, `TEA_STATUS`) VALUES ('1', '1', '無詠致', '0', '0988772332', '多年的Java糕點經驗,具有多張烘焙執照,想做出好甜點找他就對了', 'wuyuanzi@gmail.com', '0');
INSERT INTO diyla.speciality(`SPE_ID`, `SPE_NAME`) VALUES ('1', '烘焙丙級'), ('2', '烘焙乙級'), ('3', '烘焙甲級');
INSERT INTO diyla.tea_speciality(`TEA_ID`, `SPE_ID`) VALUES ('1', '3');
INSERT INTO diyla.class(`CLASS_ID`, `CATEGORY`, `TEA_ID`, `REG_END_TIME`, `CLASS_DATE`, `CLASS_SEQ`, `LIMIT`, `PRICE`, `INTRO`, `CLASS_NAME`, `HEADCOUNT`, `CLASS_STATUS`) VALUES
('1', '1', '1', '2023-07-30 12:00:00','2023-08-01', '0', '5', '1500', '或許各位都有在店面看過輕乳酪蛋糕或重乳酪蛋糕,那箇中差異為何?以及能夠變化出什麼花樣呢?想知道的話就來上課吧!
目前課程價格只要: 1300元喔!', '起司蛋糕詳解課程', '3', '1' ),
('2', '3', '1', '2023-07-31 12:00:00','2023-08-02', '0', '5', '1000', '相信大家都有吃過軟或硬的法國麵包,此課程詳細說明法國麵包的作法,讓你做出屬於自己的法國麵包
目前課程價格只要: 1200元喔!','法國麵包課程', '2', '1' );
INSERT INTO diyla.class_reserve(`RESERVE_ID`, `CLASS_ID`, `MEM_ID`, `HEADCOUNT`,`STATUS`, `CREATE_TIME`, `TOTAL_PRICE`) VALUES ('1', '1', '1', '3', '0',CURRENT_TIMESTAMP, '4500');
INSERT INTO diyla.ing_storage(`ING_ID`, `BRAND`, `ING_NUMS`, `ING_NAME`, `STATUS`, `SERVING_SIZE`) VALUES
('1', '安佳', '4500', '奶油', '0', '45'),
('2','台糖','50000', '砂糖', '0','500'),
('3', '四方', '60000', '鮮奶', '0', '1000'),
('4', '聯華', '0', '高筋麵粉', '1', '10000'),
('5', '日正食品', '100000', '高筋麵粉', '0', '1000'),
('6', '日正食品', '100000', '中筋麵粉', '0', '1000'),
('7', '日正食品', '50000', '低筋麵粉', '0', '1000'),
('8', '安佳', '50000', '鮮奶油', '0', '1000'),
('9', '石安牧場', '6000', '雞蛋', '0', '60'),
('10', '得福', '1000', '吉利丁片','0', '50'),
('11', '菲力', '5000', '鮮奶油乳酪', '0', '250');
INSERT INTO diyla.class_ing(`CLASS_ID`, `ING_ID`, `ING_NUMS`) VALUES
('1','11', '250'),
('1','8', '125'),
('1','9', '180'),
('1','2', '60'),
('1','7', '10');




