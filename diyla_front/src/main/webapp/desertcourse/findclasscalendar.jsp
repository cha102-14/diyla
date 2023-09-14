<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang='en'>

    <head>
        <meta charset='utf-8' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
        <title>課程日曆表</title>

        <script>

            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    events: 'getclass.jsp',
                    eventClick: function (info) {
                        var courseId = info.event.id;
                        window.location.href = 'classdetail.jsp?id=' + courseId;
                    },
                     eventContent: function (arg) {
                              var startTime = arg.event.start;
                              var timeCategory = getTimeCategory(startTime);
                              var isFullClass = arg.event.extendedProps.isFull ? 'event-full' : '';
                              // 只顯示早上/下午/晚上之一，根據時間分類
                              var timeHtml = '<div class="event-item ' + isFullClass + '"><div class="event-time">' + timeCategory + '</div>';
                              var titleHtml = '<div class="event-title">' + arg.event.title + '</div></div>';
                              return { html: timeHtml + titleHtml };
                          }
                });
                             function getTimeCategory(startTime) {
                        var hour = startTime.getHours();
                        if (hour >= 6 && hour < 12) {
                            return '早上 ';
                        } else if (hour >= 12 && hour < 18) {
                            return '下午 ';
                        } else {
                            return '晚上 ';
                        }
                    }
                calendar.render();
                
            });

        </script>
        <style>
            #pageContent{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .title-tag {
            position: relative;
            padding: 1rem 2rem calc(1rem + 10px);
            background: #ffd9b3;
        }
        .title-tag:before {
            position: absolute;
            top: -7px;
            left: -7px;
            width: 100%;
            height: 100%;
            content: '';
            border: 4px solid #000;
        }
        #calendar{
            width: 80%;
            font-size: 1.2rem;
            margin-bottom: 8vh;
        }
                    .event-time{
                      margin-right: 10px;
                      font-size: 1.2rem;
                      font-weight:bold;
                      color:brown;
                      
                    }
                    .event-title{
                      font-size: 1.2rem;
                      color:black;
                      white-space: wrap;
                    }
                    .event-item{
                      display:flex;
                      flex-direction: row;
                      width: 100%;
                      border-radius: 5px;
                      background: #b3ffb3;
                    }
                    .event-full {
                        background: #ccc; 
                    }
        </style>
    </head>

    <body>
        <jsp:include page="/front_header.jsp" />
        <section id="navibar">
        <jsp:include page="/desertcourse/navibar.jsp" />
        </section>
        <div id="pageContent">
        <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
            <h2 id="title" class="title-tag" >課程日曆表</h2>
        </div>
        <div id='calendar' class="shadow-lg"></div>
        </div>
        <jsp:include page="/front_footer.jsp" />
    </body>

    </html>