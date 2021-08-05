<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>boardView</title>
    
    <!-- External CSS-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/html_checking_div.css">
<%--     <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/reviewBoardDetail.css">
 --%>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
   
    <!-- JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    
    <!-- sweetalert API 추가 --> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
		<%-- <jsp:include page="../common/header.jsp"/> --%>
		
	
        <form action="" method="POST">
            <div class="" id="review_detail_header">
                <div class="row-sm-12">
                    <div class="row-sm-12">
                        <div class="col-sm-12">${board.boardCTNm}</div>
                    </div>
                    <div class="row-sm-12">
                        <div class="col-sm-12">${board.boardTitle}</div>
                    </div>
                    <div class="row-sm-12 d-flex text-center">
                        <div class="col-sm-2">
                            <img src="" alt="">
                            <span>작성자 : ${board.memberNk}</span>
                        </div>
                        <div class="col-sm-3">
                            <span>
								작성일  : <fmt:formatDate value="${board.boardDT}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>                     
						        <br>
						        수정일  : <fmt:formatDate value="${board.boardMT}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
							</span>
                        </div>
                        <div class="col-sm-3">
                            <span>좋아요</span>
                        </div>
                        <div class="col-sm-2">
                            <span>조회수 ${board.boardReadCount}</span>
                        </div>
                        <c:if test="${loginMember.memberNo == board.memberNo }">
	                        <div class="dropdown mr-1">	                        
		                            <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset"
		                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
		                            </button>
		                            <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
											<button id="deleteBtn" class="dropdown-item">삭제</button> 
											<button id="updateBtn" class="dropdown-item" onclick="fnRequest('updateForm');">수정</button> 						
		                            </div>	                        
	                        </div>  
                        </c:if>             
                    </div>
                </div>
            </div>
            <hr>
            <div class="" id="review_detail_context">
                ${board.boardContent}
            </div> 
            
            
            <%-- 댓글 영역 --%>
			<jsp:include page="reply.jsp"/>
			<hr>
            
            <a href="list?type=${param.type}&cp=${param.cp}${searchStr}"
            	class="btn btn-primary float-right mr-2">목록으로</a>
        </form>
        
        
        <%-- footer 영역 --%>
			<jsp:include page="../common/footer.jsp"/>
</body>


</html>