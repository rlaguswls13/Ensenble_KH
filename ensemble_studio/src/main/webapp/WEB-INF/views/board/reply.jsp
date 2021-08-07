<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<hr>
       <h5 id="replyTitle">댓글 (수)</h5>
    <hr>
            
            <c:if test="${!empty loginMember}">      
	            <div class="row-sm-12 d-flex" id="input-replyArea">
	                <div class="col-sm-1">
	                    <img src="${loginMember.memberImage}" alt="null">
	                    <br>
	                    <span>${loginMember.memberNick}</span>
	                </div>
	                <div class="col-sm-11">
	                    <input id="input-reply" size="100%">
	                    <button class="btn btn-primary" id="addReply" onclick="addReply();">등록</button>
	                </div>
	            </div>
            </c:if>
            
		<c:forEach items="${rList}" var="reply">
			<li class="reply-row">
	            <div class="row-sm-12 d-flex" id="detail-replyArea">
	                <div class="col-sm-1">
	                    <img class="rMImage" src="${reply.memberImage}" alt="null">
	                    <br>
	                    <span class="rWriter">${reply.memberNk}</span>
	                </div>
	                <div class="col-sm-11">
	                    <div class="row-sm-12 d-flex">
	                        <div class="col-sm-10 rContent">
	                        	${reply.replyContent}
	                        </div>
		                        <c:if test="${!empty loginMember}">
			                        <div class="dropdown mr-1">
			                            <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset"
			                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
			                            </button>
			                           
			                            <div class="dropdown-menu replyBtnArea" aria-labelledby="dropdownMenuOffset">                            
				                            <c:choose>
				                            	<c:when test="${loginMember.memberNo == reply.memberNo}">
						                            <a class="dropdown-item" onclick="showUpdateReply(${reply.replyNo}, this)">수정</a>
						                            <a class="dropdown-item" onclick="deleteReply(${reply.replyNo})">삭제</a>
					                            </c:when>
					                            <c:when test="${loginMember.memberNo != reply.memberNo}">
					                            	<a class="dropdown-item" onclick="reportReply(${reply.replyNo})">신고</a>
					                           	</c:when>
				                            </c:choose>                        
			                            </div>
			                            
			                        </div>  
		                        </c:if> 
	                    </div>
	
	                    <div class="row-sm-12 d-flex">
	                        <div class="col-sm-4">
	                            <span>                            
		                            <fmt:formatDate var="cDate" value="${reply.replyDT}"  pattern="yyyy-MM-dd"/>                          
		                            <fmt:formatDate var="mDate" value="${reply.replyMT}"  pattern="yyyy-MM-dd"/>                          
									<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>                          
										<c:choose>
											<c:when test="${cDate == today || mDate == today}">
												<fmt:formatDate value="${reply.replyMT}"  pattern="HH:mm:ss"/>  	
											</c:when>
											<c:otherwise>
												       ${mDate}                 
											</c:otherwise>
										</c:choose>                 
	                            </span>
	                        </div>
	                        <div class="col-sm-4">
	                            <span>좋아요</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </li>
         </c:forEach>

</body>

<script>

//댓글 등록
function addReply()	{
	
	const replyContent = $("#input-reply").val();
	
	if(loginMemberNo == ""){
		swal("로그인 후 이용해주세요.");
	}else{
		
		if(replyContent.trim() == ""){
			swal("댓글 작성 후 클릭해주세요.");
		}else{
			$.ajax({ 
				url : "${contextPath}/reply/insertReply", 
				type : "POST",
				data : { "memberNo" : loginMemberNo,
						 "boardNo" : boardNo,
						 "replyContent" : replyContent },
				success : function(result){
					
					if(result > 0){ 
						swal({"icon" : "success" , "title" : "댓글 등록 성공"});
						$("#replyContent").val("");
						selectReplyList();
					}
				},
				error : function(){
					console.log("댓글 삽입 실패");
				}
				});
			}
		}
	}

</script>
</html>