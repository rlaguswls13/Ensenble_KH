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
	                    <textarea class="my-1" id="input-reply" cols="100" rows="2"></textarea>
	                    <button class="btn btn-primary" id="addReply" onclick="addReply();">등록</button>
	                </div>
	            </div>
            </c:if>
        
        <div id=replyListArea>
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
									${reply.replyMT}                
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
         </div>

</body>

<script>

//로그인한 회원 번호. 비로그인 시 "" (빈문자열)
const loginMemberNo = "${loginMember.memberNo}";
// 현재 게시글 번호
const boardNo = ${board.boardNo};
// 수정 전 댓글 요소를 저장할 변수 (댓글 수정 시 사용)
let beforeReplyRow;


//댓글 등록
function addReply()	{
	
	const replyContent = $("#input-reply").val();
	
	if(loginMemberNo == ""){
		swal("로그인 후 이용해주세요.");
	}else{
		if(replyContent.trim() == ""){
			swal("댓글 작성 후 클릭해주세요.");
		}else{
			console.log("${contextPath}");
			$.ajax({ 
				url : "${contextPath}/reply/insertReply", 
				type : "POST",
				data : { "memberNo" : loginMemberNo,
						 "boardNo" : boardNo,
						 "replyContent" : replyContent },
				success : function(result){
					
					if(result > 0){ 
						swal({"icon" : "success" , "title" : "댓글 등록 성공"});
						//selectReplyList();
						$("#replyContent").val("");						
					}
				},
				error : function(){
					console.log("댓글 삽입 실패");
				}
				});
			}
		}
	}

//댓글 수정
function updateReply(replyNo, el){
	
	const replyContent = $(el).parent().prev().val();
	
	$.ajax({
		url : "${contextPath}/reply/updateReply",
		type : "POST",
		data : {"replyNo" : replyNo,
				"replyContent" : replyContent },
		success : function(result){
			
			if(result > 0){
				swal({"icon" : "success" , "title" : "댓글 수정 성공"});
				//selectReplyList();
			}
			
		},
		error : function(){
			console.log("댓글 수정 실패");
		}
		
	});
}

// 수정 형식
function showUpdateReply(replyNo, el){
	// el : 수정 버튼 클릭 이벤트가 발생한 요소
	
	// 이미 열려있는 댓글 수정 창이 있을 경우 닫아주기
	if($(".replyUpdateContent").length > 0){
		$(".replyUpdateContent").eq(0).parent().html(beforeReplyRow);
	}
		
	// 댓글 수정화면 출력 전 요소를 저장해둠.
	beforeReplyRow = $(el).parent().parent().html();
	
	
	// 작성되어있던 내용(수정 전 댓글 내용) 
	var beforeContent = $(el).parent().prev().html();
	
	
	// 이전 댓글 내용의 크로스사이트 스크립트 처리 해제, 개행문자 변경
	// -> 자바스크립트에는 replaceAll() 메소드가 없으므로 정규 표현식을 이용하여 변경
	beforeContent = beforeContent.replace(/&amp;/g, "&");	
	beforeContent = beforeContent.replace(/&lt;/g, "<");	
	beforeContent = beforeContent.replace(/&gt;/g, ">");	
	beforeContent = beforeContent.replace(/&quot;/g, "\"");	
	
	beforeContent = beforeContent.replace(/<br>/g, "\n");	
	
	
	// 기존 댓글 영역을 삭제하고 textarea를 추가 
	$(".rContent",this).remove();
	var textarea = $("<textarea>").addClass("replyUpdateContent").attr("rows", "2").val(beforeContent);
	
	// 수정 버튼
	var updateReply = $("<button>").addClass("btn btn-primary btn-sm ml-1 mb-4").text("댓글 수정").attr("onclick", "updateReply(" + replyNo + ", this)");
	
	// 취소 버튼
	var cancelBtn = $("<button>").addClass("btn btn-primary btn-sm ml-1 mb-4").text("취소").attr("onclick", "updateCancel(this)");
	
	var replyBtnArea = $(el).parent();
	
	$(replyBtnArea).empty(); 
	$(replyBtnArea).append(updateReply); 
	$(replyBtnArea).append(cancelBtn); 
}

//댓글 수정 취소 시 원래대로 돌아가기
function updateCancel(el){
	$(el).parent().parent().html( beforeReplyRow );
}
	
//댓글 삭제
function deleteReply(replyNo){
	if(confirm("정말로 삭제하시겠습니까?")){
		var url = "${contextPath}/reply/deleteReply";
		
		$.ajax({
			url : url,
			data : {"replyNo" : replyNo},
			success : function(result){
				if(result > 0){
					//selectReplyList(boardNo);
					
					swal({"icon" : "success" , "title" : "댓글 삭제 성공"});
				}
				
			}, error : function(){
				console.log("ajax 통신 실패");
			}
		});
	}
}

//댓글 신고
function reportReply(){
	if(confirm("정말로 신고하시겠습니까?")){
		var url = "${contextPath}/reply/reportReply";
		
		$.ajax({
			url : url,
			data : {"replyNo" : replyNo,
					"memberNo" : loginMemberNo
				},
			success : function(result){
				if(result > 0){
					//selectReplyList(boardNo);
					
					swal({"icon" : "success" , "title" : "댓글 삭제 성공"});
				}
				
			}, error : function(){
				console.log("ajax 통신 실패");
			}
		});
	}
}
</script>
</html>