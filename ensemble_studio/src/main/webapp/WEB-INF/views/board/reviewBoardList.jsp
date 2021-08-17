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
 	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common/heart2.css">
 	
 
 <style>
 
.top-box{
		background-color : #F7F7F7;
		height:260px;
	}
	.searchInput{
            width: 80%; height:37px;
            max-width: 600px;
            background-image: url('https://drive.google.com/uc?id=1ekFsz_P2MZWoMUt0QyvZjPjAm2fx308R');
            background-repeat: no-repeat;
            background-size: 20px;
            background-position: 7px center;
            border : 1px solid #ccc;
            border-radius: 5px;
            padding-left: 40px;
     }
	.btn-ensemble {
		background-color: #FDCDCD !important;
		padding: 5px 10px 5px 10px !important;
	}
	.btn-insert {
		background-color: #FDCDCD !important;
		padding: 15px !important;
		border-radius : 100% !important;
		position:absolute;
		top:400px;
		right : 20%;
	}
	.btn-category{
		background-color : white !important;
		border : 1px solid #ccc !important;
		margin-right: 5px !important;
		padding : 5px 20px 5px 20px !important;
		border-radius : 20px !important;
	}
	.btn-category:hover{
		background-color : white !important;
		color : #FF657D !important;
		border : 1px solid #FF657D !important;
		
	}
	.btn-category-checked{
		background-color : #FF657D !important;
		color : white !important;
		border : 1px solid #FF657D !important;
		margin-right: 5px !important;
		padding : 5px 20px 5px 20px !important;
		border-radius : 20px !important;
	}
	.category{
		margin-top : 15px;	
	}
	.pagination {
		justify-content: center;
	}
	
	.page-link {
		color: black !important;
	} 

#board_content{
    box-sizing: border-box;
    width: 500px;
    height: auto;
    margin-left: 1%;
    display: inline-block;
}


.board_img{
	width: 400px;
    height: 500px;
    background-repeat: no-repeat; 
    background-size:cover; 
    background-position: center;
}

.board_img:hover{
	opacity : 0.8;
}

#shell{
    width: 100%;
    text-align: center;
}

.rMImage {
 	border-radius: 50%;
}

.review-writer{
	margin-left: 10%;
}

.like-content{
	margin-left:49%;
}

#title-content{
	text-align: left;
	margin-top: -10px;
    font-size: 1.5em;
    font-weight: bold;
    margin-left: 7%;
}
.memberImage{
	width:50px;
	height: 50px;
	border-radius : 100px;	
	display: inline-block;
	background-repeat: no-repeat; 
    background-size:cover; 
    background-position: center;
}
.memberNick{
	position: relative;
	bottom: 20px;
	height: 30px;
	vertical-align: middle;
	display : inline-block;
	font-weight: 500;
	font-size : 24px;
}

.btn_like{
    box-shadow: none;
    border: 0;
 	padding: 0;
    margin: 0;
    padding-bottom: 15px;
    padding-left: 20px;
    }
.btn_like:hover{
	box-shadow: none;
    border: 0;
    }
    
.state-bar{
	margin-left: 50px;
}

