<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#input-reply {
	width: 90%;
	height: 100px;
	resize: none;
}

#input-replyArea{
	margin-bottom: 5px;
}

.btn_reply_add{
	margin-bottom: 30px;
}

.rMImage {
 	border-radius: 50%;
}

.reply-row{
	margin-bottom: 2%;
}

.reply-btn{
	margin-left: 10px;
}

</style>

</head>
<body>	
	<hr>
		<c:choose>
		<c:when test="${board.boardTypeNo==4}">
       		<h5 id="replyTitle">답변</h5>
    	</c:when>
    	<c:otherwise>
       		<h5 id="replyTitle">댓글 ${board.replyCount }</h5>
    	</c:otherwise>
    	</c:choose>
    <hr>
            <c:choose>
            	<c:when test="${loginMember.memberGrade eq 'A'}">
            		<div class="row-sm-12 d-flex" id="input-replyArea">
	                <div class="col-sm-1">
	                    <img class="rMImage" src="${contextPath}${loginMember.memberImage}" alt="null" width="50px">
	                    <br>
	                    <span>${loginMember.memberNick}</span>
	                </div>
	                <div class="col-sm-11">
	                	<div class="input-reply">
	                    	<textarea class="py-0 my-0" id="input-reply"></textarea>
	                    	<button class="btn btn-secondary btn_reply_add" id="addReply" onclick="addReply();">등록</button>
	                    </div>	
	                    <div class="input-reply-btn">
	                    	
	                	</div>
	                </div>
	            	</div>
            	</c:when>
            	<c:when test="${logneMember.memberGrade eq 'G' && board.boardTypeNo != 4}">
            		<div class="row-sm-12 d-flex" id="input-replyArea">
	                <div class="col-sm-1">
	                    <img class="rMImage" src="${contextPath}${loginMember.memberImage}" alt="null" width="50px">
	                    <br>
	                    <span>${loginMember.memberNick}</span>
	                </div>
	                <div class="col-sm-11">
	                	<div class="input-reply">
	                    	<textarea class="py-0 my-0" id="input-reply"></textarea>
	                    	<button class="btn btn-secondary btn_reply_add" id="addReply" onclick="addReply();">등록</button>
	                    </div>	
	                    <div class="input-reply-btn">
	                    	
	                	</div>
	                </div>
	            </div>            	
            	</c:when>
            </c:choose>
       
        
        <div id=replyListArea>
		<c:forEach items="${rList}" var="reply">
			<div class="reply-row">
	            <div class="row-sm-12 d-flex" id="detail-replyArea">
	                <div class="col-sm-1">
	                    <img class="rMImage" src="${contextPath}${reply.memberImage}" alt="null" width="50px">
	                    <br>
	                    <span class="rWriter">${reply.memberNk}</span>
	                </div>
	                <div class="col-sm-11">
	                    <div class="row-sm-12 d-flex">
	                        <div class="col-sm-11 rContent">${reply.replyContent}</div>
		                        <c:if test="${!empty loginMember}">
			                        <div class="dropdown mr-1">
			                            <button type="button" class="btn btn-secondary dropdown-toggle reply-btn" id="dropdownMenu"
			                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20" onclick="savedata(this)">
			                            :
			                            </button>
			                           
			                            <div class="dropdown-menu replyBtnArea" aria-labelledby="dropdownMenu">                            
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
	                            	 <fmt:formatDate value="${reply.replyMT}" pattern="yyyy-MM-dd HH:mm"/>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
            <hr>
         </c:forEach>
         </div>
		
</body>

<script>

	//로그인한 회원 번호. 비로그인 시 "" (빈문자열)
	const loginMemberNo = "${loginMember.memberNo}";
	const loginMember = "&{loginMember}";
	
	// 현재 게시글 번호
	const boardNo = ${board.boardNo};
	// 수정 전 댓글 요소를 저장할 변수 (댓글 수정 시 사용)
	let beforeReplyRow;
	let nowBeforeReplyRowDeactive;
	let postBeforeReplyRowDeactive;
	
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
						
						$("#input-reply").val("");
						swal({"icon" : "success" , "title" : "댓글 등록 성공"})			
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
	
