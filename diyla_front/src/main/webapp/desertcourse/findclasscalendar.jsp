<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang='en'>

    <head>
        <meta charset='utf-8' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
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
                    }
                });
                calendar.render();
            });

        </script>
    </head>

    <body>
        <jsp:include page="/front_header.jsp" />
        <section id="navibar">
        <jsp:include page="/desertcourse/navibar.jsp" />
        </section>
        <div id='calendar'></div>
        <jsp:include page="/front_footer.jsp" />
    </body>

    </html>