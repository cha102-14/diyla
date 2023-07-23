INSERT INTO MEMBER(MEM_NAME, MEM_EMAIL, MEM_PASSWORD, MEM_PHONE,
                   MEM_BIRTHDAY, MEM_GENDER, MEM_ADDRESS, MEM_DATE)
VALUES ('apache', 'app@diyla.com', 'api123456', '0900111222', '2004-12-31', '2', '台北市信義區信義路五段7號89樓',
        '2021-4-1'),
       ('blob', 'border@diyla.com', 'b654321', '0900222333', '1997-12-9', '1', '桃園市中壢區復興路46號9樓之805',
        '2020-5-5'),
       ('const', 'chatgpt@diyla.com', '123c456', '0912333444', '1980-3-10', '1', '臺中市清水區美堤街8號', '2020-02-29'),
       ('david', 'doget@diyla.com', '098765d', '0955888999', '1950-6-30', '2', '花蓮縣壽豐鄉福德189號', '2022-12-31'),
       ('exception', 'error@diyla.com', '3456e78', '0977888666', '1977-9-3', '2', '屏東縣鹽埔鄉仕絨村東平街25號',
        '2023-4-4');


INSERT INTO diyla.commodity_class (COM_CLASS_NAME)
VALUES ('烘焙器材'),
       ('食材原料'),
       ('精緻點心');


INSERT INTO diyla.commodity (COM_CLASS_NO, COM_NAME, COM_PIC, COM_DEC, COM_PRI, COM_QUA, COM_ONSHELF, COMMENT_TOTAL,
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

       (2, '無嚴奶油300克', null,
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
                                   UPDATE_TIME)
VALUES (1, DEFAULT, 3, 85, 0, 85, DEFAULT),

       (2, DEFAULT, 2, 400, 0, 400, DEFAULT),

       (3, DEFAULT, 2, 295, 0, 295, DEFAULT);

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