//댓글 조회
function selectReplyList(){

	$.ajax({ 
		url : "${contextPath}/reply/list",
		data : {"boardNo" : boardNo},
		type : "POST",
		dataType : "JSON",
		success : function(rList){

       		$("#replyListArea").html(""); 
       
       	  	$.each(rList, function(index, item){
        	   	
		  // reply 1개
	      var li = $("<div>").addClass("reply-row"); 
	   	  
	   	  // reply 전영역
		  var detailReplyArea = $("<div>").addClass("row-sm-12 d-flex").attr("id", "detail-replyArea");
		  
		  // 작성자 (왼쪽 영역)
		  var cdivCol1 = $("<div>").addClass("col-sm-1");
	      var replyArea 
	      var rMImage = $("<img>").attr("src", "${contextPath}"+item.memberImage).attr("alt", "null").attr("width","50px").addClass("rMImage");
	      var br = $("<br>")
	      var rWriter = $("<span>").addClass("rWriter").text(item.memberNk);
	     
	      var rSpace = cdivCol1.append(rMImage).append(br).append(rWriter);
	      
	      // 작성 내용 오른쪽 영역
	      var cdivCol2 = $("<div>").addClass("col-sm-11");
	      
	      // 첫 번째 row
	      var cdivRow1 = $("<div>").addClass("row-sm-12 d-flex");
	      // 댓글 내용
	      var rContent = $("<div>").addClass("col-sm-11 rContent").html(item.replyContent);
	      // btn 내용
	      var btnArea = $("<div>").addClass("dropdown mr-1")
	      if(loginMember != null){
	    	  // drop-btn 영역
	          var dropdownBtn = $("<button>").addClass("btn btn-secondary dropdown-toggle reply-btn")
	          					.attr("id","dropdownMenu").attr("type","button")
	          					.attr("data-toggle","dropdown").attr("aria-haspopup", "true")
	          					.attr("aria-expanded", "false").attr("data-offset", "10,20").text(":");
	          // 신고, 수정, 삭제 btn 영역
	          var replyBtnArea = $("<div>").addClass("dropdown-menu replyBtnArea").attr("aria-labelledby", "dropdownMenu");
	          
	          // 회원에 따른 btn
	          if(item.memberNo == loginMemberNo){  
	             var showUpdate = $("<a>").addClass("dropdown-item").text("수정").attr("onclick", "showUpdateReply("+item.replyNo+", this)");
	             var deleteReply = $("<a>").addClass("dropdown-item").text("삭제").attr("onclick", "deleteReply("+item.replyNo+")");
	             replyBtnArea.append(showUpdate).append(deleteReply);
	          } else{
	        	 var reportReply = $("<a>").addClass("dropdown-item").text("신고").attr("onclick", "reportReply("+item.replyNo+")");
	        	 replyBtnArea.append(reportReply);
	          }
	      }
	      // btn 요소 합
	      var totBtn = btnArea.append(dropdownBtn).append(replyBtnArea);
	      
	      // 첫 번째 요소 합
	      var firRow = cdivRow1.append(rContent).append(totBtn);
	      
	      // 두 번째 row
	      var cdivRow2 = $("<div>").addClass("row-sm-12 d-flex");
	      // 날짜, 좋아요
	      var colSM1 = $("<div>").addClass("col-sm-4");
	      var rDate = $("<span>").text(item.replyMT);
	      var secRow = cdivRow2.append(colSM1.append(rDate));
	      
	      // 왼쪽 영역
	      var lSpace = cdivCol2.append(firRow).append(secRow);
	      
	      // 댓글 요소 하나로 합치기
	      detailReplyArea.append(rSpace).append(lSpace);
	      li.append(detailReplyArea)
	      
	      // 합쳐진 댓글을 화면에 배치
	      $("#replyListArea").append(li);
	   });
			
		},
		error : function(){
			console.log("댓글 목록 조회 실패");
		}
	});
}

