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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common/heart2.css">
</head>
<body>		

	<c:choose>
		<c:when test="${board.likeStatus != null}">
			<button type="button" class="btn_like btn_unlike ${board.boardNo}" onclick="deleteLike();">
			  <span class="img_emoti">좋아요</span>
			  <span class="ani_heart_m"></span>
			  <span class="likeCNT">${board.likeCNT}</span>
			</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn_like ${board.boardNo}" onclick="addLike();">
			  <span class="img_emoti">좋아요</span>
			  <span class="ani_heart_m"></span>
			  <span class="likeCNT">${board.likeCNT}</span>
			</button>
		</c:otherwise>	
	</c:choose>
			
			
			
</body>

<script>

		const loginMemberNoLike = "${loginMember.memberNo}";
		const boardNoLike = "${board.boardNo}";
		// 좋아요 추가
		function addLike()	{
			if(loginMemberNoLike == ""){
				swal("로그인 후 이용해주세요.");
			}else{
				$.ajax({ 
						url : "${contextPath}/like/addLike", 
						type : "POST",
						data : {"boardNo" : boardNoLike,
								"loginMemberNo" : loginMemberNoLike
								},
						success : function(result){
							if(result > 0){ 
								checkingLike();
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
		function deleteLike(boardNo, loginMemberNo)	{
			$.ajax({ 
				url : "${contextPath}/like/deleteLike",
				data : {"boardNo" : boardNoLike,
						"loginMemberNo" : loginMemberNoLike
						},
				type : "POST",
				dataType : "JSON",
				success : function(result){
						if(result > 0){
							checkingLike();
							swal({"icon" : "success" , "title" : "좋아요 삭제"});
						}
					},
				error : function(){
						console.log("ajax 통신 실패");
					}
				});
		}
		
		// 좋아요 조회
		function checkingLike()	{
			$.ajax({ 
					url : "${contextPath}/like/selectLike",
					data : {"boardNo" : boardNoLike,
							"loginMemberNo" : loginMemberNoLike
							},
					type : "POST",
					dataType : "JSON",
					success : function(selLike){
								$('.${board.boardNo}').children().eq(2).empty();
								
								if(selLike.likeStatus!=null){
									$('.${board.boardNo}').children().eq(2).text(selLike.likeCNT);
									$('.${board.boardNo}').removeAttr("onclick").attr("onclick","deleteLike();");						
								}else{
									$('.${board.boardNo}').children().eq(2).text(selLike.likeCNT);
									$('.${board.boardNo}').removeAttr("onclick").attr("onclick","addLike();");	
								}
							
							
							},
					error : function(){
							console.log("ajax 통신 실패");
							}
			});
		}
		
		// 버튼 작동
		$(this).click(function(){
			if(loginMemberNoLike != ""){
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

</html>