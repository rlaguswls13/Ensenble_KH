<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

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
.bold-text{
	display:inline-block;
	width : 200px;
	color: black;
}
.room-img{
	width : 180px; height:150px;
	 background-repeat: no-repeat; 
     background-size:cover; 
     background-position: center;
}
    .btn-ensemble{
        background-color: #FDCDCD;
        padding-left: 25px; padding-right: 25px;
        float: right;
        margin-right: 20px;
        padding-top : 5px; padding-bottom: 5px;
    }
</style>
<body>

	<div class="container">
		<div style="padding:10px"></div>
		
		<form method="POST" action="reservation" class="needs-validation"
			name="reservationForm" id="reservationForm"
			onsubmit="return validate();">

			<h3 style="font-family: 'Noto Serif KR', serif; font-weight: 600; display:block; line-height:3">Reservation</h3>
			
			<div class="studio">
				<h5 class="bold-text">1. 스튜디오 선택</h5>
				<span style="color:#888">원하시는 스튜디오를 선택해주세요</span>
				<div style="padding:5px;"></div>
				
				<c:forEach items="${roomList}" var="room">
				<div class="aRoom">
					<input type="radio" id="roomNo" value="${room.roomNo}" name="roomNo"
						price="${room.roomDiscountedPrice}"> <label for="${room.roomName}">${room.roomName}</label><br>
					<img class="room-img" style="background-image:url('${contextPath}/${room.filePath}/${room.fileName}')">
				</div>
				</c:forEach>
			
			</div>
			
			<div class="reservationDate">
				<h5 class="bold-text">2. 예약 일자 및 시간</h5>
				<span style="color:#888">예약을 원하시는 일자와 시간을 선택해주세요</span>
				<div style="padding:5px;"></div>

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
				
				<h5 class="bold-text">3. 촬영 정보 선택</h5>
				<span style="color:#888">옵션을 선택해주시고 기타 내용을 작성해주세요.</span>
				<div style="padding:10px;"></div>
				
					<div class="optionDetail">옵션 내용</div>


					<div class="optionRadio">

						<div class="optionListA">
							<c:forEach items="${optionList}" var="option">
								<c:if test="${option.optionType== 'G'}">
									<input type="checkbox" id="${option.optionName}"
										value="${option.optionNo}" name="option"
										price="${option.optionPrice}">
									<label for="${option.optionName}">${option.optionName}</label>
									<br>
								</c:if>
							</c:forEach>
						</div>

						<div class="optionListB">
							<c:forEach items="${optionList}" var="option">
								<c:if test="${option.optionType == 'A'}">
									<input type="checkbox" id="${option.optionName}"
										value="${option.optionNo}" name="option"
										price="${option.optionPrice}" >
									<label for="${option.optionName}">${option.optionName})</label>
									<br>
								</c:if>
							</c:forEach>
						</div>



					</div>


				</div>
				<c:forEach items="${rv}" var="reservation"></c:forEach>
				<div class="row">
					<div class="col-2">
						이용 인원 수 
					</div>
					<div class="col-2">
						<input type="number" class="form-control" name="rvPeople" value="${rv.rvPeople}"  required>
					</div>
				</div>
				<div style="padding:10px"></div>
				<div class="row">
					<div class="col-2">
						방문 차량 수 
					</div>
					<div class="col-2">
						<input type="number" class="form-control" name="rvCars" value="${rv.rvCars}" required>
					</div>
				</div>
				<div style="padding:10px"></div>
				<div class="row">
					<div class="col-2">
						반려 동물 수 
					</div>
					<div class="col-2">
						<input type="number" class="form-control" name="rvAnimals" value="${rv.rvAnimals}" required>
					</div>
				</div>
				<div style="padding:10px"></div>
				
				<div class="row">
					<div class="col-2">
						촬영 내용
					</div>
					<div class="col-7"><input type="text" class="form-control" name="rvPurpose" value="${rv.rvPurpose}" required></div>
				</div>
				<div style="padding:10px"></div>
				<div class="row">
					<div class="col-2">
						비고
					</div>
					<div class="col-7">
						<textarea rows="5" class="form-control" cols="50" name="rvEtc" style="resize: none;" required>${rv.rvEtc}</textarea>
					</div>
					
				</div>
			</div>
			
			<div style="padding:40px"></div>

			<div class="reservationAttention">
				<div id="reservationAttentionText">
									
				<h5 class="bold-text">4. 예약시 주의사항</h5>
				<span style="color:#888">주의사항을 필독해주세요</span>
				</div>
				<div style="padding:5px;"></div>
				
				<div class="reservationAttentionSentence">
					예약 시 꼭 알아두세요!<br> 예약 가능한 스튜디오 및 시간을 확인하신 후 예약을 진행해주세요.<br>
					세트장 예약은 사이트를 통해서만 가능합니다. 유선 예약은 불가합니다.<br> 이용시간은 촬영시간이 아닌
					입장시간과 퇴장시간(정리시간 포함)을 기준으로 합니다.<br> 기준 인원(4인) 초과시 한시간에 1인당 5천원의
					추가요금이 발생됩니다.<br> 스케줄 취소 및 변경 요청은 1:1 상담 게시판을 이용해 주시기 바랍니다.<br>
					3시간 이하의 촬영시 예약시간보다 빨리 끝나는 경우라도 예약시간 기준으로 금액을 산정합니다.<br> 촬영으로
					인해 발생된 오염이나 파손에 대해서는 복구해주셔야 하며,<br> 가구나 구조물에 복구 불가한 손상이 발생시
					비용이 청구됩니다.<br> 스튜디오 사전 답사 희망시 방문 가능한 시간을 유선으로 확인하신 후 답사하여 주시기
					바랍니다.<br> 영상 및 광고, 화보, 가구촬영 등 다수의 인원 및 장비가 필요한 촬영은 전화문의 후 예약을
					부탁드립니다.<br> 룸 별 스타일링이 주기적으로 바뀌므로 꼭 필요하신 소품이 있으실 경우 촬영 전 전화문의
					부탁드립니다.<br> 주차는 팀당 3대 가능합니다.<br>



				</div>

			</div>
			<hr>
			<div class="price">
				<div id="totalPrice">0원</div>
				<input type="hidden" name="wholePrice" id="wholePrice" value="">
				<div id="priceText">총 금액</div>
			</div>
			<hr>
			
			<div style="padding:10px"></div>
			
			<h3>회원정보</h3>
			
			<div style="padding:10px"></div>
				
			<div class="userInfo">
				<div class="info">
					<div class="text">아이디</div>
					<div class="infodt">${loginMember.memberId}</div>
				</div>
				<div class="info">
					<div class="text">이메일</div>
					<div class="infodt">${loginMember.memberEmail}</div>
				</div>
				<div class="info">
					<div class="text">닉네임</div>
					<div class="infodt">${loginMember.memberNick}</div>
				</div>
				<div class="info">
					<div class="text">휴대폰</div>
					<div class="infodt">${loginMember.memberPhone}</div>
				</div>
				<div class="info">
					<div class="text">반려동물 </div>
					<div class="infodt">
						<c:forEach items="${loginMember.aniList}" var="ani">
						${ani.aniName}/${ani.aniGender }/${ani.aniType }/${ani.aniAge }살/${ani.aniKg }kg<br>				
						</c:forEach> 
					</div>
				</div>
				<div style="padding:10px;"></div>

			</div>
			<hr>

			<div class="row4">
				<button class="btn btn-ensemble btn-lg button1 " type="submit">예약하기</button>
			</div>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>



	
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
		/* 	$("#optionlist").ready(function(){
				var inputValue = $("input[name='optionList']:checked".val();
			});
		 */
		/*예약 버튼 클릭시 */
		/* function validate() {
			const roomNo = $("input[name='roomNo']"); //방번호
			const rvDate = $("input[name='rvDate']"); //예약일 
			const rvPeople = $("input[name='rvPeople']"); //예약시간 
			const rvCars = $("input[name='rvCars']"); //방문차량수 
			const rvAnimals = $("input[name='rvAnimals']"); //방려 동물 수 
			const rvPurpose = $("input[name='rvPurpose']"); //촬영 내용
			const rvTime = $("input[name='rvEtc']"); //비고 
			const inputOption = $("<input>", {
				type : "checkbox",
				name : "optionList",
				value : "input[name='optionList']:checked".val()
			});
			console.log(roomNo)
			console.log(rvDate)
			console.log(rvPeople)
			console.log(rvTime)
			console.log(rvAnimals)
			console.log(rvPurpose)
			console.log(rvTime)
			console.log(inputOption)
		} */
		 
		 $("[name=roomNo]").on("change", function(){
			 const index = $("[name=roomNo]").index($(this));
			 const price = Number($(this).attr("price"));
			 
			 $("#reservationForm")[0].reset();
			 
			 $("[name=roomNo]").eq(index).prop("checked", true);
			 
			 // reservationForm
			 $("#totalPrice").text(price + "원");
			 $("#wholePrice").val(price);
		 })
		  
		 // 옵션 값이 변할 때 마다
			 
		 $("[name=option]").on("change", function(){
			 
			 let totalPrice = 0;
			 
			 $("[name=option]").each(function(){
				
				if( $(this).prop("checked") == true){
					totalPrice += Number($(this).attr("price"));
				}
				
			
				
			 });
			 
			 totalPrice += Number( $("[name=roomNo]").attr("price") );
			 
			 $("#totalPrice").text(totalPrice + "원");
			
			 
			 $("#wholePrice").val(totalPrice);
			 
			 console.log($("#wholePrice").val())
			 
		 });
		
		 
		 
		 
		 
		 
		 
	</script>

	
	

</body>

</html>

