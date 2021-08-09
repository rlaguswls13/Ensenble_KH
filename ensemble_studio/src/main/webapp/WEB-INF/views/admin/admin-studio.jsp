<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<jsp:include page="admin-header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
.pagination {
	justify-content: center;
}

.page-link {
	color: black;
}

.btn-ensemble {
	background-color: #FDCDCD;
	padding-left: 25px;
	padding-right: 25px;
	float: right;
	padding-top: 5px;
	padding-bottom: 5px;
}

.notice-text {
	font-size: smaller;
	color: #888;
	padding-top: 20px;
	width: 70%;
	display: inline-block;
}

select {
	width:50px;
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
			<h3>상품 관리</h3>
			<div class="notice-text">*홈페이지에 표시되는 상품 목록은 최대 3개까지 입니다.</div>

			<a href="studio/insert" class="btn btn-ensemble"
				style="color: black;">추가하기</a>


			<div style="padding: 5px;"></div>

			<table class="table">
				<thead>
					<tr style="text-align: center;">
						<th scope="col">상품 번호</th>
						<th scope="col">상품 이름</th>
						<th scope="col">정상가</th>
						<th scope="col">할인가</th>
						<th scope="col">글 상태</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${rList}" var="r">
						<tr style="text-align: center;">
							<th scope="row">${r.roomNo }</th>
							<td><a href="studio/update/${r.roomNo}" style="color: black;">${r.roomName }</a></td>
							<td>${r.roomPrice }</td>
							<td>${r.roomDiscountedPrice }</td>
							<td>
								<c:if test="${r.roomStatus eq 'Y'}">
									<select name="selectRoomStatus" class="selectY">
										<option value="Y" selected>Y</option>
										<option value="N" >N</option>
									</select>
								</c:if> <c:if test="${r.roomStatus eq 'N'}">
									<select name="selectRoomStatus" class="selectN">
										<option value="Y" >Y</option>
										<option value="N" selected>N</option>
									</select>
								</c:if>
							</td>
						</tr>
					</c:forEach>


				</tbody>
			</table>
			<hr>


			<%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

			<c:set var="prev" value="?cp=${pagination.prevPage}" />
			<c:set var="next" value="?cp=${pagination.nextPage}" />


			<div class="my-5">
				<ul class="pagination">

					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize }">
						<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
					</c:if>

					<%-- 현재 페이지가 2페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > 2 }">
						<li>
						 <a class="page-link" href="?cp=${pagination.currentPage - 1}">&lt;</a>
						</li>
					</c:if>

					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}"
						end="${pagination.endPage}">

						<c:choose>
							<c:when test="${p == pagination.currentPage }">
								<li class="page-item active">
									<a class="page-link" style="background-color: #FDCDCD; color: black; border-color: #ddd;">
										${p} 
									</a>
								</li>
							</c:when>

							<c:otherwise>
								<li><a class="page-link" href="?cp=${p}">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if test="${pagination.currentPage < pagination.maxPage }">
						<li><a class="page-link"
							href="?cp=${pagination.currentPage + 1}">&gt;</a></li>
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
	
	$("select[name=selectRoomStatus]").change(function(){
		var select = $(this);
		//console.log($(this).parent().prev().prev().prev().prev().text());
		$.ajax({
			url : '${contextPath}/admin/studio/updateRoomStatus',
			data : { 
					 "roomNo" : $(this).parent().prev().prev().prev().prev().text(),
				     "roomStatus" : $(this).val()
				    },
			type : 'POST',
			success : function(result){
				if(result>0){
					if(select.val()=='N'){
						select.removeClass().addClass('selectN');
					}else{
						select.removeClass().addClass('selectY');
					}
				}else{
					alert('상태 변경 실패');
					return false;
				}
			}
		})
		
	})
	
	
	
	
	
	</script>
</body>
</html>