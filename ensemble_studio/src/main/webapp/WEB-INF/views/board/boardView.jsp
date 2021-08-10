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
    
    <jsp:include page="../common/header.jsp"/>    
    <!-- External CSS-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/html_checking_div.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/reviewBoardDetail.css">
</head>
<body>
		
		
	
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
											<button id="deleteBtn" class="dropdown-item" type="button"
												data-toggle="modal" data-target="#boardDeleteBtn">삭제</button> 
											<button id="updateBtn" class="dropdown-item" type="button"
												onclick="fnRequest('updateForm');">수정</button> 						
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
      </form>
      <%-- 댓글 영역 --%>
			<jsp:include page="reply.jsp"/>
			<hr>
            
            <a href="list?type=${param.type}&cp=${param.cp}${searchStr}"
            	class="btn btn-primary float-right mr-2">목록으로</a>  
        
        <!-- Modal -->
		<div class="modal fade" id="boardDeleteBtn" tabindex="-1" role="dialog" aria-labelledby="boardDeleteBtnLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="boardDeleteBtnLabel">게시물 삭제</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        게시물을 정말 삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-primary" type="button" onclick="fnRequest('delete');">삭제하기</button>
		       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
		      </div>
		    </div>
		  </div>
		</div>
        
        <%-- footer 영역 --%>
		<jsp:include page="../common/footer.jsp"/>		
		
		<form action="#" method="POST" name="requestForm">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="cp" value="${param.cp}">
			<input type="hidden" name="boardTypeNo" value="${board.boardTypeNo}">
		</form>
</body>
		<script>
			function fnRequest(addr){
				document.requestForm.action = addr;
				document.requestForm.submit();	
			}
			
			function deleteCheck(){
				swal({
					"icon"  : "${icon}",
					"title" : "${title}",
					"text"  : "${text}"
				});				
			}
		</script>

</html>