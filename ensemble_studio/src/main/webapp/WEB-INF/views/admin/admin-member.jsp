<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<jsp:include page="admin-header.jsp"></jsp:include>
</head>
<style>
	.pagination {
		justify-content: center;
	}
	.page-link{
		color:black;		
	}
    .notice-text{
        font-size: smaller;
        color:#888;
        padding-top: 20px;
        width: 70%;
        display: inline-block;
    }
</style>
<body>
	<div class="main_bg">
        <div class="main_content">
           <h3>회원 관리</h3>
           <div style="padding: 5px;"></div>

            <table class="table">
                <thead>
                  <tr style="text-align: center;">
                    <th scope="col" >회원 번호</th>
                    <th scope="col" >아이디</th>
                    <th scope="col" >이메일</th>
                    <th scope="col" >닉네임</th>
                    <th scope="col" >휴대 전화</th>
                    <th scope="col" >상태</th>
                  </tr>
                </thead>

                <tbody>
                <c:forEach items="${mList}" var="m" >
	                <tr style="text-align: center;">
	                    <th scope="row" >${m.memberNo}</th>
	                    <td>${m.memberId}</td>
	                    <td>${m.memberEmail}</td>
	                    <td>${m.memberNick}</td>
	                    <td>${m.memberPhone}</td>
	                    <td>${m.memberStatus}</td>
	                 </tr>
                </c:forEach>
                  

                </tbody>
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
										<a class="page-link" style="background-color:#F9F7EB; color:black;	border-color:#ddd;">
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