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
	href="${contextPath}/resources/css/reservation/fullcalendar/main.css"
	type="text/css" />
<script
	src="${contextPath}/resources/js/reservation/fullcalendar/main.js"></script>
<script src="${contextPath}/resources/js/reservation/rvStatus.js"></script>



<link rel="stylesheet"
	href="${contextPath}/resources/css/reservation/rvStatus.css"
	type="text/css" />
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