// 드랍박스 비활성화 저장함수
function savedata(el) {
	if(!nowBeforeReplyRowDeactive){
		nowBeforeReplyRowDeactive = $(el).parent().parent().parent().html();
	} else{
		postBeforeReplyRowDeactive = nowBeforeReplyRowDeactive;
		nowBeforeReplyRowDeactive = $(el).parent().parent().parent().html();
	}
}

//댓글 수정 취소 시 원래대로 돌아가기
function updateCancel(el){
	$(".replyUpdateContent").parent().parent().parent().html(nowBeforeReplyRowDeactive);
}

// 수정 형식
function showUpdateReply(replyNo, el){
	// el : 수정 버튼 클릭 이벤트가 발생한 요소
	
	// 이미 열려있는 댓글 수정 창이 있을 경우 닫아주기
	if($(".replyUpdateContent").length > 0){
		$(".replyUpdateContent").parent().parent().parent().html(postBeforeReplyRowDeactive);
		$(".replyUpdateContent").eq(0).parent().empty();
	}
		
	// 댓글 수정화면 출력 전 요소를 저장해둠.
	// beforeReplyRow = $(el).parent().parent().parent().parent().html();
	// 작성되어있던 내용(수정 전 댓글 내용) 
	var beforeContent = $(el).parent().parent().parent().children().eq(0).html();
	
	// 이전 댓글 내용의 크로스사이트 스크립트 처리 해제, 개행문자 변경
	beforeContent = beforeContent.replace(/&amp;/g, "&");	
	beforeContent = beforeContent.replace(/&lt;/g, "<");	
	beforeContent = beforeContent.replace(/&gt;/g, ">");	
	beforeContent = beforeContent.replace(/&quot;/g, "\"");	
	
	beforeContent = beforeContent.replace(/<br>/g, "\n");	
		
	// 기존 댓글 영역
	var replyArea = $(el).parent().parent().parent().parent();
	

	
	// 기존 댓글 영역 삭제
	$(el).parent().parent().parent().children().eq(0).empty();
	// 기존 날짜 영역 삭제
	$(el).parent().parent().parent().parent().children().eq(1).remove();
	// 기존 버튼 영역 삭제
	
	// 작성 영역
	var inputText = $("<textarea>").addClass("replyUpdateContent").attr("rows", "auto").attr("cols", "100").val(beforeContent);
		
	// 수정, 취소 btn 영역
	var updateReply = $("<button>").addClass("btn btn-primary ml-1 mb-4 my-2").text("댓글수정").attr("onclick", "updateReply(" + replyNo + ", this)");
	var cancelBtn = $("<button>").addClass("btn btn-primary ml-1 mb-4 my-2").text("취소").attr("type", "button").attr("onclick", "updateCancel(this)");
	
	// 통합
	$(el).parent().parent().parent().children().eq(0).append(inputText);
	$(el).parent().parent().parent().append(updateReply).append(cancelBtn);
	$(el).parent().parent().remove();

}


//댓글 수정
function updateReply(replyNo, el){
	
	const replyContent = $(el).prev().children().eq(0).val();

	$.ajax({
		url : "${contextPath}/reply/updateReply",
		type : "POST",
		data : {"replyNo" : replyNo,
				"replyContent" : replyContent },
		success : function(result){
			
			if(result > 0){
				swal({"icon" : "success", "title" : "댓글 수정 성공"});
				selectReplyList();
			}
			
		},
		error : function(){
			console.log("댓글 수정 실패");
		}
		
	});
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
					selectReplyList(boardNo);
					swal({"icon" : "success" , "title" : "댓글 삭제 성공"});
				}
				
			}, error : function(){
				console.log("ajax 통신 실패");
			}
		});
	}
}

//댓글 신고
function reportReply(replyNo){
	if(confirm("정말로 신고하시겠습니까?")){
		var url = "${contextPath}/reply/reportReply";
		
		$.ajax({
			url : url,
			data : {"replyNo" : replyNo
				},
			success : function(result){
				if(result > 0){
					selectReplyList(boardNo);		
					swal({"icon" : "success" , "title" : "댓글 신고 성공"});
				}
				
			}, error : function(){
				console.log("ajax 통신 실패");
			}
		});
	}
}


</script>
</html>