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
<style>
.container {
	width: 1000px;
	height: 1600px;
	border: 1px solid gray;
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


		<!-- 아이디 -->
		<div class="row mb-3 form-row">
			<div class="col-md-2">
				<h6>아이디</h6>
			</div>
			<div class="col-md-5">
				<h5 id="id"></h5>
			</div>
		</div>

		<!-- 이름 -->
		<div class="row mb-3 form-row">
			<div class="col-md-2">
				<h6>이름</h6>
			</div>
			<div class="col-md-5">
				<h5 id="name"></h5>
			</div>
		</div>
		
			<!-- 예약 일자 -->
			<div class="row mb-3 form-row">
				<div class="col-md-2">
					<label for="memberEmail">예약 일자</label>
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="rvDate" name="rvDate" value="${rv.rvDate}">
				</div>
			</div>
			<!-- 예약 시간 -->
			<div class="row mb-3 form-row">
				<div class="col-md-2">
					<label for="memberEmail">예약 시간</label>
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="rvTime" name="rvTime"
						value="${rv.rvTime }">
				</div>
			</div>
		
			<!-- 예약 상품 -->
			<div class="row mb-3 form-row">
				<div class="col-md-2">
					<label for="memberEmail">예약 상품</label>
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="rvProduct"
						name="rvProduct" value="A Room">
				</div>
			</div>
			<br>
		

			<div class="reservationOption1">
				<div class="reservationOption">
					<div class="optionDetail">옵션 내용</div>
					<div class="optionRadio">

						<div class="optionListA">
							<c:forEach items="${optionList}" var="option">
								<c:if test="${option.optionType== 'G'}">
									<input type="checkbox" id="${option.optionName}"
										value="${option.optionNo}" name="option">
									<label for="${option.optionName}">${option.optionName})</label>
									<br>
								</c:if>
							</c:forEach>
						</div>

						<div class="optionListB">
							<c:forEach items="${optionList}" var="option">
								<c:if test="${option.optionType == 'A'}">
									<input type="checkbox" id="${option.optionName}"
										value="${option.optionNo}" name="option">
									<label for="${option.optionName}">${option.optionName})</label>
									<br>
								</c:if>
							</c:forEach>
						</div>



					</div>

				</div>
				<br>
				<br>
				<br>
				<div class="rvDetail2">
					
					이용 인원 수 : <input type="text" value="${rv.rvPeople }"><br>
					<br> 방문 차량 수 : <input type="text" value="${rv.rvCars}"><br>
					<br> 반려 동물 수 : <input type="text" value="${rv.rvAnimals}"><br>
					<br> 촬영 내용 &nbsp;&nbsp;&nbsp; : <input type="text" value="${rv.rvPurpose}"><br>
					<br>

					<div id="etcText">
						비고 :<br>
					</div>
					<div id="etcBoxt">
						<textarea rows="8" cols="50" name="ta" style="resize: none;">${rv.rvEtc}  </textarea>
					</div>
					

				</div>
					
				<hr>


		



				<div class="row4">
					<button class="btn btn-primary btn-lg button0" type="submit"
						style="width: 200px;">수정하기</button>
				</div>



			</div>
	</div>
</body>
</html>