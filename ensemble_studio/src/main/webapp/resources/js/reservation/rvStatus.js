 document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',

                googleCalendarApiKey: 'AIzaSyDPFc-h7SuxbTnDANpTtfz-pRd4yfU3OTs',
                events: {
                    googleCalendarId: '65pa0ltit82h80nl82llb5c2lg@group.calendar.google.com',
                    className: 'gcal-event' // an option!



                }




            });
            calendar.render();
        });


        var calendar = new Calendar(calendarEl, {
            initialDate: '2014-11-10',
            initialView: 'timeGridWeek',
            events: [
                {
                    start: '2014-11-10T10:00:00',
                    end: '2014-11-10T16:00:00',
                    display: 'background'
                }
            ]
        });


        