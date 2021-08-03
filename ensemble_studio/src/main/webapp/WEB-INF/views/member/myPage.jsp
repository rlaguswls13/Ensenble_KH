<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Bootstrap core JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
 
    <!-- sweetalert API 추가 --> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css" type="text/css" />
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="container">
		<jsp:include page="myPageTopBar.jsp"></jsp:include>

		<div class="content">
			<div class="myPage row">
				<div class="info-form user col-ms-6">
					<div class="info-image info">유저 사진</div>
					<div class="info-nick info">
						<h5>유저 닉네임</h5>
					</div>
					<div class="info-email info">
						<div class="info-eIcon info">그림</div>
						<div class="info-emailView info" value="">user@daum.net</div>
					</div>
					<div class="info-phone info">
						<div class="info-pIcon info">그림</div>
						<div class="info-phoneView info" value="">010-2222-2222</div>
					</div>
				</div>


				<div class="info-form reserve col-me-6">
					<div class="reserve-title">
						<div class="reserve-con">최근 예약 현황</div>
						<button type="submit" class="btn plus-btn">더보기</button>

					</div>

					<div class="reserve-form">
						<div class="reserveNo res">예약번호 : 123456</div>
						<hr>
						<div class="reserveType res">A ROOM</div>
						<div class="reserveDt res">
							<div class="reserveDate">7.22 목</div>
							<div class="vl"></div>
							<div class="reserveTime">오후 1:00 ~ 오후 4:00</div>
						</div>
					</div>
					<div class="reserve-form">
						<div class="reserveNo res">예약번호 : 123456</div>
						<hr>
						<div class="reserveType res">A ROOM</div>
						<div class="reserveDt res">
							<div class="reserveDate">7.22 목</div>
							<div class="vl"></div>
							<div class="reserveTime">오후 1:00 ~ 오후 4:00</div>
						</div>
					</div>
					<div class="reserve-form">
						<div class="reserveNo res">예약번호 : 123456</div>
						<hr>
						<div class="reserveType res">A ROOM</div>
						<div class="reserveDt res">
							<div class="reserveDate">7.22 목</div>
							<div class="vl"></div>
							<div class="reserveTime">오후 1:00 ~ 오후 4:00</div>
						</div>
					</div>
				</div>
			</div>


			<div class="pet-info row">
				<div class="pet-info-title">
					<div class="pet-info-text">반려동물정보</div>
					<button type="submit" class="btn insert-btn">추가하기</button>
				</div>
				<table class="table col-md-12" id="tbl-box">
					<tbody>
						<tr>
							<td rowspan="3" class="petName">이름</td>
							<td rowspan="2" class="col-1 update">ㅇ</td>
							<td class="col-4 petGender">성별 : 여</td>
							<td class="col-3 petAge">나이 : 6살</td>
							<td class="col-1 delete">X</td>
						</tr>
						<tr>
							<td class="petType">종류 : 푸들</td>
							<td class="petKg">몸무게 : 5kg</td>
						</tr>
					</tbody>
					<table class="table col-md-12" id="tbl-box">
						<tbody>
							<tr>
								<td rowspan="3" class="petName">이름</td>
								<td rowspan="2" class="col-1 update">ㅇ</td>
								<td class="col-4 petGender">성별 : 여</td>
								<td class="col-3 petAge">나이 : 6살</td>
								<td class="col-1 delete">X</td>
							</tr>
							<tr>
								<td class="petType">종류 : 푸들</td>
								<td class="petKg">몸무게 : 5kg</td>
							</tr>
						</tbody>
					</table>
					</div>
					</div>
					</div>

					<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>