<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<jsp:include page="admin-header.jsp"></jsp:include>
</head>
<style>
	.pagination {
		justify-content: center;
	}
	.page-link{
		color:black;		
	}
	.page-item .active{
		background-color : #F9F7EB;
	}
	select {
		width:60px;
		padding: .2em .8em;
		font-family: inherit;
		border-radius: 5px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		font-size : smaller;
	}
	
	.selectY {
		border: 1px solid #7DBC8C;
		background: url('${contextPath}/resources/images/admin/select-green.png')
			no-repeat 85% 50%;
		color: #7DBC8C;
	}
	
	.selectN {
		border: 1px solid #C64242;
		background: url('${contextPath}/resources/images/admin/select-red.png')
			no-repeat 85% 50%;
		color: #C64242;
	}
</style>
<body>
	
	<div class="main_bg">
        <div class="main_content">
           <h2 style="display: inline-block;">예약관리</h2>
           <div style="padding: 5px;"></div>

            <table class="table">
                <thead>
                  <tr style="text-align: center;">
                    <th scope="col">예약번호</th>
                    <th scope="col">예약자명</th>
                    <th scope="col">예약일자</th>
                    <th scope="col">예약상품</th>
                    <th scope="col">옵션</th>
                    <th scope="col">비고</th>
                    <th scope="col">상태</th>
                  </tr>
                </thead>

				<c:forEach items="${totalRvList}" var="reservation">
                <tbody>
                  <tr style="text-align: center;">
                    <th scope="row"><a href="${reservation.rvNo}?cp=${pagination.currentPage}">${reservation.rvNo}</a></th>
                    <td>${reservation.memberNick }</td>
                    <td>${fn:substring(reservation.rvDate, 5,7)}월 ${fn:substring(reservation.rvDate, 8,10)}일<br>
                            <span style="color: #ccc;">${reservation.rvTime}</span>
                    </td>
                    <td>${reservation.roomName }</td>
                    <td>
                    	<c:if test="${empty reservation.optionList }">없음</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 1 }">${reservation.optionList[0].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 2 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) >= 3 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName} ...</c:if>
                    </td>
                    <td>
                    	<c:if test="${fn:length(reservation.rvEtc) < 10}">${reservation.rvEtc}</c:if> 
                    	<c:if test="${fn:length(reservation.rvEtc) >= 11}">${fn:substring(reservation.rvEtc, 0, 11)}...</c:if> 
                    </td>
                    <td>
                     	<c:if test="${reservation.rvStatus eq 'Y'}">
	                        <select name="selectRvStatus" class="selectY">
		                            <option value="Y" selected>대기</option>
		                            <option value="N">취소</option>
	                        </select>
                        </c:if>
                     	<c:if test="${reservation.rvStatus eq 'N'}">
	                        <select name="selectRvStatus" class="selectN">
		                            <option value="Y" >대기</option>
		                            <option value="N" selected>취소</option>
	                        </select>
                        </c:if>
                    </td>
                  </tr>
                  

                </tbody>
                </c:forEach>
              </table>
              <hr>
              <div style="padding: 5px;"></div>
              
           	<%---------------------- Pagination start----------------------%>
	<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

	<c:set var="pageURL" value="reservation" />

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
						<a class="page-link" style="background-color: #FDCDCD; color: black; border-color: #ddd;">${p}</a>
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
        </div>
	</div>
	
	
	<script>
	$("select[name=selectRvStatus]").change(function(){
		var select = $(this);
		//console.log($(this).parent().prev().prev().prev().prev().text());
		$.ajax({
			url : '${contextPath}/admin/reservation/updateRvStatus',
			data : { 
					 "rvNo" : $(this).parent().prev().prev().prev().prev().prev().prev().text(),
				     "rvStatus" : $(this).val()
				    },
			type : 'POST',
			success : function(result){
				if(result>0){
					if(select.val()=='N'){
						select.removeClass().addClass('selectN');
					}else{
						select.removeClass().addClass('selectY');
					}
				}
			}
		})
		
	})
	
	
	</script>
</body>
</html>