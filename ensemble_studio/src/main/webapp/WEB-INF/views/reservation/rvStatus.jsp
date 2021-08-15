<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation status</title>






<!-- CSS -->



<link rel="stylesheet"
	href="${contextPath}/resources/css/reservation/fullcalendar/main.min.css" type="text/css" />
	
	<script src="${contextPath}/resources/js/reservation/fullcalendar/jquery.js"></script>
	<script	src="${contextPath}/resources/js/reservation/fullcalendar/main.min.js"></script>
	<script src="${contextPath}/resources/js/reservation/fullcalendar/ko.js"></script>




<link rel="stylesheet"
	href="${contextPath}/resources/css/reservation/rvStatus.css"
	type="text/css" />
	
	<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek',
        
      },
      initialDate: '2021-08-10',
      locale: 'ko',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2021-09-01'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2021-08-19T12:00:00',
         
          
        }
       
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>


</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	








	<div class="container">
		<div class="innerContainer">
			<h2>Before Reservation</h2>
			<br>

			<div class="rvStatus">

				<div class="rvStatusText0">
					<div class="rvStatusText">예약 현황</div>
					<div class="rvStatusText2">예약에 앞서 예약현황을 확인해주세요.</div>
				</div>
				 <div id='calendar'></div>
			</div>





		</div>
	</div>


	<a href="${contextPath}/reservation/reservation" class="btn btn-beige">예약하기</a>









	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>