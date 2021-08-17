<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 수정</title>
<jsp:include page="admin-header.jsp"></jsp:include>
</head>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/reservation/reservation.css?ver=234"
	type="text/css">
<style>
.container {
	width: 1000px;
	height: 1600px;
	border: 1px solid gray;
	margin-top: 100px;
	margin-bottom: 100px;
}

/* 촬영정보 선택  */
.reservationOption {
	height: 200px;
}

.optionDetail {
	float: left;
	width: 200px;
	height: 210px;
	font-size: 20px;
	font-weight: bold;
}

.optionRadio {
	float: left;
	width: 600px;
	height: 210px;
}

.optionListA {
	float: left;
	width: 250px;
	height: 200px;
}

.optionListB {
	float: left;
	width: 250px;
	height: 200px;
}

.rvDetail2 {
	width: 800px;
	font-size: 20px;
	font-weight: bold;
}

.reservationOption1 {
	height: 600px;
	width: 1000px;
}

.price {
	height: 40px;
	width: 800px;
}

#totalPrice {
	width: 150px;
	height: 30px;
	float: right;
	font-size: 30px;
}

#priceText {
	margin-top: 10px;
	width: 100px;
	height: 30px;
	float: right;
	font-size: 15px;
}

.userInfo {
	height: 200px;
	width: 800px;
}

.info {
	height: 30px;
	width: 800px;
}

.text {
	float: left;
	font-size: 15px;
	width: 100px;
	font-weight: bold;
}

.infodt {
	float: left;
	font-size: 15px;
	width: 200px;
	color: gray;
}

#etcText {
	width: 100px;
	float: left;
}