.vertical-center{
	padding-top: 2px;
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
            <c:if test="${!empty loginMember}">
			<a  class="btn btn-insert" id="insertBtn" href='insert'>
				<img src="${contextPath}/resources/images/common/edit.png" width="30px">
			</a>
			</c:if>

        <!-- 리뷰 내용 추가-->
        <div class="row-sm-12" id="shell" >
        <c:choose>
			<%-- 조회된 게시글 목록이 없는 경우 --%>
			<c:when test="${empty boardList}">
				<span>게시글이 존재하지 않습니다.</span>							
			</c:when>
		<c:otherwise>					
			<c:forEach items="${boardList}" var="board">
	            <div class="row-sm-12 mr-4 my-4" id="board_content">
	                <div class="d-flex row-sm-12">
	                    <div class="review-writer">
	                    	<div class="memberImage mr-2" style="background-image:url('${contextPath}/${board.memberImage}')"></div>
	                    	<div class="memberNick">${board.memberNk}</div>
	                    </div>
	                    <div class="like-content">
	                        
	                    </div>
	                </div>
	                <div class="row-sm-12">
	                    <div class="col-sm-12" id="board_img_div">
	                        <a href="${board.boardNo}?cp=${pagination.currentPage}${searchStr}">
	                        <img class="board_img" style="background-image:url('${board.atList[0].atPath}/${board.atList[0].atName}')">
	                        </a>
	                    </div>
	                </div>
		            <div class="row-sm-12 d-flex state-bar">
		                <div class="col-sm-4 mt-2">
		                	<div class="row">
		                	 <div class="col-sm-3 mt-2">
			                	<img src="${contextPath}/resources/images/common/replyCount.png" width="23px">
			                 </div>
			                 <div class="col-sm-3 mt-2 vertical-center">
			                	<div>${board.replyCount}</div>
		                	 </div>
		                	</div>
		                </div>
		                <div class="col-sm-4 mt-2">
		                	<div class="row">
		                	 <div class="col-sm-3 mt-2">
			                	<img src="${contextPath}/resources/images/common/readCount.png" width="23px">
			                 </div>
			                 <div class="col-sm-3 mt-2 vertical-center">
			                	${board.boardReadCount}
		                	 </div>
		                </div>
		                </div>
		                <div class="col-sm-4 mt-2">		               
		                <c:choose>
		                <c:when test="${empty loginMember}">
		                <div class="row">
		                <button type="button" class="btn_like col-sm-3 mt-2 ${board.boardNo}" onclick="addLike${board.boardNo}();">
					  		<span class="img_emoti">좋아요</span>
						  	<span class="ani_heart_m"></span>					  		
				  		</button>
				  			<span class="likeCNT col-sm-3 mt-2 vertical-center">${board.likeCount}</span>
				  		</div>
		                </c:when>
						<c:when test="${fn:contains(board.likeList, loginMember.memberNo)}">
						<div class="row">
						<button type="button" class="btn_like col-sm-3 mt-2 btn_unlike ${board.boardNo}" onclick="deleteLike${board.boardNo}();">
						  <span class="img_emoti">좋아요</span>
						  <span class="ani_heart_m"></span>						  
						</button>
						  <span class="likeCNT col-sm-3 mt-2 vertical-center">${board.likeCount}</span>
						</div>
						</c:when>	
						<c:otherwise>
						<div class="row">
						<button type="button" class="btn_like col-sm-3 mt-2 ${board.boardNo}" onclick="addLike${board.boardNo}();">
					  		<span class="img_emoti">좋아요</span>
						  	<span class="ani_heart_m"></span>					
				  		</button>
				  			<span class="likeCNT col-sm-3 mt-2 vertical-center">${board.likeCount}</span>
				  		</div>
				  		</c:otherwise>
				  		</c:choose>
					
					<script>
					// 좋아요 추가
					function addLike${board.boardNo}()	{
						
						if("${loginMember}" == ""){
							swal("로그인 후 이용해주세요.");
						}else{
							$.ajax({ 
									url : "${contextPath}/like/addLike", 
									type : "POST",
									data : {"boardNo" : "${board.boardNo}",
											"loginMemberNo" : "${loginMember.memberNo}"
											},
									success : function(result){
										if(result > 0){ 
											checkingLike${board.boardNo}();
											swal({"icon" : "success" , "title" : "좋아요!!"})										
										} 
									},
									error : function(){
										console.log("좋아요 실패");
									}
								});
							}
						}
					
					// 좋아요 삭제
					function deleteLike${board.boardNo}()	{
						$.ajax({ 
							url : "${contextPath}/like/deleteLike",
							data : {"boardNo" : "${board.boardNo}",
									"loginMemberNo" : "${loginMember.memberNo}"
									},
							type : "POST",
							dataType : "JSON",
							success : function(result){
									if(result > 0){
										checkingLike${board.boardNo}();
										swal({"icon" : "success" , "title" : "좋아요 삭제"});
									}
								},
							error : function(){
									console.log("ajax 통신 실패");
								}
							});
					}
					
					// 좋아요 조회
					function checkingLike${board.boardNo}()	{
						$.ajax({ 
								url : "${contextPath}/like/selectLike",
								data : {"boardNo" : "${board.boardNo}",
										"loginMemberNo" : "${loginMember.memberNo}"
										},
								type : "POST",
								dataType : "JSON",
								success : function(selLike){
											$('.${board.boardNo}').next().empty();
											
											if(selLike.likeStatus!=null){
												$('.${board.boardNo}').next().text(selLike.likeCNT);
												$('.${board.boardNo}').removeAttr("onclick").attr("onclick","deleteLike${board.boardNo}();");						
											}else{
												$('.${board.boardNo}').next().text(selLike.likeCNT);
												$('.${board.boardNo}').removeAttr("onclick").attr("onclick","addLike${board.boardNo}();");	
											}
										
										
										},
								error : function(){
										console.log("ajax 통신 실패");
										}
						});
					}
					
					// 버튼 작동
					$('.${board.boardNo}').click(function(){
						if('${loginMember}' != ""){
						  if($('.${board.boardNo}').hasClass('btn_unlike')){
						    $('.${board.boardNo}').removeClass('btn_unlike');
						    $('.${board.boardNo}').children().eq(1).removeClass('hi');
						    $('.${board.boardNo}').children().eq(1).addClass('bye');
						  }
						  else{
						    $('.${board.boardNo}').addClass('btn_unlike');
						    $('.${board.boardNo}').children().eq(1).addClass('hi');
						    $('.${board.boardNo}').children().eq(1).removeClass('bye');
						  }
						}
					});
			</script>
		                </div>
		                </div>
	                
	                <div class="d-flex row-sm-12 ml-0 pl-0">
	                    <div class="col-sm-12" id="title-content">
	                        <a href="${board.boardNo}?cp=${pagination.currentPage}${searchStr}">
	                        ${board.boardTitle}
	                        </a>
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