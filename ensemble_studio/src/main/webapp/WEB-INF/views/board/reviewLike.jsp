<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewLike</title>

</head>

	<body>
		<c:choose>
			<c:when test="${empty loginMember}">
				<div class="row">
					<button type="button"
						class="btn_like col-sm-3 mt-2 ${board.boardNo}"
						onclick="addLike${board.boardNo}();">
						<span class="img_emoti">좋아요</span> <span class="ani_heart_m"></span>
					</button>
					<span class="likeCNT col-sm-3 mt-2 vertical-center">${board.likeCount}</span>
				</div>
			</c:when>
			<c:when test="${fn:contains(board.likeList, loginMember.memberNo)}">
				<div class="row">
					<button type="button"
						class="btn_like col-sm-3 mt-2 btn_unlike ${board.boardNo}"
						onclick="deleteLike${board.boardNo}();">
						<span class="img_emoti">좋아요</span> <span class="ani_heart_m"></span>
					</button>
					<span class="likeCNT col-sm-3 mt-2 vertical-center">${board.likeCount}</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<button type="button"
						class="btn_like col-sm-3 mt-2 ${board.boardNo}"
						onclick="addLike${board.boardNo}();">
						<span class="img_emoti">좋아요</span> <span class="ani_heart_m"></span>
					</button>
					<span class="likeCNT col-sm-3 mt-2 vertical-center">${board.likeCount}</span>
				</div>
			</c:otherwise>
		</c:choose>
	</body>
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

</html>