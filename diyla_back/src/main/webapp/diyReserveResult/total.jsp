<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jQuery v1.9.1 -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <!-- Moment.js v2.20.0 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.0/moment.min.js"></script>
    <!-- FullCalendar v3.8.1 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.print.css" rel="stylesheet"
          media="print">
    </script>
    <!-- Bootstrap v4.5.0 JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.js"></script>

    <style>
    	body{
    	margin-left: 280px;
    	}

        .nav-link.active {
            color: orangered !important;
        }

       
        .nav-link:hover {
            color: blue !important;
        }
    </style>
</head>

<body>
 <jsp:include page="../index.jsp" />
<div id="example"></div>

<!-- 在你的 HTML 中添加一个隐藏的模态视图 -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventModalLabel">時段</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 選項卡標籤 -->
                <ul class="nav nav-tabs" id="myTabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="morning-tab" data-toggle="tab" href="#morning" role="tab"
                           aria-controls="morning" aria-selected="true">早上</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="afternoon-tab" data-toggle="tab" href="#afternoon" role="tab"
                           aria-controls="afternoon" aria-selected="false">下午</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="evening-tab" data-toggle="tab" href="#evening" role="tab"
                           aria-controls="evening" aria-selected="false">晚上</a>
                    </li>
                </ul>

                <!-- 選項卡內容 -->
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="morning" role="tabpanel"
                         aria-labelledby="morning-tab">
                        <!-- 早上内容框框 -->
                    </div>
                    <div class="tab-pane fade" id="afternoon" role="tabpanel" aria-labelledby="afternoon-tab">
                        <!-- 下午内容框框 -->
                    </div>
                    <div class="tab-pane fade" id="evening" role="tabpanel" aria-labelledby="evening-tab">
                        <!-- 晚上内容框框 -->
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
            </div>
        </div>
    </div>
</div>

