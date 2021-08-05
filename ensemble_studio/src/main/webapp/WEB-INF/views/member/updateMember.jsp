<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPageTopBar.css" type="text/css" />
<link rel="stylesheet" href="${contextPath}/resources/css/member/updateMember.css" type="text/css" />
</head>
<style>


</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<c:set var="phone" value="${fn:split( loginMember.memberPhone, '-' ) }"/>
	<div class="container">
			<!-- 마이페이지  탑바 -->
			<jsp:include page="myPageTopBar.jsp"></jsp:include>

			<div class="update-form">
				<div class="content">
					<form action="updateMember" method="post" name="updateForm" enctype="multipart/form-data" onsubmit="return memberUpdateValidate()">
						<div class="update-title">
							<div class="update-title-text">회원정보수정</div>
							<button type="button" class="btn seccession-btn" onclick="location.href='secession'">탈퇴하기</button>
						</div>
						<hr>
						<div class="form-group">
							<label>아이디</label>
							<div class="col-md-5">
							${loginMember.memberId}</div>
						</div>
						<div class="form-group">
							<label>닉네임</label> <input type="text" class="form-control update"
								id="nickname" name="inputNick"
								value="${loginMember.memberNick}">
						</div>
						<div class="form-group">
							<label>이메일</label> <input type="text" class="form-control update"
								id="email" name="inputEmail" value="${loginMember.memberEmail}">
						</div>

						<div class="form-group">
							<label>전화번호</label>
							<div class="form-group row col-md-12 inputPhone">
								<div class="col-md-4 inputPhone1">
									<select class="custom-select" id="phone1" name="phone" required>
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>019</option>
									</select>
								</div>

								<!-- 전화번호2 -->
								<div class="col-md-4 inputPhone1">
									<input type="number" class="form-control phone update"
										id="phone2" name="phone" value="${phone[1]}">
								</div>

								<!-- 전화번호3 -->
								<div class="col-md-4 inputPhone1">
									<input type="number" class="form-control phone update"
										id="phone3" name="phone" value="${phone[2]}">
								</div>
							</div>

						</div>
						<div class="form-group">
							<label>프로필 이미지</label> 
							<div class="form-control update image-form inputImage" >
								<img src="${contextPath}${loginMember.memberImage}" width="100%" height="100%" onclick="document.all.file.click()">
								<input type="file" id="file" name="file" style="display:none" onchange="LoadImg">
							</div>
						</div>
						<div class="form-group">
							<button type="submit" class=" btn btn-block btn-lg update-btn">수정하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	    
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script>
	
	// 전화번호 첫 번째 자리 지정하기
	(function(){
		
		$("#phone1 > option").each( function(index, item){ 

			if( $(item).text() == "${phone[0]}"){
				
				$(item).prop("selected", true);
			}
			
		} );
		

			
	})();
	
	// 회원 정보 수정 시 유효성 검사
	function memberUpdateValidate(){
		
		// 닉네임 유효성 검사
		const regExp = /^[가-힣ㄱ-ㅎa-zA-Z0-9]{2,6}$/;
		
		const inputNickname = $("#nickname").val().trim();
		
		// 입력된 닉네임이 정규식에 일치하지 않는 경우
		if(!regExp.test(inputNickname)){
				swal({ "icon" : "warning",
					"title" : "닉네임이 유효하지 않습니다." ,
					"text" : "한글, 숫자, 영어 2~6글자 이내 형식으로 작성해주세요."});
		
				return false;
		}
		
		
		// 전화번호 유효성 검사
	    const regExp1 = /^\d{3,4}$/; // 숫자 3~4글자
	    const regExp2 = /^\d{4}$/; // 숫자 3~4글자

	    const ph2 = $("#phone2").val();
	    const ph3 = $("#phone3").val();
	    
	    // 둘 중 하나라도 유효하지 않은 경우
	    if( !regExp1.test(ph2) || !regExp2.test(ph3) ){
				swal({ "icon" : "warning",
					"title" : "전화번호가 유효하지 않습니다." ,
					"text" : "중간 자리는 3~4, 마지막자리는 4글자로 작성해주세요."});
			
				return false;
	    }
	    

		
		// 이메일 유효성 검사
		const regExp3 = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
		
		const inputEmail = $("#email").val().trim();
		
	    if(!regExp3.test(inputEmail)){
				swal({ "icon" : "warning",
					"title" : "이메일이 유효하지 않습니다." ,
					"text" : "아이디 4글자 이상의 이메일 형식으로 작성해주세요."});
			
				return false;
    	}
	    
		// 입력된 전화번호 form태그에 hidden으로 추가하기
	    const phone = $("[name='phone']");
	    
		const memberPhone = $("<input>", {
			type: "hidden", name: "inputPhone",
			value: $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val()
		});
		
		$("form[name='updateForm']").append(memberPhone);
	}
	
	</script>

</body>
</html>