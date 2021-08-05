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
	                    <textArea rows="3" id="input-reply"></textArea>
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

// 비동기 댓글 조회
function selectReplyList(){

	$.ajax({ 
		url : "${contextPath}/reply/list",
		data : {"boardNo" : boardNo},
		type : "POST",
		dataType : "JSON",
		success : function(rList){
			
       $("#detail-replyArea").html(""); // 기존 정보 초기화
       
       	$.each(rList, function(index, item){
    	   	// $.each() : jQuery의 반복문
    	   	// rList : ajax 결과로 받은 댓글이 담겨있는 객체 배열
    	   	// index : 순차 접근 시 현재 인덱스
    	   	// item : 순차 접근 시 현재 접근한 배열 요소(댓글 객체 하나)          
          var li = $("<li>").addClass("reply-row");
       
          // 작성자, 작성일, 수정일 영역 
          var div = $("<div>");
          var rMImage = $("<img>").addClass("rMImage").text(item.memberImage)
          var rWriter = $("<span>").addClass("rWriter").text(item.memberNk);
          var rDate = $("<p>").addClass("rDate").text("작성일 : " + item.createDate);
          div.append(rWriter).append(rDate)
          
          
          // 댓글 내용
          var rContent = $("<div>").addClass("rContent").html(item.replyContent);
          
          // 대댓글, 수정, 삭제 버튼 영역
          var replyBtnArea = $("<div>").addClass("replyBtnArea");
          
          // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
          if(item.memberNo == loginMemberNo){
             
             // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 

             var showUpdate = $("<a>").addClass("btn btn-primary btn-sm ml-1").text("수정")
             .attr("onclick", "showUpdateReply("+item.replyNo+", this)");
             var deleteReply = $("<a>").addClass("btn btn-primary btn-sm ml-1").text("삭제")
             .attr("onclick", "deleteReply("+item.replyNo+")");
             var reportReply = $("<a>").addClass("btn btn-primary btn-sm ml-1").text("신고")
             .attr("onclick", "deleteReply("+item.replyNo+")");
             
             replyBtnArea.append(showUpdate).append(deleteReply).append(reportReply);

          }
          
          // 댓글 요소 하나로 합치기
          li.append(div).append(rContent).append(replyBtnArea);
          
          
          // 합쳐진 댓글을 화면에 배치
          $("#replyListArea").append(li);
       });
			
		},
		
		error : function(){
			console.log("댓글 목록 조회 실패");
		}
		
	});
}

</script>
</html>