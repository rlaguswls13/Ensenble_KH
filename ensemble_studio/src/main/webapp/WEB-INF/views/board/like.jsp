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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common/heart2.css">
    
</head>
<body>		

	<c:choose>
		<c:when test="${selLike.likeStatus!=null}">
			<button type="button" class="btn_like btn_unlike" onclick="deleteLike();">
			  <span class="img_emoti">좋아요</span>
			  <span class="ani_heart_m"></span>
			</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn_like" onclick="addLike();">
			  <span class="img_emoti">좋아요</span>
			  <span class="ani_heart_m"></span>
			</button>
		</c:otherwise>	
	</c:choose>
			<span class="likeCNT">${selLike.likeCNT}</span>
			
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
								$(".likeCNT").empty();
								
								if(selLike.likeStatus!=null){
									$(".likeCNT").text(selLike.likeCNT);
									$(".btn_like").removeAttr("onclick").attr("onclick","deleteLike();");						
								}else{
									$(".likeCNT").text(selLike.likeCNT);
									$(".btn_like").removeAttr("onclick").attr("onclick","addLike();");	
								}
							
							
							},
					error : function(){
							console.log("ajax 통신 실패");
							}
			});
		}
		
		// 버튼 작동
		$('.btn_like').click(function(){
			if(loginMemberNoLike != ""){
			  if($(this).hasClass('btn_unlike')){
			    $(this).removeClass('btn_unlike');
			    $('.ani_heart_m').removeClass('hi');
			    $('.ani_heart_m').addClass('bye');
			  }
			  else{
			    $(this).addClass('btn_unlike');
			    $('.ani_heart_m').addClass('hi');
			    $('.ani_heart_m').removeClass('bye');
			  }
			}
			});

</script>

</html>