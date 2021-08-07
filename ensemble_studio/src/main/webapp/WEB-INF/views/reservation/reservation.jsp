<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>reservation</title>


<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/carousel/">
</head>
<jsp:include page="../common/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="${contextPath}/resources/css/reservation/reservation.css"
	type="text/css">

<body>

	<div class="container">

		<h2>Reservation</h2>
		<div class="studio">
			<h3>스튜디오 선택</h3>
			<h5>원하시는 스튜디오를 선택해주세요</h5>
			<form>
				<div class="aRoom">
					<input type="radio" id="a" value="a" name="room"> <label
						for="a">A Room</label><br> <img src="sample\images\aRoom.jpg"
						width="190 px " height="150 px" left="10px">
				</div>
				<div class="bRoom">
					<input type="radio" id="b" value="b" name="room"> <label
						for="b">B Room</label><br> <img
						src="C:\Users\yong's\새 폴더\sample\images\bRoom.jfif"
						width="190 px " height="150 px" left="10px">
				</div>
				<div class="cRoom">
					<input type="radio" id="c" value="c" name="room"> <label
						for="c">C Room</label><br> <img
						src="C:\Users\yong's\새 폴더\sample\images\cRoom.jfif"
						width="190 px " height="150 px" left="10px">
				</div>

			</form>











		</div>
		<div class="reservationDate">
			<h3>예약 일자 및 시간</h3>
			<h5>예약을 원하시는 일자와 시간을 선택해주세요</h5>
			<div class="reservationCalender">
				<div id="datepicker"></div>
			</div>
			<div class="reservationTime" style="display: inline-block;">
				<input type="radio" id="rv1" name="rv1" value="09:00 ~ 12:00">
				<label for="rv1">09:00 ~ 12:00</label><br>
				<br> <input type="radio" id="rv2" name="rv2"
					value="12:00 ~ 15:00"> <label for="rv2">12:00 ~
					15:00</label><br>
				<br> <input type="radio" id="rv3" name="rv3"
					value="15:00 ~ 18:00"> <label for="rv3">15:00 ~
					18:00</label>






			</div>
		</div>
		<div class="reservationOption1">
			<div class="reservationOption">
				<div class="optionDetail">옵션 내용</div>
				<div class="optionRadio">
					<div class="optionListA">
						<input type="radio" id="d" value="d" name="option"> <label
							for="d">캐논 100D (무료) </label><br>
						<br> <input type="radio" id="e" value="e" name="option">
						<label for="e">캐논 5D Mark II (+20,000원) </label><br>
						<br> <input type="radio" id="f" value="f" name="option">
						<label for="f">캐논 5D Mark IV (+30,000원)</label><br>
						<br> <input type="radio" id="g" value="g" name="option">
						<label for="g">70-200mm f 렌즈(+10,000원)</label><br>
						<br> <input type="radio" id="h" value="h" name="option">
						<label for="h">탑라이트 조명 (무료)</label>
					</div>
					<div class="optionListB">
						<input type="radio" id="i" value="i" name="option"> <label
							for="i">소프트박스 2개(+10,000원)</label><br>
						<br> <input type="radio" id="j" value="j" name="option">
						<label for="j">컬러필터(+10,000원)</label><br>
						<br> <input type="radio" id="k" value="k" name="option">
						<label for="k">반사판(+10,000)</label><br>
						<br> <input type="radio" id="l" value="l" name="option">
						<label for="l">건조간식(+5,000원)</label><br>
						<br> <input type="radio" id="m" value="m" name="option">
						<label for="m">육포(+3,000)</label>
					</div>
				</div>

			</div>
			<div class="rvDetail2">

				이용 인원 수 : <input type="text" name="personQty"><br> 방문
				차량 수 : <input type="text" name="carQty"><br> 반려 동물 수 :
				<input type="text" name="animalQty"><br> 촬영 내용
				&nbsp;&nbsp;&nbsp; : <input type="text"><br> 비고 :<br>
				<textarea rows="5" cols="50" name="ta" style="resize: none;"> </textarea>
         
			</div>

		</div>

		<div class="reservationAttention">
			<div id="reservationAttentionText">
				<div id="reservationAttentionText1">예약시 주의사항</div>
				<div id="reservationAttentionText2">주의사항을 필독해주세요</div>
			</div>
			<div class="reservationAttentionSentence">
				예약 시 꼭 알아두세요!<br> 예약 가능한 스튜디오 및 시간을 확인하신 후 예약을 진행해주세요.<br>
				세트장 예약은 사이트를 통해서만 가능합니다. 유선 예약은 불가합니다.<br> 이용시간은 촬영시간이 아닌 입장시간과
				퇴장시간(정리시간 포함)을 기준으로 합니다.<br> 기준 인원(4인) 초과시 한시간에 1인당 5천원의 추가요금이
				발생됩니다.<br> 스케줄 취소 및 변경 요청은 1:1 상담 게시판을 이용해 주시기 바랍니다.<br>
				3시간 이하의 촬영시 예약시간보다 빨리 끝나는 경우라도 예약시간 기준으로 금액을 산정합니다.<br> 촬영으로 인해
				발생된 오염이나 파손에 대해서는 복구해주셔야 하며,<br> 가구나 구조물에 복구 불가한 손상이 발생시 비용이
				청구됩니다.<br> 스튜디오 사전 답사 희망시 방문 가능한 시간을 유선으로 확인하신 후 답사하여 주시기 바랍니다.<br>
				영상 및 광고, 화보, 가구촬영 등 다수의 인원 및 장비가 필요한 촬영은 전화문의 후 예약을 부탁드립니다.<br>
				룸 별 스타일링이 주기적으로 바뀌므로 꼭 필요하신 소품이 있으실 경우 촬영 전 전화문의 부탁드립니다.<br>
				주차는 팀당 3대 가능합니다.<br>



			</div>

		</div>
		<hr>
		<div class="price">
			<div id="totalPrice">140,000원</div>
			<div id="priceText">총 금액</div>
		</div>
		<hr>

		<h3>회원정보</h3>
		<div class="userInfo">
			<div class="info">
				<div class="text">아이디</div>
				<div class="infodt">user001</div>
			</div>
			<div class="info">
				<div class="text">이름</div>
				<div class="infodt">유저일</div>
			</div>
			<div class="info">
				<div class="text">이메일</div>
				<div class="infodt">user001@naver.com</div>
			</div>
			<div class="info">
				<div class="text">닉네임</div>
				<div class="infodt">유저이다</div>
			</div>
			<div class="info">
				<div class="text">휴대폰</div>
				<div class="infodt">010-0000-0000</div>
			</div>
			<div class="info">
				<div class="text">반려동물</div>
				<div class="infodt">코코/여/푸들/6살/5KG</div>
			</div>




		</div>
		<hr>

		<div class="row4">
			<button class="btn btn-primary btn-lg button1 " type="submit"
				style="width: 130px;">예약하기</button>
		</div>

	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>



	<script>
		$("#datepicker").datepicker();
	</script>


</body>

</html>