<script>
function updateDate(item){
	var dateKey = item.diyReserveDate.split('T')[0];
    var originalDate = new Date(dateKey); // 将日期字符串转换为日期对象
    var nextDay = new Date(originalDate);
    nextDay.setDate(originalDate.getDate() + 1);
    var nextDayString = nextDay.toLocaleDateString();
    return nextDayString;
}
    $(document).ready(function () {
        var calendar = $('#example').fullCalendar({
            timezone: 'local',
            events: function (start, end, timezone, callback) {
                $.ajax({
                    url: 'http://localhost:8081/diyla_back/api/diy-reserve/diyResult/allPeriodResult',
                    dataType: 'json',
                    data: {},
                    success: function (data) {
                        var mergedEvents = {};

                        data.forEach(function (item) {
                        	var newKeyDate =  updateDate(item);
                            if (!mergedEvents[newKeyDate]) {
                                mergedEvents[newKeyDate] = {
                                    diyReserveDate: newKeyDate,
                                    diyPeriods: [],
                                };
                            }
                            

                            var existingPeriod = mergedEvents[newKeyDate].diyPeriods.find(function (period) {
                                return period.diyPeriod === item.diyPeriod;
                            });

                            if (existingPeriod) {
                                existingPeriod.peoLimit += item.peoLimit;
                            } else {
                                mergedEvents[newKeyDate].diyPeriods.push({
                                    diyPeriod: item.diyPeriod,
                                    peoLimit: item.peoLimit,
                                });
                            }
                        });

                        var events = [];
                        for (var date in mergedEvents) {
                            var mergedEvent = mergedEvents[date];
                            console.log( mergedEvent);
                            console.log( date);
                            var title = '';
                            mergedEvent.diyPeriods.forEach(function (period) {
                                switch (period.diyPeriod) {
                                    case 0:
                                        title += '早上 - ';
                                        break;
                                    case 1:
                                        title += '下午 - ';
                                        break;
                                    case 2:
                                        title += '晚上 - ';
                                        break;
                                }
                                title += '剩餘可預約人數 ' + period.peoLimit + '\n';
                            });
							console.log(title);
                            events.push({
                                title: title,
                                start: mergedEvent.diyReserveDate,
                                allDay: true
                            });
                        }
console.log(events);
                        callback(events);
                    }
                });
            },
            /////////////////////////////////
            eventClick: function a (calEvent, jsEvent, view) {
                // 清空选项卡内容
               
                
                
                // 根据事件标题中的关键字来确定选项卡框框
                if (calEvent.title.includes('早上')) {
                	 $('#morning').empty();
                    // 从数据库中获取同一天早上时段的数据并填充到选项卡
                    var selectedDate = calEvent.start.format('YYYY-MM-DD');
                    console.log(selectedDate);
                    console.log(0);
                    $.ajax({
                        url: 'http://localhost:8081/diyla_back/api/diy-reserve/getOneSummaryMorning?date=' + selectedDate, // 替换为获取同一天早上数据的后端API或URL
                        dataType: 'json',
                        data: { selectedDate: selectedDate }, // 传递选定日期
                        success: function (data) {
                            // 将数据填充到选项卡
                            data.forEach(function (item) {
                            	console.log(item);
                                $('#morning').append('<p>DIY預約日期：' + updateDate(item) + '</p>');
                                $('#morning').append('<p>時段：早上</p>');
                                $('#morning').append('<p>已預約總人數：' + item.peoCount + '</p>');
                                if(item.reserveStatus === 0){
                                	$('#morning').append('<p>狀態：可正常預約</p>');
                                }else{
                                	$('#morning').append('<p>狀態：人數已滿，無法預約</p>');
                                }
                                
                                // 继续添加其他字段...
                            });
                        }
                    });
                }
                	
                	
//                 eventClick: function b (calEvent, jsEvent, view) {	
                	
               if (calEvent.title.includes('下午')) {
            	   $('#afternoon').empty();
                    // 从数据库中获取同一天下午时段的数据并填充到选项卡
                    var selectedDate = calEvent.start.format('YYYY-MM-DD');
                    console.log(selectedDate);
                    console.log(1);
                    $.ajax({
                        url: 'http://localhost:8081/diyla_back/api/diy-reserve/getOneSummaryAfternoon?date=' + selectedDate, // 替换为获取同一天下午数据的后端API或URL
                        dataType: 'json',
                        data: { selectedDate: selectedDate }, // 传递选定日期
                        success: function (data) {
                            // 将数据填充到选项卡
                            data.forEach(function (item) {
                            	console.log(item);
                                $('#afternoon').append('<p>DIY預約日期：' + updateDate(item) + '</p>');
                                $('#afternoon').append('<p>時段：下午</p>');
                                $('#afternoon').append('<p>已預約人數：' + item.peoCount + '</p>');
                                if(item.reserveStatus === 0){
                                	$('#afternoon').append('<p>狀態：可正常預約</p>');
                                }else{
                                	$('#afternoon').append('<p>狀態：人數已滿，無法預約</p>');
                                }
                                // 继续添加其他字段...
                            });
                        }
                    });
                } 
//                }
                
//                 eventClick: function c (calEvent, jsEvent, view) {
                	
                	 if (calEvent.title.includes('晚上')) {
                		 $('#evening').empty();
                    // 从数据库中获取同一天晚上时段的数据并填充到选项卡
                    var selectedDate = calEvent.start.format('YYYY-MM-DD');
                    console.log(selectedDate);
                    console.log(2);
                    $.ajax({
                        url: 'http://localhost:8081/diyla_back/api/diy-reserve/getOneSummaryNight?date=' + selectedDate, // 替换为获取同一天晚上数据的后端API或URL
                        dataType: 'json',
                        data: { selectedDate: selectedDate }, // 传递选定日期
                        success: function (data) {
                            // 将数据填充到选项卡
                            data.forEach(function (item) {
                            	console.log(item);
                                $('#evening').append('<p>DIY預約日期：' + updateDate(item) + '</p>');
                                $('#evening').append('<p>時段：晚上</p>');
                                $('#evening').append('<p>已預約人數：' + item.peoCount + '</p>');
                                if(item.reserveStatus === 0){
                                	$('#evening').append('<p>狀態：可正常預約</p>');
                                }else{
                                	$('#evening').append('<p>狀態：人數已滿，無法預約</p>');
                                }
                                // 继续添加其他字段...
                            });
                        }
                    });
                }
//                 }
                // 显示模态视图
                $('#eventModal .modal-title').text('預約詳情');
                $('#eventModal').modal('show');
            }
        });
    });

</script>

</html>