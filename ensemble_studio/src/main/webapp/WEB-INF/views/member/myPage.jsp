<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>

<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPageTopBar.css" type="text/css" />
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css" type="text/css" />
<style>
	.info-image{
	background-image: url("${contextPath}${loginMember.memberImage}");
	background-size: 120%; 
	background-repeat: no-repeat;
	background-position: center;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="container">
		<!-- 마이페이지 탑바 -->
		<jsp:include page="myPageTopBar.jsp"></jsp:include>

		<div class="content">
			<div class="myPage row">
				<div class="info-form user col-ms-6">
					<div class="info-image info"></div>
					<div class="info-nick info">
						<h5>${loginMember.memberId}</h5>
					</div>
					<div class="info-email info">
						<div class="info-eIcon info">
							<i class="far fa-envelope"></i>
						</div>
						<div class="info-emailView info">${loginMember.memberEmail}</div>
					</div>
					<div class="info-phone info">
						<div class="info-pIcon info">
							<i class="fas fa-phone-alt"></i>
						</div>
						<div class="info-phoneView info">${loginMember.memberPhone}</div>
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
			<div class="row">
				<div class="pet-info">
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
					</table>
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
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
function LoadImg(value, num) {
	if (value.files && value.files[0]) {
		var reader = new FileReader();

		reader.readAsDataURL(value.files[0]);
		
		reader.onload = function(e) {

			$(".boardImg").eq(num).children("img").attr("src",e.target.result);
		}

	}
}
</script>

</html>