#etcBox {
	width: 60px;
	float: left;
}
</style>
<body>

	<div class="container">

		<form method="POST" action="${rv.rvNo}" class="needs-validation"
			name="modifyRvForm" onsubmit="return validate();">

			<!-- 닉네임 -->
			<div class="row mb-3 form-row">
				<div class="col-md-2">
					<h6>닉네임</h6>
				</div>
				<div class="col-md-5">
					<h5 id="name">${rv.memberNick }</h5>
				</div>
			</div>

			<div class="studio">

				<div style="padding: 5px;"></div>

				<c:forEach items="${roomList}" var="room">
					<div class="aRoom">
						<input type="radio" id="roomNo" value="${room.roomNo}"
							name="roomNo" price="${room.roomDiscountedPrice}"> <label
							for="${room.roomName}">${room.roomName}</label><br> <img
							class="room-img"
							style="background-image:url('${contextPath}/${room.filePath}/${room.fileName}')">
					</div>
				</c:forEach>

			</div>

			<div class="reservationDate">

				<div style="padding: 5px;"></div>

				<div class="reservationCalender">
					<input type="text" id="datepicker" name="rvDate" placeholder="날짜선택"
						onchange="selectRvTimeList()">
				</div>
				<div class="reservationTime" style="display: inline-block;">
					<input type="radio" id="rv1" name="rvTime" value="09:00~12:00"
						name="rvTime"> <label for="rv1">09:00 ~ 12:00</label><br>
					<br> <input type="radio" id="rv2" name="rvTime"
						value="12:00~15:00" name="rvTime"> <label for="rv2">12:00
						~ 15:00</label><br> <br> <input type="radio" id="rv3"
						name="rvTime" value="15:00~18:00" name="rvTime"> <label
						for="rv3">15:00 ~ 18:00</label>






				</div>
			</div>
			<div class="reservationOption1">
				<div class="reservationOption">


					<div style="padding: 10px;"></div>

					<div class="optionDetail">옵션 내용</div>
					<div class="optionRadio">

						<div class="optionListA">
							<c:forEach items="${optionList}" var="option">
								<c:if test="${option.optionType== 'G'}">

									<c:set var="flag" value=" " />
									<c:forEach items="${rv.optionList}" var="rvOption">
										<c:if test="${rvOption.optionNo == option.optionNo }">
											<c:set var="flag" value="checked" />
										</c:if>
									</c:forEach>


									<input type="checkbox" id="${option.optionName}"
										value="${option.optionNo}" price="${option.optionPrice}"
										name="option" ${flag}>


									<label for="${option.optionName}">${option.optionName})</label>
									<br>
								</c:if>
							</c:forEach>
						</div>


						<div class="optionListB">
							<c:forEach items="${optionList}" var="option">
								<c:if test="${option.optionType == 'A'}">

									<c:set var="flag" value=" " />
									<c:forEach items="${rv.optionList }" var="rvOption">
										<c:if test="${rvOption.optionNo == option.optionNo }">
											<c:set var="flag" value="checked" />
										</c:if>
									</c:forEach>

									<input type="checkbox" id="${option.optionName}"
										value="${option.optionNo}" price="${option.optionPrice}"
										name="option" ${flag}>
									<label for="${option.optionName}">${option.optionName})</label>
									<br>
								</c:if>
							</c:forEach>
						</div>



					</div>


				</div>
				<div class="row">
					<div class="col-2">이용 인원 수</div>
					<div class="col-2">
						<input type="number" class="form-control" name="rvPeople" required>
					</div>
				</div>
				<div style="padding: 10px"></div>
				<div class="row">
					<div class="col-2">방문 차량 수</div>
					<div class="col-2">
						<input type="number" class="form-control" name="rvCars" required>
					</div>
				</div>
				<div style="padding: 10px"></div>
				<div class="row">
					<div class="col-2">반려 동물 수</div>
					<div class="col-2">
						<input type="number" class="form-control" name="rvAnimals"
							required>
					</div>
				</div>
				<div style="padding: 10px"></div>

				<div class="row">
					<div class="col-2">촬영 내용</div>
					<div class="col-7">
						<input type="text" class="form-control" name="rvPurpose" required>
					</div>
				</div>
				<div style="padding: 10px"></div>
				<div class="row">
					<div class="col-2">비고</div>
					<div class="col-7">
						<textarea rows="5" class="form-control" cols="50" name="rvEtc"
							style="resize: none;" required> </textarea>
					</div>

				</div>
			</div>


			<div class="price">
				<div id="totalPrice">140,000원</div>
				<input type="hidden" name="wholePrice" id="wholePrice" value="">
				<div id="priceText">총 금액</div>
			</div>




			<hr>

			<div class="row4">
				<button class="btn btn-primary btn-lg button0" type="submit"
					style="width: 200px;">수정하기</button>
			</div>

		</form>

	</div>


	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd', //날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
			prevText : '이전 달', // 마우스 오버시 이전달 텍스트
			nextText : '다음 달', // 마우스 오버시 다음달 텍스트
			closeText : '닫기', // 닫기 버튼 텍스트 변경
			currentText : '오늘', // 오늘 텍스트 변경
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ], //한글 캘린더중 월 표시를 위한 부분
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ], //한글 캘린더 중 월 표시를 위한 부분
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ], //한글 캘린더 요일 표시 부분
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ], //한글 요일 표시 부분
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], // 한글 요일 표시 부분
			showMonthAfterYear : true, // true : 년 월  false : 월 년 순으로 보여줌
			yearSuffix : '년', //
			showButtonPanel : true, // 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
		//	        buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
		//	        buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
		//	        buttonText: "Select date"	// 조그만한 아이콘 툴팁
		});
		/*--------------------------------------------------------------------------------------------------  */
		//선택한 날짜 가능 시간 목록 조회
		function selectRvTimeList() {
			console.log($("#datepicker").val())
			console.log($("input[name='roomNo']:checked").val())
			//$.AJAX({}); -> 안의 중괄호는 자바스크립트 객체다!!!
			$.ajax({
				url : "${contextPath}/reservation/list",
				data : {
					"rvDate" : $("#datepicker").val(),
					"roomNo" : $("input[name='roomNo']:checked").val()
				},
				type : "POST", /// 댓글이 몇개가 넘어올지 모르니 GET 보단 POST로
				dataType : "JSON", // 응답되는 데이터의 형식이 JSON임을 알려줌 -> JS 객체로 변환됨 (JSON : 자바스크립트 객체 표기법, JSON 형태의 스트링 데이터를 자바스크립트 객체로 만듦...)
				success : function(rvTimeList) {
					console.log(rvTimeList);
					$("input[name='rvTime']").each(function() {
						$(this).prop("disabled", false);
						$(this).next().removeClass("rvTime-disabled");
					})
					$.each(rvTimeList, function(index, item) {
						$("input[name='rvTime']").each(function() {
							if ($(this).val() == item.rvTime) { // 이미 예약이 되어있을 때
								$(this).prop("disabled", true);
								$(this).next().addClass("rvTime-disabled");
							}
						})
					});
				},
				error : function() {
					console.log("예약 시간 목록 조회 실패");
				}
			});
		}

		$("[name=roomNo]").on("change", function() {
			const index = $("[name=roomNo]").index($(this));
			const price = Number($(this).attr("price"));

			$("#reservationForm")[0].reset();

			$("[name=roomNo]").eq(index).prop("checked", true);

			// reservationForm
			$("#totalPrice").text(price + "원");
			$("#wholePrice").val(price);
		})

		// 옵션 값이 변할 때 마다

		$("[name=option]").on("change", function() {

			let totalPrice = 0;

			$("[name=option]").each(function() {

				if ($(this).prop("checked") == true) {
					totalPrice += Number($(this).attr("price"));
				}

			});

			totalPrice += Number($("[name=roomNo]").attr("price"));

			$("#totalPrice").text(totalPrice + "원");

			$("#wholePrice").val(totalPrice);

			console.log($("#wholePrice").val())

		});
	</script>

</body>
</html>