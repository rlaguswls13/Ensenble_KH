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


<style>
.reservationTime input[type=radio] {
	display: none;
	border : 1px solid gray;
	
}

.reservationTime input[type=radio]+label {
	height: 50px;
	
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: white;
	border : 1px solid gray;
	color : black ;
	font-weight: 300;
	font-size: 14px;
	text-align : center;
	border-radius: 10px;
	font-weight: bold;
	margin-right: 5px;
	width : 130px;
}
.time {
    margin-bottom: -2%;
    
    }
    
.reservationTime input[type=radio]:checked+label {
	height: 50px;
	border : none;
	text-align : center;
	width : 130px;
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #FF657D;
	font-weight: bold;
	font-size: 14px;
	border-radius: 10px;
	margin-right: 5px;
	color : white !important;
}

.carousel-img {
	width: 100%;
	height: 50vw;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

.carousel-indicators>li {
	width: 7px !important;
	height: 7px !important;
	margin-right: 20px !important;
	border-radius: 50% !important;
}

.studio-view-cards {
	width: 90%;
	height: auto;
	padding-bottom: 20px;
	border: 1px solid rgb(182, 182, 182);
	margin: auto;
	margin-bottom: 20px;
}

.row {
	padding-bottom: 1%;
}

.card-img {
	width: 90%;
	height: 300px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	margin: auto;
	margin-top: 15px;
	margin-bottom: 15px;
}

.card-text1 {
	font-family: 'Noto Serif KR', serif;
	font-weight: 600;
	font-size: larger;
	width: auto;
	display: inline-block;
}

.btn-beige {
	background-color: #F9F7EB;
	padding-left: 25px;
	padding-right: 25px;
	float: right;
	margin-right: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.card-text2 {
	font-family: 'cafe24 oneprettynight';
	height: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.notice-img {
	width: 100%;
	height: 200px;
	border: 1px solid rgb(182, 182, 182);
	margin-bottom: 10px;
}



.rvTime-disabled {
	background-color: lightgray !important;
	color:#888 !important;
}
.contentContainer{
	padding-left : 10px;
}
.ensemble{
background-color: #FDCDCD;
        padding-left: 25px; padding-right: 25px;
        margin-right: 20px;
        padding-top : 5px; padding-bottom: 5px;
		margin-left : 30%;

}

.userInfo {
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
#name{
	font-size: 17px;
}

/* 촬영정보 선택  */
</style>
<body>


	<div class="main_bg">
		<div class="main_content">

			<div class="contentContainer">

				<form method="POST" action="${rv.rvNo}" class="needs-validation"
					id="modifyRvForm" name="modifyRvForm" onsubmit="return validate();">
					
					<h1> 예약 수정 </h1><br>

					


					<span style="color:#888">변경을 원하시는 스튜디오를 선택해주세요</span><br><br>
					<div class="row studio">

					
						<c:forEach items="${roomList}" var="room">
							<div class="col-2 aRoom">
																
								<input type="radio" id="${room.roomName}" value="${room.roomNo}" name="roomNo" price="${room.roomDiscountedPrice}"
								 ${rv.roomNo == room.roomNo ? "checked" : " " }>
								<label for="${room.roomName}" >${room.roomName}</label>
								
							</div>
					
						</c:forEach>

					</div>

					<span style="color:#888">예약을 원하시는 일자와 시간을 선택해주세요</span><br><br>
					<div class="row reservationDate">


					
						<div class="col-3 reservationCalender">
							<input type="text" id="datepicker" name="rvDate"
								placeholder="날짜선택" value="${rv.rvDate}" onchange="selectRvTimeList()">
						</div>
						
						<div class="col-5 reservationTime" style="display: inline-block;">

							<input type="radio" id="rv1"  value="09:00~12:00" name="rvTime" ${rv.rvTime == "09:00~12:00" ? "checked" : " " }> 
								<label class ="time" for="rv1">09:00 ~ 12:00</label><br><br> 
								
							<input type="radio" id="rv2" value="12:00~15:00" name="rvTime" ${rv.rvTime == "12:00~15:00" ? "checked" : " " }> 
							<label  class ="time" for="rv2">12:00~ 15:00</label><br> <br>
							
							 <input type="radio" id="rv3"  value="15:00~18:00" name="rvTime" ${rv.rvTime == "15:00~18:00" ? "checked" : " " }>
							  <label class ="time" for="rv3">15:00 ~ 18:00</label>


						</div>
					</div><br>

					<div class="row reservationOption">




						<div class="col-2 optionDetail">옵션 내용</div><br>
						<span style="color:#888">옵션을 선택해주시고 기타 내용을 작성해주세요.</span><br><br>
						<div class="col-8 optionRadio">
							<div class="row">
								<div class="col-5 optionListA">
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


											<label for="${option.optionName}">${option.optionName}</label>
											<br>
										</c:if>
									</c:forEach>
								</div>


								<div class="col-5 optionListB">
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
											<label for="${option.optionName}">${option.optionName}</label>
											<br>
										</c:if>
									</c:forEach>
								</div>
							</div>


						</div>


					</div>
					<div class="row">
						<div class="col-2">이용 인원 수</div>
						<div class="col-2">
							<input type="number" class="form-control" name="rvPeople" value="${rv.rvPeople}"
								required>
						</div>
					</div>

					<div class="row">
						<div class="col-2">방문 차량 수</div>
						<div class="col-2">
							<input type="number" class="form-control" name="rvCars"  value="${rv.rvCars}"  required>
						</div>
					</div>

					<div class="row">
						<div class="col-2">반려 동물 수</div>
						<div class="col-2">
							<input type="number" class="form-control" name="rvAnimals" value="${rv.rvAnimals}" 
								required>
						</div>
					</div>


					<div class="row">
						<div class="col-2">촬영 내용</div>
						<div class="col-7">
							<input type="text" class="form-control" name="rvPurpose" value="${rv.rvPurpose}" required>
						</div>
					</div>

					<div class="row">
						<div class="col-2">비고</div>
						<div class="col-7">
							<textarea rows="5" class="form-control" cols="50" name="rvEtc"
								style="resize: none;" required>${rv.rvEtc} </textarea>
						</div>

					</div>



					<div class="row price">
						<div id="priceText" class="col-8">총 금액</div>
						<div id="totalPrice" class="col-2">0원</div>
					
						<input type="hidden" name="wholePrice" id="wholePrice" value="">
					</div>

					<hr>
					<h4>예약 회원 정보</h4>
					<div class="userInfo">
						<div class="info">
							<div class="text">예약번호</div>
							<div class="infodt">${rv.rvNo}</div>
							</div>
						<div class="info">
							<div class="text">아이디</div>
							<div class="infodt">${rvMember.memberId}</div>
						</div>
						<div class="info">
							<div class="text">이메일</div>
							<div class="infodt">${rvMember.memberEmail}</div>
						</div>
						<div class="info">
							<div class="text">닉네임</div>
							<div class="infodt">${rvMember.memberNick}</div>
						</div>
						<div class="info">
							<div class="text">휴대폰</div>
							<div class="infodt">${rvMember.memberPhone}</div>
						</div>
						<div class="info">
							<div class="text">반려동물</div>
							<c:forEach items="${rvMember.aniList}" var="ani">
							<div class="infodt">${ani.aniName}/${ani.aniGender }/${ani.aniType }/${ani.aniAge }살/${ani.aniKg }kg</div>
							</c:forEach>	
						</div>
						<div style="padding: 10px;"></div>

					</div>
			






			<div class="row4">
				<button class="btn ensemble btn-lg button0" type="submit"
					style="width: 200px;">수정하기</button>
			</div>
	
			</form>
			</div>
		</div>
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
			
			$('input[name="rvTime"]').removeAttr('checked');
			
			const index = $("[name=roomNo]").index($(this));
			const price = Number($(this).attr("price"));

			$("#modifyRvForm")[0].reset();
			


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