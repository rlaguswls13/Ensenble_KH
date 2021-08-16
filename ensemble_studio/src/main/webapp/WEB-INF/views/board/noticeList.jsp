<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice</title>
   
</head>
<jsp:include page="../common/header.jsp"></jsp:include>
<style>
    .notice-img{
        width: 100%; height: 200px;
        border: 1px solid rgb(182, 182, 182);
        margin-bottom: 10px;
        background-repeat: no-repeat; 
        background-size:cover; 
        background-position: center;
    }
    .pagination {
		justify-content: center;
	}
	
	.page-link {
		color: black;
	}
	
	.btn-ensemble {
		float:right;
		background-color: #FDCDCD;
		padding-left: 25px;
		padding-right: 25px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
</style>
<body>

      <div style="padding:20px"></div>
      <h3 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Notice</h3>
      <div style="padding:10px"></div>
      <div class="container">
      
	      <c:if test="${!empty boardList}">
	      <c:forEach items="${boardList}" var="notice">
	      	<c:if test="${!empty notice.atList }">
	      	<a href="${notice.boardNo}?cp=${pagination.currentPage}">
	      	<img class="notice-img" style="background-image:url('${notice.atList[0].atPath}/${notice.atList[0].atName}')">
	      	</a>
	      	</c:if>
	      	<c:if test="${empty notice.atList }">
	      	<a href="${notice.boardNo}?cp=${pagination.currentPage}">
	      	<img class="notice-img" style="background-image:url('/ensemble/resources/images/common/notice.png')">
	      	</a>
	      	</c:if>
		      
		        <div style="padding-bottom: 20px;">
		            <h6 style="display: inline-block;">
		            <a href="${notice.boardNo}?cp=${pagination.currentPage}">
		            [ ${notice.boardCTNm}] ${notice.boardTitle }
		            </a>
		            </h6>
		            <span style="float: right; color:#888">조회수 ${notice.boardReadCount }</span>
		      </div>
	      </c:forEach>
	      </c:if>
	      <div style="padding:20px;"></div>
	      
	      <%-- 관리자 로그인 되어 있을 경우에만 글쓰기 버튼 노출 --%>
			<c:if test="${loginMember.memberGrade eq 'A'}">
				<a  class="btn btn-ensemble float-right" id="insertBtn" href='insert'>글쓰기</a>
			</c:if>
			
			
			<%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
			
			<c:set var="pageURL" value="list"  />
			<c:set var="bCTNo" value= "${pagination.boardCTNo}"/>
			<c:set var="prev" value="${pageURL}?bctN=${bCTNo}&cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next" value="${pageURL}?bctN=${bCTNo}&cp=${pagination.nextPage}${searchStr}" />
			
			
			<div class="my-5">
				<ul class="pagination">
				
					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize }">
						<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
					</c:if>
					
					<%-- 현재 페이지가 1페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > 1 }">
						<li><a class="page-link" href="${pageURL}?bctN=${bCTNo}&cp=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
					</c:if>
					
					
				
					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
						
							<c:choose>
								<c:when test="${p == pagination.currentPage }">
									<li class="page-item active">
										<a class="page-link" style="background-color: #FDCDCD; color: black; border-color: #ddd;">${p}</a>
									</li>
								</c:when>
								
								<c:otherwise>
									<li><a class="page-link" href="${pageURL}?bctN=${bCTNo}&cp=${p}${searchStr}">${p}</a></li>
								</c:otherwise>
							</c:choose>						
					</c:forEach>
					
					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if test="${pagination.currentPage < pagination.maxPage }">
						<li><a class="page-link" href="${pageURL}?bctN=${bCTNo}&cp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
					</c:if>
					
					<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
					<c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
						<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
					</c:if>

				</ul>
			</div>
			<%---------------------- Pagination end----------------------%>
		
      </div>

      <div style="padding:30px;"></div>

      
      <jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>


