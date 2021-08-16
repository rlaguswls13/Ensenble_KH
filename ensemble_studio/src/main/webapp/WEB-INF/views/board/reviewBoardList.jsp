<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pagination.boardName} 게시판</title>
    
    <!-- External CSS-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/reviewBoardList.css">
 
 
 <style>
#board_content{
    box-sizing: border-box;
    width: 500px;
    height: auto;
    margin-left: 1%;
    display: inline-block;
}

#board_img_div{

}

#board_img{
	width: 400px;
    height: 500px;
}

#shell{
    width: 100%;
    text-align: center;
}

</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    
	
        <div class="" id="board_header">
        
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
        </div>

        <div class="row-sm-12 d-flex justify-content-end text-center">
            <c:if test="${!empty loginMember}">
			<a  class="btn btn-insert" id="insertBtn" href='insert'>
				<img src="${contextPath}/resources/images/common/edit.png" width="30px">
			</a>
		</c:if>
        </div>

        <!-- 리뷰 내용 추가-->
        <div class="row-sm-12" id="shell">
        <c:choose>
			<%-- 조회된 게시글 목록이 없는 경우 --%>
			<c:when test="${empty boardList}">
				<span>게시글이 존재하지 않습니다.</span>							
			</c:when>
		<c:otherwise>					
			<c:forEach items="${boardList}" var="board">
        
            <div class="row-sm-12 mr-4 my-4" id="board_content">
                <div class="d-flex row-sm-12">
                    <div class="col-sm-2"><img src="" alt=""></div>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">${board.memberNk}</div>
                </div>
                <div class="row-sm-12">
                    <div class="col-sm-12" id="board_img_div">
                        <a href=""><img id="board_img"src="${board.atList[0].atPath}/${board.atList[0].atName}" alt=""></a>
                    </div>
                </div>
                <div class="d-flex row-sm-12">
                    <div class="col-sm-4">
                        <img src="" alt=""> 댓글
                    </div>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <jsp:include page="like.jsp"/>
                    </div>
                </div>
                <div class="row-sm-12">
                    <div class="col-sm-12" id="title-content">
                        <a href=""><h5>${board.boardTitle}</h5></a>
                    </div>
                </div>
            </div> 
       
    			</c:forEach>
			
			</c:otherwise>
		
		</c:choose>
		 </div>


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
    
	<jsp:include page="../common/footer.jsp"/>
	
    <script>

    </script>

</body>
</html>