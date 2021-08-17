<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pagination.boardName}</title>

	<!-- External CSS-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/normalBoardList.css">



</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	
	
	<%-- 검색 상태 유지를 위한 쿼리스트링용 변수 선언 --%>
	<c:if test="${!empty param.sk && !empty param.sv }">
		<c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}"  />
	</c:if>
	
	<c:if test="${pagination.boardTypeNo == 3}">
	<div class="top-box">
	    <div style="padding:20px"></div>
      	<h3 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600; display:block;">${pagination.boardName }</h3>
		
		<div class="my-5">
			<!-- 검색창 -->
			<form action="list" method="GET" class="text-center" id="searchForm">
				
				<!-- 게시판 타입 유지를 위한 태그 -->
				<input type="hidden" name="type" value="${pagination.boardTypeNo}">
				<input type="hidden" name="btcN" value="${pagination.boardCTNo}">
					
				<select name="sk" class="form-control" style="width: 100px; display: inline-block;">
					<option value="title">글제목</option>
					<option value="content">내용</option>
					<option value="titcont">제목+내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" name="sv" class="searchInput" style="width: 40%; display: inline-block;" placeholder="궁금한 것을 물어보세요.">
				
			</form>
		
			<!-- 카테고리 버튼 -->
			<div class="category">
				<form action="list" method="GET" id="categoryForm" class="text-center">
					<button class="btn-sm btn-category-checked" id="ct-btn0">전체</button>
					<button class="btn-sm btn-category" id="ct-btn1" name="bctN" value="${typeList[0].boardCTNo}">${typeList[0].boardCTNm}</button>
					<button class="btn-sm btn-category" id="ct-btn2" name="bctN" value="${typeList[1].boardCTNo}">${typeList[1].boardCTNm}</button>
					<button class="btn-sm btn-category" id="ct-btn3" name="bctN" value="${typeList[2].boardCTNo}">${typeList[2].boardCTNm}</button>
				</form>
			</div>
		</div>
	</div>
	</c:if>

	<c:if test="${pagination.boardTypeNo == 4}">
	<div style="padding:20px"></div>
    <h3 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600; display:block;">${pagination.boardName }</h3>
	</c:if>
	
	<div class="container my-5">
	
		<%-- 로그인 되어 있을 경우에만 글쓰기 버튼 노출 --%>
		<c:if test="${loginMember.memberGrade eq 'A' && pagination.boardTypeNo == 3}">
			<a  class="btn btn-insert" id="insertBtn" href='insert'>
				<img src="${contextPath}/resources/images/common/edit.png" width="30px">
			</a>
		</c:if>
		<c:if test="${loginMember.memberGrade eq 'G' && pagination.boardTypeNo == 4}">
			<div style="float:right; margin-bottom:10px; display:inline-block;">
				<a  class="btn btn-ensemble" id="insertBtn" href='insert'>
					<img src="${contextPath}/resources/images/common/edit.png" width="20px" style="margin-right:5px;">
					문의하기
				</a>
			</div>
		</c:if>
		
		<c:if test="${pagination.boardTypeNo == 4}">
		<div class="category">
				<form action="list" method="GET" id="categoryForm">
					<button class="btn-sm btn-category-checked" id="ct-btn0">전체</button>
					<button class="btn-sm btn-category" id="ct-btn1" name="bctN" value="${typeList[0].boardCTNo}">${typeList[0].boardCTNm}</button>
					<button class="btn-sm btn-category" id="ct-btn2" name="bctN" value="${typeList[1].boardCTNo}">${typeList[1].boardCTNm}</button>
					<button class="btn-sm btn-category" id="ct-btn3" name="bctN" value="${typeList[2].boardCTNo}">${typeList[2].boardCTNm}</button>
				</form>
			</div>
		
		</c:if>

		
			<div class="list-wrapper">

				<table class="table table-hover my-1" id="list-table">
					
					<thead>
						<tr>
							<th>글번호</th>
							<th>분류</th>
							<th>제목</th>
							<c:if test="${pagination.boardTypeNo == 4}"><th>작성자</th></c:if>
							<th>작성일</th>
							<c:if test="${pagination.boardTypeNo == 4}"><th>상태</th></c:if>
						</tr>
					</thead>
					
					
					
					
					
					<%-- 게시글 목록 출력 --%>
					<tbody>
						<c:choose>
							<%-- 조회된 게시글 목록이 없는 경우 --%>
							<c:when test="${empty boardList}">
								<tr>
									<td colspan="6">게시글이 존재하지 않습니다.</td>
								</tr>								
							</c:when>
							<c:otherwise>
							<%-- 조회된 게시글 목록이 있을 경우 --%>
							<c:forEach items="${boardList}" var="board">
							<c:choose>
							<c:when test="${board.boardTypeNo == 3}">
									<tr>
										<%-- 글 번호 --%>
										<td> ${board.boardNo} </td>	
										
										<%-- 카테고리 --%>
										<td> ${board.boardCTNm} </td>
										
										<%-- 글 제목 --%>
										<td class="boardTitle">                                                         
											<a href="${board.boardNo}?cp=${pagination.currentPage}${searchStr}">
											${board.boardTitle}
											</a>
										</td>
									
										<%-- 작성일 --%>
										<td> 
											<fmt:formatDate var="createDate" value="${board.boardDT}"  pattern="yyyy-MM-dd"/>                          
											<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>                          
											
											<c:choose>
												<%-- 글 작성일이 오늘이 아닐 경우 --%>
												<c:when test="${createDate != today}">
													${createDate}
												</c:when>
												<%-- 글 작성일이 오늘일 경우 --%>
												<c:otherwise>
													<fmt:formatDate value="${board.boardDT}"  pattern="HH:mm"/>                          
												</c:otherwise>
											</c:choose>
										</td>	
							
										<%-- 글 상태 --%>
										<c:if test="${pagination.boardTypeNo == 4}">
											<td> ${board.boardStatus} </td>
										</c:if>
										
									</tr>
							</c:when>
							<c:when test="${loginMember.memberNo == board.memberNo && board.boardTypeNo == 4}">					
								
									<tr>
										<%-- 글 번호 --%>
										<td> ${board.boardNo} </td>	
										
										<%-- 카테고리 --%>
										<td> ${board.boardCTNm} </td>
										
										<%-- 글 제목 --%>
										<td class="boardTitle">                                                         
											<a href="${board.boardNo}?cp=${pagination.currentPage}${searchStr}">
											${board.boardTitle}
											</a>
										</td>
										
										<%-- 작성자 --%>
										<td> ${board.memberNk} </td>
										
										<%-- 작성일 --%>
										<td> 
											<fmt:formatDate var="createDate" value="${board.boardDT}"  pattern="yyyy-MM-dd"/>                          
											<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>                          
											
											<c:choose>
												<%-- 글 작성일이 오늘이 아닐 경우 --%>
												<c:when test="${createDate != today}">
													${createDate}
												</c:when>
												<%-- 글 작성일이 오늘일 경우 --%>
												<c:otherwise>
													<fmt:formatDate value="${board.boardDT}"  pattern="HH:mm"/>                          
												</c:otherwise>
											</c:choose>
										</td>	
							
										<%-- 글 상태 --%>
										<c:if test="${pagination.boardTypeNo == 4}">
											<td> ${board.boardStatus} </td>
										</c:if>
										
									</tr>
							</c:when>
							<c:when test="${loginMember.memberGrade eq 'A' && board.boardTypeNo == 4}">					
								
									<tr>
										<%-- 글 번호 --%>
										<td> ${board.boardNo} </td>	
										
										<%-- 카테고리 --%>
										<td> ${board.boardCTNm} </td>
										
										<%-- 글 제목 --%>
										<td class="boardTitle">                                                         
											<a href="${board.boardNo}?cp=${pagination.currentPage}${searchStr}">
											${board.boardTitle}
											</a>
										</td>
										
										<%-- 작성자 --%>
										<td> ${board.memberNk} </td>
										
										<%-- 작성일 --%>
										<td> 
											<fmt:formatDate var="createDate" value="${board.boardDT}"  pattern="yyyy-MM-dd"/>                          
											<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>                          
											
											<c:choose>
												<%-- 글 작성일이 오늘이 아닐 경우 --%>
												<c:when test="${createDate != today}">
													${createDate}
												</c:when>
												<%-- 글 작성일이 오늘일 경우 --%>
												<c:otherwise>
													<fmt:formatDate value="${board.boardDT}"  pattern="HH:mm"/>                          
												</c:otherwise>
											</c:choose>
										</td>	
							
										<%-- 글 상태 --%>
										<c:if test="${pagination.boardTypeNo == 4}">
											<td> ${board.boardStatus} </td>
										</c:if>
										
									</tr>
							</c:when>
							</c:choose>
							</c:forEach>
							</c:otherwise>
						</c:choose>

					
					</tbody>
				</table>
			</div>

			
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
	
	<jsp:include page="../common/footer.jsp"/>

	
	<script>
			// 검색 내용이 있을 경우 검색창에 해당 내용을 작성해두는 기능
			(function(){
				var searchKey = "${param.sk}"; 
				// 파라미터 중 sk가 있을 경우   ex)  "abc"
				// 파라미터 중 sk가 없을 경우   ex)  ""
				var searchValue = "${param.sv}";
				
				// 검색창 select의 option을 반복 접근
				$("select[name=sk] > option").each(function(index, item){
					// index : 현재 접근중인 요소의 인덱스
					// item : 현재 접근중인 요소
					if( $(item).val() == searchKey  ){
						$(item).prop("selected", true);
					}
				});		
				
				// 검색어 입력창에 searcValue 값 출력
				$("input[name=sv]").val(searchValue);
			})();
			
			
			$(document).ready(function(){
				if(location.href.toString().includes("bctN=1")){
					$("#ct-btn0").removeClass("btn-category-checked").addClass("btn-category");
					$("#ct-btn1").removeClass("btn-category").addClass("btn-category-checked");
				}
				if(location.href.toString().includes("bctN=2")){
					$("#ct-btn0").removeClass("btn-category-checked").addClass("btn-category");
					$("#ct-btn2").removeClass("btn-category").addClass("btn-category-checked");
				}
				if(location.href.toString().includes("bctN=3")){
					$("#ct-btn0").removeClass("btn-category-checked").addClass("btn-category");
					$("#ct-btn3").removeClass("btn-category").addClass("btn-category-checked");
				}
				
				
			})
			
			
	</script>
	
</body>
</html>
