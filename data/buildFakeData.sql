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
INSERT INTO MEMBER(MEM_NAME, MEM_EMAIL, MEM_PASSWORD, MEM_PHONE,
                   MEM_BIRTHDAY, MEM_GENDER, MEM_ADDRESS, MEM_DATE,MEM_STATUS)
VALUES ('淑君', '1021234243@nkust.edu.tw', '123456', '0900111222', '1970-01-01', '0', '澎湖縣馬公市石泉1之31','2021-4-1','1');



INSERT INTO diyla.commodity_class (COM_CLASS_NAME)
VALUES ('烘焙器材'),
       ('食材原料'),
       ('精緻點心');


INSERT INTO diyla.commodity (COM_CLASS_NO, COM_NAME, COM_PIC, COM_DES, COM_PRI, COM_QUA, COM_STATE, COMMENT_TOTAL,
                             RATING_SUM, UPDATE_TIME)
VALUES (1, '桿麵棍', null, '取材等級最高的A級櫸木，竹木紋理完全保留，木製品的美也源於此。麵粉不容易沾黏，桿麵團超便利！',
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
                                   UPDATE_TIME, RECIPIENT, RECIPIENT_ADDRESS, PHONE)

VALUES (1, DEFAULT, 3, 85, 0, 85, DEFAULT, '老爹', '南方公園', '0987654321'),

       (2, DEFAULT, 2, 400, 0, 400, DEFAULT, '大頭', '南方公園', '0987654321'),

       (3, DEFAULT, 2, 295, 0, 295, DEFAULT, '凱子', '南方公園', '0987654321'),
       (6, DEFAULT, 2, 295, 0, 295, DEFAULT, '凱子', '南方公園', '0987654321');

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
INSERT INTO diyla.commodity_comment (COM_NO, MEM_ID, RATING, COM_CONTENT, COM_TIME)
VALUES (1, 2, 5, '讚', DEFAULT),
    (2, 2, 5, '讚', DEFAULT),
    (3, 2, 5, '讚', DEFAULT),
    (4, 2, 5, '讚', DEFAULT),
    (5, 2, 5, '讚', DEFAULT),
    (6, 2, 5, '讚', DEFAULT),
    (7, 2, 5, '讚', DEFAULT),
    (8, 2, 5, '讚', DEFAULT),
    (9, 2, 5, '讚', DEFAULT),
    (10, 2, 5, '讚', DEFAULT),
    (11, 2, 5, '讚', DEFAULT),
    (12, 2, 5, '讚', DEFAULT),
    (1, 1, 5, '超好用', DEFAULT),
    (1, 3, 1, '不推', DEFAULT),
    (1, 4, 4, '有點貴', DEFAULT);


INSERT INTO LATESTNEWS (NEWS_CONTEXT, ANN_STATUS)
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

