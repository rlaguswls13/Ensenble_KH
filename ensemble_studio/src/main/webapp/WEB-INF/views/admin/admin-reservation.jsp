<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<body>
	
	<div class="main_bg">
        <div class="main_content">
           <h2 style="display: inline-block;">예약관리</h2>
           <div style="padding: 5px;"></div>

            <table class="table">
                <thead>
                  <tr>
                    <th scope="col" style="text-align: center;">예약번호</th>
                    <th scope="col" style="text-align: center;">예약자명</th>
                    <th scope="col" style="text-align: center;">예약일자</th>
                    <th scope="col" style="text-align: center;">예약상품</th>
                    <th scope="col" style="text-align: center;">옵션</th>
                    <th scope="col" style="text-align: center;">비고</th>
                    <th scope="col" style="text-align: center;">상태</th>
                  </tr>
                </thead>

				<c:forEach items="${totalRvList}" var="reservation">
                <tbody>
                  <tr>
                    <th scope="row" style="text-align: center;"><a href="${reservation.rvNo}?cp=${pagination.currentPage}">${reservation.rvNo}</a></th>
                    <td  style="text-align: center;">Mark</td>
                    <td  style="text-align: center;">${reservation.rvDate}<br>
                            <span style="color: rgb(156, 156, 156);">${reservation.rvTime}</span>
                    </td>
                    <td  style="text-align: center;">A Room</td>
                    <td style="text-align: center;">${reservation.optionList[0].optionName}</td>
                    <td style="text-align: center;">${reservation.rvEtc}</td>
                    <td style="text-align: center;">
                        <select name="selectRvStatus">
                            <option value="대기">대기</option>
                            <option value="취소">취소</option>
                        </select>
                    </td>
                  </tr>
                  

                </tbody>
                </c:forEach>
              </table>
              <hr>
              <div style="padding: 5px;"></div>
              
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
						<li><a class="page-link" href="?cp=${pagination.currentPage - 1}">&lt;</a></li>
					</c:if>
				
					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
						
							<c:choose>
								<c:when test="${p == pagination.currentPage }">
									<li class="page-item active">
										<a class="page-link" style="background-color:#FDCDCD; color:black;	border-color:#ddd;">
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
						<li><a class="page-link" href="?cp=${pagination.currentPage + 1}">&gt;</a></li>
					</c:if>
					
					<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
					<c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
						<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
					</c:if>

				</ul>
			</div>
			<%---------------------- Pagination end----------------------%>
        </div>
	</div>
</body>
</html>