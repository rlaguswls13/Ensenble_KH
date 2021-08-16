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
	href="${contextPath}/resources/css/reservation/rvStatus.css?ver=123"
	type="text/css" />

	<script>
	
		const rvStatusList = JSON.parse('${rvStatusList}');
		
		const eventsArr = [];
		
		$.each(rvStatusList, function(){
			const rv = {};
			rv.title = this.roomName + " 예약불가";
			rv.start = this.rvDate + "T" + this.rvTime;
			
			eventsArr.push(rv);
			
		});
		
	
	
	
	

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
      events:  eventsArr
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
			<div style="padding:15px"></div>
			<h3 style="font-family: 'Noto Serif KR', serif; font-weight: 600; display:block;">Before Reservation</h3>
			<br>

			<div class="rvStatus">

				<div class="rvStatusText0">
					<div class="rvStatusText"><b>예약 현황</b></div>
					<div class="rvStatusText2">예약에 앞서 예약현황을 확인해주세요.</div>
					<a href="${contextPath}/reservation/reservation" class="btn btn-ensemble">예약하기</a>
				</div>
				<div style="padding:10px;"></div>
				 <div id='calendar'></div>
			</div>





		</div>
	</div>


	









	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>