DIYLA", '1'),
       ("【美味烘焙工坊即將開幕】

親愛的顧客們，

我們非常興奮地宣佈，即將於本月底正式開放我們全新的美味烘焙工坊！這個烘焙工坊將是您探索烹飪藝術和烘焙技巧的理想場所。以下是詳細資訊：

工坊開放日期：從本月底開始，每週六和週日持續四週。

活動時間：上午10點至下午4點。

地點：我們位於市中心的烘焙工坊，地址將在預約確認信中提供。

工坊內容：

基礎烘焙技巧學習：由我們的烘焙專家帶領，學習從頭開始製作美味糕點和麵包的基本技巧。從麵團製作到烘焙，一切都在這裡學！

DIY烘焙體驗：親手製作各種令人垂涎的糕點，包括新鮮的法國麵包、巧克力慕斯蛋糕、迷你果醬派等等。無論您是新手還是有經驗的廚師，都歡迎參加！

專業指導：我們的烘焙專家將在整個DIY過程中提供專業指導，並分享寶貴的秘訣，以確保您的烘焙成果完美無缺。

烘焙社群交流：在工坊中，您將有機會認識其他烘焙愛好者，一同分享您的烘焙心得和美味創作。一個充滿烘焙熱情的社群等著您！

費用：每位參與者僅需支付750元，費用包括所有食材和材料。

預約方式：由於名額有限，請提前致電我們的客服中心，預約您心儀的日期。請注意，兒童參與時必須由家長或監護人陪同。

備註：

請穿著舒適的衣物和防滑鞋，以確保您在工坊中的安全。
我們將提供所有所需的烘焙用具，您只需帶著熱情和好奇心來！
我們迫不及待地期待與您一同度過美味的烘焙時光，一起探索烘焙的奧秘！

感謝您的支持！

DIYLA 敬上", '1');

INSERT INTO COMMONPROBLEM (PBM_SORT, PBM_TITLE, PBM_CONTEXT)
VALUES (1, '我沒有烘焙經驗，可以參加甜點DIY嗎？',
        '當然可以！我們的甜點DIY活動歡迎所有年齡層的人士參與，不需要任何烘焙經驗。我們的專業師傅將會在活動中向您展示製作甜點的基本步驟，並在整個過程中提供指導。您只需要帶著好奇心和熱情參與，一起體驗製作美味甜點的樂趣！'),
       (1, '我是否需要攜帶任何工具或材料？',
        '不用擔心，我們會為您準備所有的食材和所需的工具。您只需攜帶好心情前來參加活動即可。在DIY過程中，我們將提供您所需要的所有材料，讓您能夠順利完成美味的甜點。'),
       (3, '我可以攜帶孩子一同參加嗎？',
        '當然可以！我們歡迎家庭一同參加甜點DIY活動。您的孩子將有機會親自參與製作甜點，並在專業師傅的指導下學習烘焙技巧。請注意，兒童必須由家長或監護人陪同參與。'),
       (3, '我有特殊飲食需求，能在甜點DIY活動中得到滿足嗎？',
        '當然！請在報名時告知我們您的特殊飲食需求，無論是食物過敏、素食還是其他需求，我們將盡力滿足您的要求。我們的目標是確保每個參與者都能在活動中享受美味的甜點。'),
       (1, '我擁有食物過敏，該如何參加甜點DIY活動？',
        '如果您有食物過敏，請在報名時提前告知我們。我們將採取額外的措施，確保您的甜點DIY體驗安全無憂。我們會提供適合您飲食需求的替代食材，以確保您能夠參與並享受活動。'),
       (1, 'DIY甜點材料是否新鮮？',
        '是的，我們非常重視材料的新鮮度和質量。我們將為每位參與者提供新鮮的食材，確保您製作的甜點具有最佳的風味和質地。我們的食材選擇經過精心挑選，以確保最高的滿意度。'),
       (0, '我可以在課程中自己提出甜點的想法嗎？',
        '當然可以！我們鼓勵創造力和個性化。如果您有特別想製作的甜點，請在報名時或活動開始前告知我們。我們的專業師傅將盡力滿足您的需求，並指導您實現您的烘焙夢想。'),
       (1, 'DIY甜點活動是否提供外帶或外送選項？',
        '是的，我們提供外帶和外送選項，以便您在家中或其他地方享受您製作的美味甜點。如果您想要外帶或外送，請提前通知我們，我們將為您安排。額外的費用可能適用。'),
       (1, '我需要提前報名參加甜點DIY活動嗎？',
        '是的，為了確保我們為每位參與者提供最好的體驗，我們建議您提前報名。我們的活動名額有限，預約通常是先到先得。通過提前報名，您可以確保您的位置並參加您選擇的日期和時間的活動。如果您臨時決定參加，也可以嘗試現場報名，但可能受到名額限制。');
INSERT INTO ARTICLE (ART_TITLE, ART_CONTEXT, MEM_ID, ART_STATUS)
VALUES ('如何製作完美的巧克力蛋糕',
        '製作巧克力蛋糕是一門藝術，讓我們分享一些技巧和步驟，以製作一個口感濕潤、濃郁的巧克力蛋糕。首先，選擇高品質的巧克力是成功的關鍵。然後，掌握混合、烘焙和裝飾的技巧。歡迎分享您的巧克力蛋糕創作！',
        2, '2'),
       ('季節水果的甜點靈感',
        '每個季節都有不同的水果，讓我們一起探討如何將季節水果巧妙地融入各種甜點中，享受新鮮的風味！請分享您最喜歡的季節水果甜點配方。',
        4, '2'),
       ('烘焙器具的選購建議',
        '想買些新的烘焙器具，但不知道從何入手？來這裡討論和分享選購烘焙器具的經驗和建議。無論是烤箱、攪拌器還是模具，都有許多選擇需要考慮。',
        3, '2'),
       ('無糖甜點的烹飪秘訣',
        '無糖或低糖飲食的人們，一起交流如何製作美味的無糖甜點，並分享糖代替品的使用技巧。我們可以一起探討如何減少糖分，但仍保持甜點的美味。',
        1, '2'),
       ('家常甜點的風味回憶',
        '分享關於家裡傳統的家常甜點，這些食物是我們童年的回憶，讓我們一起回味！不論是媽媽的蘋果派還是奶奶的果醬餅乾，這些味道令人難以忘懷。',
        5, '2'),
       ('最愛的冰淇淋口味是什麼？','分析最愛的冰淇淋口味，並討論不同地區的獨特冰淇淋風味。無論是草莓、巧克力、還是咖啡口味，每個人都有自己的最愛。',
       2, '2'),
       ('經典與創新：傳統甜點的變革',
        '討論如何將經典的甜點配方進行創新和變革，創造出令人驚艷的新口味。有時候，加入一些新的元素可以讓經典甜點更有趣味。',
        4, '2'),
       ('最難忘的甜點體驗',
        '大家來分享自己生活中最難忘的甜點體驗，是在哪裡，品嚐了什麼特別的甜點？也許是在一次特別的旅行中，或者是在一家隱藏的小店裡。',
        1, '2'),
       ('DIY甜點的成功故事',
        '如果您曾嘗試過DIY甜點，歡迎分享您的成功故事和獨特的創作。無論是一次特殊的慶祝活動還是單純的周末娛樂，DIY甜點總是充滿樂趣。',
        3, '2'),
       ('甜點與健康的平衡','討論如何在享受美味甜點的同時，保持健康的飲食平衡，分享減糖和減脂的健康選擇。健康和美味絕不是互斥的！', 
       5, '2');

INSERT INTO ARTICLE_MESSAGE (MSG_CONTEXT, MEM_ID, ART_NO)
VALUES ('我最喜歡巧克力蛋糕了！謝謝分享製作的技巧，我一定會試試看。', 4, 2),
       ('製作巧克力蛋糕真的是一門藝術，需要仔細的步驟和高品質的巧克力。', 1, 2),
       ('這篇文章讓我口水直流，巧克力蛋糕是我的最愛！', 5, 2),
       ('季節水果真的是製作甜點的好材料，我最喜歡夏天的草莓和藍莓！', 5, 2),
       ('我也喜歡用新鮮水果來做甜點，這樣口感特別好，而且更加健康。', 1, 2),
       ('有人有季節水果甜點的食譜嗎？想嘗試一下。', 3, 2),
       ('選購烘焙器具的時候，我建議先確定你最常使用的器具，然後投資在質量較好的產品上。', 2, 3),
       ('對於烘焙器具，品質真的很重要，劣質的器具可能會影響到食物的味道和口感。', 4, 3),
       ('我通常在專業烘焙店或網站上買烘焙器具，這樣可以確保質量。', 5, 3),
       ('無糖甜點的烹飪要更有挑戰性，但經過練習後，可以做出美味又健康的甜點。', 1, 4),
       ('使用天然的糖代替品，如蜂蜜或楓糖漿，可以增加無糖甜點的風味。', 3, 4),
       ('我最近嘗試做了一個無糖蘋果派，大家有興趣我可以分享食譜。', 2, 4),
       ('家常甜點總是充滿溫馨的回憶，我最愛媽媽做的蘋果派。', 5, 5),
       ('對我來說，奶奶的果醬餅乾永遠是最美味的甜點！', 4, 5),
       ('有人可以分享自己家的家常甜點食譜嗎？', 1, 5),
       ('我最喜歡的冰淇淋口味是香草，搭配巧克力醬超級好吃！', 2, 6),
       ('我喜歡試試不同的冰淇淋口味，最近發現了榛子巧克力口味，也很美味。', 3, 6),
       ('不同地區的冰淇淋風味真的很有趣，我有次旅行時品嚐到了當地特有的口味。', 4, 6),
       ('經典甜點可以帶來懷舊的感覺，但創新甜點也有其獨特之處。', 5, 7),
       ('有時候，加入一些新的元素可以使經典甜點更有趣味，我喜歡嘗試不同的變化。', 2, 7),
       ('有人試過將傳統甜點轉化為現代版嗎？分享一下你的經驗！', 3, 7),
       ('我也有許多難忘的甜點體驗，特別是在旅行中，每個地方都有獨特的甜點。', 4, 8),
       ('一個特別的甜點可以讓整個旅行更加難忘，有時候我還會特意去尋找當地的特色甜品。', 1, 8);

-- 第1篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個人留言就為了刷流量，內容有夠主觀，爛死了', 1, 1);

-- 第2篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個留言不恰當，請刪除它。', 2, 7);

-- 第3篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個留言包含冒犯性內容，請立即處理。', 4, 10);

-- 第4篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('我認為這個留言是不當的，請檢查並採取適當的措施。', 1, 13);

-- 第5篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個留言可能是垃圾訊息，請查看並刪除。', 3, 16);

-- 第6篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個留言含有不適當的內容，應予以處理。', 5, 19);

-- 第7篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個留言可能是垃圾或濫用訊息，請進行審查。', 2, 22);

-- 第8篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('我認為這個留言不適當，請查看並處理。', 4, 23);

-- 第9篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('這個留言可能違反規定，請檢查並做出相應處理。', 1, 18);

-- 第10篇文章的留言檢舉
INSERT INTO ARTICLE_MESSAGE_REPORT (RPMSG_CONTEXT, MEM_ID, MSG_NO)
VALUES ('我認為這個留言含有冒犯性內容，請處理。', 3, 11);


INSERT INTO TOKEN (TOKEN_COUNT, TOKEN_GETUSE, MEM_ID)
values (10, 0, 1),
       (13, 0, 2),
       (5, 0, 3),
       (6, 0, 4),
       (7, 0, 5),
       (-5, 3, 1),
       (-3, 3, 2),
       (-3, 3, 6),
       (20, 2, 6);

INSERT INTO diy_cate (DIY_NAME, DIY_STATUS, DIY_CATE_NAME, ITEM_DETAILS, AMOUNT)
VALUES ('Juicy馬卡龍', 0, 3, '馬卡龍：原味+黃色色粉 內餡：檸檬蛋奶餡 裝飾：白巧克力、珍珠糖 🎁附手提紙盒一個 (12個裝一起) ', 300),
       ('小芒果捲', 0, 1, '主體：原味戚風蛋糕 內餡：芒果、芒果鮮奶油 裝飾：芒果、芒果鮮奶油 🎁附手提紙盒一個 (6個裝一起) ', 360),
       ('小熊先生餅乾 (葷)', 0, 0, '主體：巧克力餅乾 內餡：無 裝飾：棉花糖、眼睛糖珠、巧克力 尺寸約：直徑7.5cm、高2.5cm 🎁附手提紙盒一個 (8片裝一起) ', 260),
       ('布朗尼甜甜圈', 0, 0, ' 主體：布朗尼蛋糕 裝飾：白巧克力、糖珠 尺寸約：直徑4cm、高1.5cm 🎁附手提紙盒一個 (36個裝一起) ', 450),
       ('伯爵奶茶蛋塔', 0, 0, '主體：原味酥皮 (半成品) 內餡：伯爵奶茶 裝飾：即食珍珠 尺寸約：直徑7.5cm、高3cm 🎁附手提紙盒一個 (6個裝一起)', 200),
       ('伯爵餅乾', 0, 0, ' [蛋奶素] 主體：伯爵茶餅乾 尺寸約：長5cm、寬3cm、高1cm 🎁附手提紙盒一個 (20片裝一起) ', 200),
       ('咖啡豆夾心餅乾', 0, 0, ' [蛋奶素] 主體：咖啡可可餅乾 內餡：咖啡乳酪 裝飾：金粉 尺寸約：長4cm、寬3cm、高3cm 🎁附手提紙盒一個 (12個裝一起) ', 450),
       ('提拉米蘇泡芙', 0, 0, ' [蛋奶素] 主體：原味泡芙 內餡：巧克力鮮奶油、咖啡乳酪餡 裝飾：塑膠滴管 (內裝:咖啡酒液) 🎁附手提紙盒一個 (6個裝一起) ', 300),
       ('蜂蜜&鐵觀音瑪德蓮', 0, 0, '[蛋奶素] 瑪德蓮：蜂蜜10個、鐵觀音10個 尺寸約：長7cm、寬5cm、高5cm 🎁附手提紙盒一個 (20個裝一起)  ', 250),
       ('熔岩巧克力小蛋糕', 0, 0, ' [蛋奶素] 主體：巧克力蛋糕 內餡：巧克力甘納許+蘭姆酒 裝飾：金粉 尺寸約：長4cm、寬4cm、高3cm 🎁附手提紙盒一個 (6個裝一起) ', 150),
       ('熊熊巧克力蛋糕', 0, 1, '主體：巧克力蛋糕 內餡：巧克力甘納許 裝飾：巧克力、可可粉 尺寸約：長4cm、寬4cm、高3cm 🎁附手提紙盒一個 (6個裝一起) ', 199),
       ('德式貝禮詩布丁塔', 0, 0, '主體：原味塔皮 內餡：滑嫩鮮奶布丁、貝禮詩奶酒 🎁附手提紙盒一個 (4個裝一起)  ', 160),
       ('Oreo蛋糕', 0, 1, ' 主體：巧克力海綿蛋糕 內餡：巧克力甘納許 裝飾：Oreo鮮奶油、Oreo粉、Oreo餅乾、眼睛糖珠 🎁附手提紙盒一個 ', 550),
       ('生巧克力蛋糕', 0, 1, '主體：巧克力戚風蛋糕 內餡：巧克力甘納許、蘭姆酒 裝飾：巧克力鮮奶油、金箔 🎁附手提紙盒一個  ', 450),
       ('Jaco的貝禮詩摩卡慕斯 (葷)', 0, 0, ' 主體：摩卡慕斯、貝禮詩奶酒、餅乾底 內餡：咖啡凍 裝飾：原味鮮奶油、彩色脆球、金箔、巧克力 🎁附手提紙盒一個  ', 450),
       ('海鹽奶蓋抹茶磅蛋糕', 0, 1, '主體：原味塔皮 內餡：滑嫩鮮奶布丁、貝禮詩奶酒 🎁附手提紙盒一個 (4個裝一起)  ', 460),
       ('烏梅焙茶蛋糕(葷)', 0, 1, '主體：焙茶戚風蛋糕 內餡：烏梅慕斯(含果肉) 裝飾：烏梅鮮奶油、百香果凍、烏梅、抹茶微波蛋糕、金箔 🎁附手提紙盒一個 ', 600),
       ('楊枝甘露蛋糕', 0, 1, '主體：原味戚風蛋糕 內餡：芒果果凍、芒果鮮奶油 裝飾：芒果、葡萄柚、西米露、紅醋栗、緞帶 (不挑款) 🎁附手提紙盒一個 ', 790),
       ('韓系繽紛裸蛋糕', 0, 1, ' [蛋奶素] 主體：原味海綿蛋糕 內餡：覆盆子鮮奶油(粉)、巧克力甘納許 裝飾：鮮奶油、彩色巧克力(字體) 🎁附手提紙盒一個  ', 600),
       ('頭號甜心 (葷)', 0, 1, '主體：蜂蜜檸檬慕斯(白)、草莓戚風蛋糕(粉) 內餡：蔓越莓凍 裝飾：愛心形小蛋糕、原味鮮奶油、彩色糖珠、糖粉 🎁附手提紙盒一個  ', 550),
       ('貝禮詩生巧克力派', 0, 2, '主體：巧克力派皮 內餡：貝禮詩奶酒甘納許 裝飾：金箔、杏仁角、草莓碎粒 🎁附手提紙盒一個  ', 600),
       ('法式檸檬派 (葷)', 0, 2, ' 主體：原味派皮 內餡：檸檬蛋奶餡 裝飾：檸檬皮屑、糖粉 🎁附手提紙盒一個  ', 550),
       ('法式蘋果派 (全素)', 0, 2, ' 主體：原味派皮 內餡：焦糖蘋果 🎁附手提紙盒一個  ', 450),
       ('酒漬紅茶蘋果派', 0, 2, '主體：伯爵茶派皮 內餡：蘋果乳酪、少量肉桂、蘭姆酒 🎁附手提紙盒一個  ', 450),
       ('提拉米蘇派餅', 0, 2, ' 主體：咖啡派皮 內餡：原味生乳酪、蘭姆酒 裝飾：可可粉 🎁附手提紙盒一個 ', 400),
       ('Oreo生乳酪', 0, 3, ' 主體：原味生乳酪、Oreo生乳酪、Oreo餅乾底 裝飾：Oreo餅乾、Oreo粉、彩色脆球 🎁附手提紙盒一個 ', 450),
        ('芒果慕斯(葷)', 0, 1, '主體：芒果慕斯、餅乾底 內餡：百香果果凍 裝飾：芒果、藍莓、紅醋栗、鮮奶油、抹茶微波蛋糕 🎁附手提紙盒一個 ', 550),
        ('粉櫻檸檬生乳酪 (葷)', 0, 3, ' 主體：檸檬生乳酪、餅乾底 上層：蔓越莓凍 裝飾：鹽漬櫻花、金箔 🎁附手提紙盒一個  ', 500),
       ('紐約重乳酪蛋糕', 0, 3, ' [蛋奶素] 主體：重乳酪蛋糕、餅乾底 🎁附手提紙盒一個 ', 400),
       ('偽西瓜生乳酪(葷)', 0, 3, '外層：抹茶戚風蛋糕 中間：蔓越莓生乳酪 內餡：蔓越莓果凍 🎁附手提紙盒一個 ', 499);


INSERT INTO diy_order (MEM_ID, DIY_NO, CONTACT_PERSON, CONTACT_PHONE, RESERVATION_NUM, DIY_PERIOD, DIY_RESERVE_DATE,
                       CREATE_TIME, RESERVATION_STATUS, PAYMENT_STATUS, DIY_PRICE)
VALUES (1, 1, 'apache', '0978127324', 4, 0, '2023-09-19', '2023-06-04', 0, 0, 1200),
       (2, 2, 'blob', '0931344182', 4, 1, '2023-09-30', '2023-07-04', 0, 0, 1440),
       (3, 3, 'const', '0931344182', 4, 1, '2023-10-01', '2023-07-04', 0, 0, 1040);


INSERT INTO DIY_FORUM(MEM_ID, DIY_NO, ARTI_CONT, DIY_GRA, CREATE_TIME)
VALUES (1, 13, '我覺得超級好玩', 5, DEFAULT),
       (5, 13, '下次還會來,空間很寬敞舒適,適合情侶來!', 5, DEFAULT),
       (3, 13, '為了專題做蛋糕,不過還挺好玩的', 5, DEFAULT),
       (4, 13, '品項有點貴,買85度C回家吃實在', 1, DEFAULT),
       (5, 13, '第一次跟女朋友來這種地方 好玩 值得 還碰到她的手 讚讚讚 下次還要來', 5, DEFAULT),
       (1, 13, '會推薦朋友來的,美中不足是時間有點不太夠,還要清洗完整才能離開,希望店家可以考慮時間不要抓那麼緊湊', 4, DEFAULT),
       (5, 13, '跟第一次來體驗時有點落差,竟然器具會少,希望店家改善!!!', 3, DEFAULT),
       (3, 13, '跟家人一起來很好玩,留下美好的回憶,現場人員還幫我們合照,非常感謝!還會再來的  讚讚讚', 5, DEFAULT),
       (4, 13, '第一次跟女朋友來這種地方 好玩 值得 還碰到她的手 讚讚讚 下次還要來', 5, DEFAULT),
       (1, 13, '會推薦朋友來的,美中不足是時間有點不太夠,還要清洗完整才能離開,希望店家可以考慮時間不要抓那麼緊湊', 4, DEFAULT),
       (3, 11, '跟家人一起來很好玩,留下美好的回憶,現場人員還幫我們合照,非常感謝!還會再來的  讚讚讚', 5, DEFAULT),
       (2, 11, '跟第一次來體驗時有點落差,竟然器具會少,希望店家改善!!!', 3, DEFAULT),
       (3, 12, '跟家人一起來很好玩,留下美好的回憶,現場人員還幫我們合照,非常感謝!還會再來的  讚讚讚', 5, DEFAULT),
       (5, 11, '第一次跟女朋友來這種地方 好玩 值得 還碰到她的手 讚讚讚 下次還要來', 5, DEFAULT),
       (1, 11, '會推薦朋友來的,美中不足是時間有點不太夠,還要清洗完整才能離開,希望店家可以考慮時間不要抓那麼緊湊', 4, DEFAULT),
       (3, 11, '我覺得超級好玩', 5, DEFAULT),
       (2, 11, '下次還會來,空間很寬敞舒適,適合情侶來!', 5, DEFAULT),
       (3, 11, '為了專題做蛋糕,不過還挺好玩的', 5, DEFAULT),
       (4, 11, '品項有點貴,買85度C回家吃實在', 1, DEFAULT),
       (1, 1, '會推薦朋友來的,美中不足是時間有點不太夠,還要清洗完整才能離開,希望店家可以考慮時間不要抓那麼緊湊', 4, DEFAULT),
       (3, 1, '我覺得超級好玩', 5, DEFAULT),
       (2, 1, '下次還會來,空間很寬敞舒適,適合情侶來!', 5, DEFAULT),
       (5, 1, '為了專題做蛋糕,不過還挺好玩的', 5, DEFAULT),
       (4, 1, '品項有點貴,買85度C回家吃實在', 1, DEFAULT),
       (1, 2, '會推薦朋友來的,美中不足是時間有點不太夠,還要清洗完整才能離開,希望店家可以考慮時間不要抓那麼緊湊', 4, DEFAULT),
       (3, 2, '我覺得超級好玩', 5, DEFAULT),
       (2, 2, '下次還會來,空間很寬敞舒適,適合情侶來!', 5, DEFAULT),
       (5, 2, '為了專題做蛋糕,不過還挺好玩的', 5, DEFAULT),
       (4, 2, '品項有點貴,買85度C回家吃實在', 1, DEFAULT);




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

INSERT INTO EMPLOYEE (EMP_NAME, EMP_ACCOUNT, EMP_PASSWORD, EMP_EMAIL, EMP_STATUS)
VALUES ('ROOT', 'Root', 'c592f84b4cffa1d360e87ff7651fa6f564a0d119ec67ada1c6098fae3a511cc14af61826ae5a09965c49b80904219bcb95d53b6017cde9ce12b44e2f5fd25259', 'tibame515@gmail.com', '1'),        # ROOT   tibame515
       ('吳寶春', 'D100002', 'da8fa9956f008064a76477aec1e609c74d773f2492fd65a29f10da41cf4b3997110f2a94d26ff77a79860e50628201ea1eeee6df34dcfd381fd479f9fc2ea063', 'seefood1@yahoo.tw', '1'),      # 師傅 1  seefood1
       ('商店管理員', 'D100003', 'a239891db9f6e23374f52ebcc0ca4db17636a5fbb467e0cba8702080b66c6d01a1c4872c66027dc6ec0acab43d229281976e405af48be9c0bd18256fa5d3f0b1', 'meowmeow@gmail.com', '1'),  # 商店   cha10201
       ('課程管理員', 'D100004', 'b33cc7b316f494df80eb33b1af794956bf6fa3c92ee963ce0b06c065d575ebee2bdea2a072f93c4eb7cf56afe51fb49da882f0aac93c8f90bc3c40ed0682a9ab','hahow@gmail.com','1'),      # 課程   cha10202
       ('會員管理員', 'D100005', '6016e86c0a6f391198a714f14e0cec7253bc93215226560988db61645c6af976a337e72d38536c744bfc5ab7767c118cf76b69f1df8feb1ebd78ec937a1f12b0', 'sleep666@gmail.com', '1'),  # 會員   cha10203
       ('倉儲管理員', 'D100006', 'db00bc0fad66d04103778732a5b33b9318500982fb20071d0b5622aa5348a08aa45b3c28aaad79f4c832ab56b24dd9cd8f9ced64bb64d321294e48d0165a37e2', 'outdoor@msn.com', '1'),     # 倉儲   cha10204
       ('客服管理員', 'D100007', '67f06350f25f2120bcb294fc1e79898c1ecc9f15ad0be9bedf063184ca75c2711f2b94347bbd36d2542563f11ef4483f81ac2584f47fb2587f09ded5f3658a0d', 'bagmeow@yahoo.com', '1'),   # 客服   cha10205
       ('皮埃爾艾爾梅', 'D100008', 'f01923a806f37495a0b0bb55bfb79e7c929b7079614940af0cf443cddbd7e3b57b6e28670ab7f5b8ee3db1a18bce96f120fc71d56aa1eaeac065e046c8e05ae5', 'seefood2@yahoo.tw', '1'),  # 師傅 2 seefood2
       ('侯布雄', 'D100009', 'ff9756ae4d49a355a337862682721d8d814ac18aee8627a883d9556778105d502214e3e94aa1a9c5d122f9c5396ff113cfef32aad2e679a8e346de6f191c8894', 'seefood3@yahoo.tw', '1'),       # 師傅 3 seefood3
       ('阿基獅', 'D100010', 'c6403a1a2065a95ef65ab4c57a104b72cc6d54ea8b6d2aef23ba2d090f788b1a92d0ad36c08e56553c1690691a94bbe33173480fca742e3691b560789bc5af48', 'seefood4@yahoo.tw', '1'),       # 師傅 4 seefood4
       ('沾姆士', 'D100011', 'df8f7acfcfb18cbf6019917af5429acf2907f1efaed2ed3c2cb3743e0008eb80f7547271fcc60f09d343a578392f113cc1111aa48713af2d4fdfc9a7022da3ed', 'seefood5@yahoo.tw', '1'),       # 師傅 5 seefood5
       ('小當家', 'D100012', 'c989b16810b641a3080ed65a660f2b699c64d17da5100cc0344ed5d56b579cbb569a6cd2a9bf15a67fc70fcbe561701971cf8d515ba32bf42ffee82aecafd91a', 'seefood6@yahoo.tw', '1'),       # 師傅 6 seefood6
       ('美食獵人', 'D100013', 'c62ce94fa66b3c5ca897a89001130699566702b5075c8ae94831d4ffa21a72018556107f80cc0f5e29a9449b484c6bae8f761596a448b03b2c4b94c553badcb2', 'seefood7@yahoo.tw', '1'),     # 師傅 7 seefood7
       ('紅葉', 'D100014', 'd5209fb4dbb3bb40ea406a82212034802a127ec7f4f2cfef7eeaa3ad351d83b4c6c864313e1e8b8c137f9e91a344657482f79b3b56118cca894978f148f52a53', 'seefood8@yahoo.tw', '1');         # 師傅 8 seefood8





INSERT INTO BACKSTAGE_FUN (AUTH_ID, AUTH_FUN, TYPE_FUN)
VALUES ('1', '商品訂單管理', 'SHOP'),
       ('2', '商品管理', 'SHOP'),
       ('3', 'DIY類別設定', 'CLASS'),
       ('4', 'DIY訂單管理', 'CLASS'),
       ('5', '甜點課程訂單管理', 'MASTER'),
       ('6', '師傅資料管理', 'MASTER'),
       ('7', '回覆聊天室訊息', 'MASTER'),
       ('8', '甜點課程管理', 'MASTER'),
       ('9', '會員帳號管理', 'MEMADMIN'),
       ('10', '黑名單管理', 'MEMADMIN'),
       ('11', '食材管理', 'STORADMIN'),
       ('12', '進貨管理', 'STORADMIN'),
       ('13', '常見問題管理', 'CUSTORSERVICE'),
       ('14', '帖子討論區管理', 'CUSTORSERVICE'),
       ('15', '後台帳號管理', 'BACKADMIN');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- Root
VALUES ('1', '1'),
       ('1', '2'),
       ('1', '3'),
       ('1', '4'),
       ('1', '5'),
       ('1', '6'),
       ('1', '7'),
       ('1', '8'),
       ('1', '9'),
       ('1', '10'),
       ('1', '11'),
       ('1', '12'),
       ('1', '13'),
       ('1', '14'),
       ('1', '15');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 1
VALUES ('2', '5'),
       ('2', '6'),
       ('2', '7'),
       ('2', '8');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 商店
VALUES ('3', '1'),
       ('3', '2');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 課程
VALUES ('4', '3'),
       ('4', '4');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 會員
VALUES ('5', '9'),
       ('5', '10');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 倉儲
VALUES ('6', '11'),
       ('6', '12');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 客服
VALUES ('7', '13'),
       ('7', '14');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 2
VALUES ('8', '5'),
       ('8', '6'),
       ('8', '7'),
       ('8', '8');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 3
VALUES ('9', '5'),
       ('9', '6'),
       ('9', '7'),
       ('9', '8');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 4
VALUES ('10', '5'),
       ('10', '6'),
       ('10', '7'),
       ('10', '8');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 5
VALUES ('11', '5'),
       ('11', '6'),
       ('11', '7'),
       ('11', '8');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 6
VALUES ('12', '5'),
       ('12', '6'),
       ('12', '7'),
       ('12', '8');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 7
VALUES ('13', '5'),
       ('13', '6'),
       ('13', '7'),
       ('13', '8');

INSERT INTO BACKSTAGE_AUTH(EMP_ID, AUTH_ID) -- 師傅 8
VALUES ('14', '5'),
       ('14', '6'),
       ('14', '7'),
       ('14', '8');




INSERT INTO NOTICE(MEM_ID, NOTICE_TITLE, NOTICE_TIME)
VALUES (1, '您的留言因受到檢舉並審核通過，提醒您若受到檢舉三次將只能瀏覽文章。',
        '2021-4-2 22:59:30'),
       (2, '您因多次受到檢舉已進入黑名單，無法再使用該功能。', '2021-4-2 22:59:30'),
       (3, '您的文章有一個新留言，快來看看吧～',
        '2020-3-1 02:03:04'),
       (4, '您的文章有一個新留言，快來看看吧～',
        '2023-3-30 18:05:59'),
       (5, '您的留言因受到檢舉並審核通過，提醒您若受到檢舉三次將只能瀏覽文章。',
        '2023-7-7 07:07:07'),
        (6, '您的留言因受到檢舉並審核通過，提醒您若受到檢舉三次將只能瀏覽文章。',
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

INSERT INTO diyla.teacher (`TEA_ID`, `EMP_ID`, `TEA_NAME`, `TEA_GENDER`, `TEA_PHONE`, `TEA_INTRO`, `TEA_EMAIL`,
                           `TEA_STATUS`)
VALUES  ('1', '10', '阿基獅', '0', '0988772332', '多年的糕點及料理經驗,具有多張烘焙執照,想做出好甜點找他就對了',
        'seefood4@yahoo.tw', '0'),
        ('2', '9', '侯布雄', '0', '0912221222', '來自法國的經典配方 X 汲取異國的創意風味，跟著侯布雄，一次學會最道地的法式甜點，與來自世界各地的創意風味！',
        'seefood3@yahoo.tw', '0'),
        ('3', '11', '沾姆士', '0', '0912222223', '擅長用基礎設備、容易取得的原料，就可以在餐桌上端出職人級的享受。',
        'seefood5@yahoo.tw', '0'),
        ('4', '12', '小當家', '0', '0912224225', '常為烘焙初學者打烘焙新手友善課程，傾囊相授不藏私，就是要讓你能端出自信滿滿又美味可口的手作甜點！',
        'seefood6@yahoo.tw', '0'),
        ('5', '13', '美食獵人', '0', '0912225226', '多年的多國甜點經驗,具有多張烘焙及料理執照,想做出好的甜點或料理找他就對了',
        'seefood7@yahoo.tw', '0');
        
        
INSERT INTO diyla.speciality(`SPE_ID`, `SPE_NAME`)
VALUES ('1', '烘焙丙級'),
       ('2', '烘焙乙級'),
       ('3', '烘焙甲級');

INSERT INTO diyla.tea_speciality(`TEA_ID`, `SPE_ID`)
VALUES ('1', '3');

INSERT INTO diyla.class(`CLASS_ID`, `CATEGORY`, `TEA_ID`, `REG_END_TIME`, `CLASS_DATE`, `CLASS_SEQ`, `CLASS_LIMIT`, `PRICE`,
                        `INTRO`, `CLASS_NAME`, `HEADCOUNT`, `CLASS_STATUS`)
VALUES (1, 1, 1, '2023-09-17 00:00:00', '2023-09-19', 0, 5, 1300, '或許各位都有在店面看過輕乳酪蛋糕或重乳酪蛋糕,那箇中差異為何?以及能夠變化出什麼花樣呢?想知道的話就來上課吧!
目前課程價格只要: 1300元喔!', '起司蛋糕詳解課程', 3, 0),
       (2, 3, 2, '2023-09-15 00:00:00', '2023-09-17', 1, 5, 1200, '相信大家都有吃過軟或硬的法國麵包,此課程詳細說明法國麵包的作法,讓你做出屬於自己的法國麵包
目前課程價格只要: 1200元喔!', '法國麵包課程', 2, 0),
       (3, 2, 3, '2023-09-20 00:00:00', '2023-09-22', 2, 5, 1100, '相信大家都有吃過軟或硬的餅乾,此課程詳細說明維也納酥餅的製作與口味的變化學習,讓你做出屬於自己的鬆軟適中的餅乾
目前課程價格只要: 1200元喔!', '維也納舒餅課程', 2, 0),
       (4, 4, 4, '2023-09-19 00:00:00', '2023-09-21', 0, 5, 1800, '考量美味和扎實的操作技法之外，也將美學和呈現細節列入考慮,此課程詳細說明法式水果塔的作法,讓你做出屬於自己的法式甜點
目前課程價格只要: 1200元喔!', '香草熱帶水果焦糖塔課程', 2, 0),
       (5, 6, 5, '2023-09-23 00:00:00', '2023-09-24', 1, 5, 1500, '相信大家都有吃過甜的水果派,此課程詳細說明薄片蘋果派的作法,讓你做出屬於自己甜而不膩的蘋果派
目前課程價格只要: 1200元喔!', '薄片蘋果派', 2, 0),
       (6, 5, 2, '2023-09-15 00:00:00', '2023-09-14', 1, 5, 699, '往往烹飪是被想的太難，但其實真的一點都不難，跟著師傅的教學步驟，讓你能輕鬆醍醐灌頂，即使是烹飪新手，也能讓你快速掌握入廚理論及實作技巧', '澄香排骨課程', 2, 1),
       (7, 6, 3, '2023-09-20 00:00:00', '2023-09-23', 1, 5, 1100, '西班牙蒜香悶油蝦課程核心特色:烹飪觀念建立、基礎烹飪理論（火候掌握、判斷油溫、食材處理、基本刀工、烹調程序、擺盤）、以台式調味料為基底並以世界各地易取得之食材完成料理。', '蒜香油悶蝦'
       , 2, 0),
       (8, 4, 4, '2023-09-19 00:00:00', '2023-09-21', 1, 5, 1200, '零基礎也能上手的入門法式甜點課！解構法式甜點豐富層次，用淺顯易懂方式讓你掌握甜點製作技巧。系統化學習法式甜點技法。家用烤箱做出經典法式檸檬派。
目前課程價格只要: 1200元喔!', '法式檸檬派課程', 2, 1),
       (9, 6, 3, '2023-09-23 00:00:00', '2023-09-27', 1, 5, 999, '同樣是魚為什麼總是外面賣的才好吃?好奇嗎?想當家中的風雲人物嗎?從人人都愛的泰式檸檬魚起步吧!', '泰式檸檬魚課程', 2, 1),
       (10, 6, 2, '2023-09-24 00:00:00', '2023-09-24', 2, 5, 899, '月亮蝦餅、海鮮餅在泰式餐廳是最熱銷的,更是年輕人的最愛, 酥脆鮮香美味呀,報名吧!以後不用再買了。', '月亮海鮮餅課程', 2, 1),
       (11, 0, 1, '2023-09-25 00:00:00', '2023-09-29', 1, 5, 599, '傳統的好滋味!記憶中的好味道!長輩的最愛,動手自己來給長輩最暖的呵護,阿嬤我來囉!!!', '手工牛軋糖班', 2, 1),
       (12, 6, 1, '2023-09-26 00:00:00', '2023-09-24', 0, 5, 899, '來道媽媽的最愛!香煎馬頭魚!煎魚一直是大家的敵人,快來克服它吧,別再把魚煎不見,事不宜遲趕快來報名!', '香煎馬頭魚', 2, 1);
INSERT INTO diyla.class_reserve(`RESERVE_ID`, `CLASS_ID`, `MEM_ID`, `HEADCOUNT`, `STATUS`, `CREATE_TIME`, `TOTAL_PRICE`)
VALUES ('1', '1', '1', '3', '0', CURRENT_TIMESTAMP, '4500'),
        ('2', '1', '6', '3', '0', CURRENT_TIMESTAMP, '4500');

INSERT INTO diyla.ing_storage(`BRAND`, `ING_NUMS`, `ING_NAME`, `STATUS`, `SERVING_SIZE`)
VALUES ('安佳', '4500', '奶油', '0', '45'),
       ('台糖', '50000', '砂糖', '0', '500'),
       ('四方', '60000', '鮮奶', '0', '1000'),
       ('聯華', '0', '高筋麵粉', '1', '10000'),
       ('日正食品', '100000', '高筋麵粉', '0', '1000'),
       ('日正食品', '100000', '中筋麵粉', '0', '1000'),
       ('日正食品', '50000', '低筋麵粉', '0', '1000'),
       ('安佳', '50000', '鮮奶油', '0', '1000'),
       ('石安牧場', '6000', '雞蛋', '0', '60'),
       ('得福', '1000', '吉利丁片', '0', '50'),
       ('菲力', '5000', '鮮奶油乳酪', '0', '250');




INSERT INTO `diyla`.`commodity_track` (`TRACK_ID`, `MEM_ID`, `COM_NO`) VALUES ('8', '1', '2');
INSERT INTO `diyla`.`commodity_track` (`TRACK_ID`, `MEM_ID`, `COM_NO`) VALUES ('9', '6', '8');
INSERT INTO `diyla`.`commodity_track` (`TRACK_ID`, `MEM_ID`, `COM_NO`) VALUES ('10', '6', '3');
INSERT INTO `diyla`.`commodity_track` (`TRACK_ID`, `MEM_ID`, `COM_NO`) VALUES ('11', '2', '9');

