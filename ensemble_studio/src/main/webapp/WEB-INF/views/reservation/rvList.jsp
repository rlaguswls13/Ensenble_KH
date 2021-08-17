<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation list</title>


<!-- sweetalert API 추가 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/reservation/rvList.css"
	type="text/css" />
<link rel="stylesheet"
	href="${contextPath}/resources/css/member/myPageTopBar.css" type="text/css" />
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	+






	<div class="outterContainer">

		<jsp:include page="../member/myPageTopBar.jsp"></jsp:include>

		<c:choose>

			<%-- 조회된 주문내역 목록이 없는 경우 --%>
			<c:when test="${empty rvList}">
				<tr>
					<td colspan="6">주문내역이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<%-- 조회된 주문내역 목록이 있을 경우 --%>
			<c:otherwise>

				<c:forEach items="${rvList}" var="reservation">
					<div class="innerContainer">
						<div class="reservationList">
							<div id="reservationNo">예약번호 : ${reservation.rvNo} </div>
							
							<div class="reservationDetail">
								
								<div id="reservationPreview">
									<div class="roomName"> 예약 스튜디오 : ${reservation.roomName} </div>
									<div class="reservationTime">예약 일정 : ${reservation.rvDate} | ${reservation.rvTime}</div>
								</div>
								
							</div>

							<div class="reservationDetailList">
								<div class="detailList1">
									<div class="detail1-1">기본 구성</div>
									<div class="detail1-2">${reservation.roomConfig}</div>
								</div>
								<div class="detailList2">
									<div class="detail2-1">추가 옵션</div>
									<div class="detail2-2">
									<c:if test="${empty reservation.optionList }">없음</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 1 }">${reservation.optionList[0].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 2 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 3 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName},<br> ${reservation.optionList[2].optionName} </c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 4 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName},<br> ${reservation.optionList[2].optionName},<br> ${reservation.optionList[3].optionName},</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 5 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName},<br> ${reservation.optionList[2].optionName},<br> ${reservation.optionList[3].optionName},<br> ${reservation.optionList[4].optionName}, </c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 6 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName},<br> ${reservation.optionList[2].optionName},<br> ${reservation.optionList[3].optionName},<br> ${reservation.optionList[4].optionName}, <br> ${reservation.optionList[5].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 7 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName}, <br> ${reservation.optionList[2].optionName},<br> ${reservation.optionList[3].optionName},<br> ${reservation.optionList[4].optionName}, <br> ${reservation.optionList[5].optionName},<br> ${reservation.optionList[6].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 8 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName}, <br> ${reservation.optionList[2].optionName},<br> ${reservation.optionList[3].optionName},<br> ${reservation.optionList[4].optionName}, <br> ${reservation.optionList[5].optionName},<br> ${reservation.optionList[6].optionName},<br> ${reservation.optionList[7].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 9 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName} , <br> ${reservation.optionList[2].optionName},<br> ${reservation.optionList[3].optionName},<br> ${reservation.optionList[4].optionName}, <br> ${reservation.optionList[5].optionName},<br> ${reservation.optionList[6].optionName},<br> ${reservation.optionList[7].optionName},<br> ${reservation.optionList[8].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 10 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName} , <br> ${reservation.optionList[2].optionName},<br> ${reservation.optionList[3].optionName},<br> ${reservation.optionList[4].optionName}, <br> ${reservation.optionList[5].optionName},<br> ${reservation.optionList[6].optionName},<br> ${reservation.optionList[7].optionName},<br> ${reservation.optionList[8].optionName},<br> ${reservation.optionList[9].optionName}</c:if>
                    	
									
																	
									</div>
								</div>
								<div class="detailList3">
									<div class="detail3-1">비고</div>
									<div class="detail3-2">성인 : ${reservation.rvPeople} , 동물 : ${reservation.rvAnimals}</div>
								</div>
								<hr>
								<div class="totalPrice">가격 ${reservation.wholePrice}원</div>



							</div>


						</div>

					</div>

					<br>
				</c:forEach>

			</c:otherwise>

		</c:choose>
	</div>

	<%---------------------- Pagination start----------------------%>
	<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

	<c:set var="pageURL" value="rvList" />

	<c:set var="prev"
		value="${pageURL}?cp=${pagination.prevPage}" />
	<c:set var="next"
		value="${pageURL}?cp=${pagination.nextPage}" />


	<div class="my-5">
		<ul class="pagination">

			<%-- 현재 페이지가 10페이지 초과인 경우 --%>
			<c:if test="${pagination.currentPage > pagination.pageSize }">
				<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
			</c:if>

			<%-- 현재 페이지가 2페이지 초과인 경우 --%>
			<c:if test="${pagination.currentPage > 2 }">
				<li><a class="page-link"
					href="${pageURL}?cp=${pagination.currentPage - 1}">&lt;</a></li>
			</c:if>



			<%-- 페이지 목록 --%>
			<c:forEach var="p" begin="${pagination.startPage}"
				end="${pagination.endPage}">

				<c:choose>
					<c:when test="${p == pagination.currentPage }">
						<li class="page-item active"><a class="page-link">${p}</a></li>
					</c:when>

					<c:otherwise>
						<li><a class="page-link"
							href="${pageURL}?cp=${p}">${p}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
			<c:if test="${pagination.currentPage < pagination.maxPage }">
				<li><a class="page-link"
					href="${pageURL}?cp=${pagination.currentPage + 1}">&gt;</a></li>
			</c:if>

			<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
			<c:if
				test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
				<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
			</c:if>

		</ul>
	</div>
	<%---------------------- Pagination end----------------------%>







	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>