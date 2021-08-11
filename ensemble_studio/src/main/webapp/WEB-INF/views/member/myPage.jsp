<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>

<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPageTopBar.css" type="text/css" />
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css?ver=345" type="text/css" />

</head>
<style>
	.info-image{
		background-image: url("${contextPath}${loginMember.memberImage}");
		background-size: 120%; 
		background-repeat: no-repeat;
		background-position: center;
	}
	table a:hover{
		color : #FF657D;
	}
</style>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="container">
		<!-- 마이페이지 탑바  -->
		<jsp:include page="myPageTopBar.jsp"></jsp:include>

		<div class="content">
			<div class="myPage row">
				<div class="info-form user col-md-12 col-lg-4">
					<div class="info-image info" ></div>
					<div class="info-nick info">
						<h5>${loginMember.memberNick}</h5>
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


				<div class="info-form reserve col-md-12 col-lg-4">
					<div class="reserve-title">
						<div class="reserve-con">최근 예약 현황</div>
						<c:if test="${!empty rvList}">
							<a class="btn plus-btn" href="${contextPath}/reservation/rvList">더보기</a>
						</c:if>
					</div>
					<c:if test="${!empty rvList}">
					<c:forEach items="${rvList }" var="rv" begin="0" end="2">
						<div class="reserve-form">
							<div class="reserveNo res">예약번호 : ${rv.rvNo }</div>
							<hr>
							<div class="reserveType res">${rv.roomName}</div>
							<div class="reserveDt res">
								<div class="reserveDate">${fn:substring(rv.rvDate,5,7)}월 ${fn:substring(rv.rvDate,8,10)}일</div>
								<div class="vl"></div>
								<div class="reserveTime">${rv.rvTime }</div>
							</div>
						</div>
					</c:forEach>
					</c:if>
					<c:if test="${empty rvList}">
						<div style="text-align:center; color:#888;"><br><br><br><br><br><br>최근 예약 현황이 없습니다.</div>
					</c:if>
					
					
				</div>
			</div>
			
			
			<div class="row">
				<div class="pet-info">
					<div class="pet-info-title">
						<div class="pet-info-text">반려동물정보</div>
						<a href="insertAnimal" class="btn insert-btn">추가하기</a>
					</div>
					<c:if test="${empty loginMember.aniList}">
					<div style="text-algin:center">반려동물 정보가 없습니다. 추가해주세요.</div>
					</c:if>
					<c:if test="${!empty loginMember.aniList}">
					<c:forEach items="${loginMember.aniList}" var="ani">
						<table class="table col-md-12" id="tbl-box">
							<tbody>
								<tr>
									<td rowspan="3" class="petName"><h3 style="padding-top:18px;">${ani.aniName}</h3></td>
									<td rowspan="2" class="col-1 update"><a href="updateAnimal/${ani.aniNo }"><i class="fas fa-cog"></i></a></td>
									<td class="col-4 petGender">
										성별 : 
										<c:if test="${ani.aniGender eq 'F'}">여</c:if>
										<c:if test="${ani.aniGender eq 'M'}">남</c:if>
									</td>
									<td class="col-3 petAge">나이 : ${ani.aniAge}살</td>
									<td class="col-1 delete"><button type="button" class="btn" id="delete-btn" onclick="deleteAnimal(${ani.aniNo});"><i class="far fa-trash-alt"></i></button></td>
								</tr>
								<tr>
									<td class="petType">종류 : ${ani.aniType}</td>
									<td class="petKg">몸무게 : ${ani.aniKg}KG</td>
								</tr>
							</tbody>
						</table>
					</c:forEach>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
	function deleteAnimal(aniNo){
		swal({
			  title: "정말 삭제하시겠습니까?",
			  text: "한 번 삭제되면, 다시 복구할 수 없습니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  
				  $.ajax({
						url : '${contextPath}/member/deleteAnimal',
						data : { "aniNo" : aniNo },
						type : 'POST',
						success : function(result){
							if(result>0){
								window.location.reload();
								swal({
									  title: "삭제 완료",
									  text: "선택한 정보가 삭제되었습니다.",
									  icon: "success",
									});
							}else{
								alert('삭제 실패');
							}
						}
					})
				  
			  } else {
			    swal("삭제를 취소했습니다.");
			  }
			});
	}
</script>

</html>