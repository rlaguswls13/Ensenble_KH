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
	
<style>
	#review_detail_header{
	margin: 5%;
	}
	
	.btn_normal_board{
	margin-left: 40%;
    float: right;
    }
    
    .vertical-center{
    margin: auto;
    }
    
    .board_category{
    width: 110px;
    border: 1px solid #FF657D;
    background: white;
    margin-bottom: 10px;
    padding : 5px 10px 5px 10px;
    border-radius: 15px;
    text-align: center;
    font-weight: bold;
    color: #FF657D;
    }
	
	.board_view_container{
	margin-left: 20%;
	margin-right: 20%;
	}

	.dropdown-toggle::after{
	  display: none;
	}
	
	.date{
		color :#888;
		margin-left : 20px;
		font-weight : 300;
		width: 400px;
	}
	.btn-dropdown{
		border : 1px solid #ddd;
		border-radius : 100px;
		width:40px; height: 40px;
		position:absolute;
		top:7px;
	}
	.dropdown-box{
		position:relative;
		right:5%;
	}
	.rMImage{
		width:50px; height: 50px;
		border-radius : 100px;
		background-repeat: no-repeat; 
        background-size:cover; 
        background-position: center;
	}
</style>
</head>
<body>
	<div class="board_view_container">
	    
		<div class="my-5" id="review_detail_header">
        <form action="" method="POST" >
                <div class="row-sm-12">
                    <div class="row-sm-12">
                        <div class="col-sm-2 board_category">${board.boardCTNm}</div>
                    </div>
                    <div style="padding:10px;"></div>
                    <div class="row-sm-12 ml-0">
                        <div class="col-sm-12 ml-0 pl-0">
                         <h2 class=" ml-0">${board.boardTitle}</h2>
                         </div>
                    </div>
                    <div style="padding:5px"></div>
                    
                    <c:if test="${board.boardTypeNo!=3}">
                    <div class="row-sm-12 d-flex" >
                        <div class="vertical-center ml-0">
                            <img class="rMImage mr-2" style="background-image:url('${contextPath}${board.memberImage}')" ><br>
                            <span style="line-height:2">${board.memberNk}</span>                                                 
                        </div>
                        <div class="vertical-center">
                        	<div class="date">
                        			<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="boardMT" value="${board.boardMT}" pattern="yyyy-MM-dd"/>
                            	<c:choose>                            		
	                            	<c:when test="${boardMT==today}">
										<fmt:formatDate value="${board.boardMT}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${board.boardMT}" pattern="HH:mm:ss"/>
									</c:otherwise>
								</c:choose>
							</div>
                        </div>
                        
                     	
                        <div class="col-sm-2 text-center vertical-center">
                        	<c:if test="${board.boardTypeNo!=4}">
                        		<jsp:include page="like.jsp"/>
                        	</c:if>
                        </div>
                       
                        
                        <c:if test="${loginMember.memberNo == board.memberNo }">
	                        <div class="dropdown-box">	                        
		                            <button type="button" class="btn btn-dropdown dropdown-toggle" id="dropdownMenu"
		                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
		                                :
		                            </button>
		                            <div class="dropdown-menu" aria-labelledby="dropdownMenu">
											<button id="deleteBtn" class="dropdown-item" type="button"
												data-toggle="modal" data-target="#boardDeleteBtn">삭제</button> 
											<button id="updateBtn" class="dropdown-item" type="button"
												onclick="fnRequest('updateForm');">수정</button> 						
		                            </div>	                        
	                        </div>  
                        </c:if>             
                    </div>
                    
                     </c:if>
                </div>
               
            <hr>
            <div class="board_content" id="review_detail_context">${board.boardContent}</div>     
            <div style="padding:20px"></div> 
            <span style="color:#888">조회수 ${board.boardReadCount}</span>
      </form>
      <%-- 댓글 영역 --%>
      		
      		<c:if test="${board.boardTypeNo != 3}">
				<jsp:include page="reply.jsp"/>
				
         	</c:if>
            <a href="list?type=${param.type}&cp=${param.cp}${searchStr}"
            	class="btn btn-secondary float-right mr-2 btn-insert">목록으로</a>  
        
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
        
        		
		
		<form action="#" method="POST" name="requestForm">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="cp" value="${param.cp}">
			<input type="hidden" name="boardTypeNo" value="${board.boardTypeNo}">
		</form>
		
		</div>
		</div>
		<%-- footer 영역 --%>
		<jsp:include page="../common/footer.jsp"/>
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