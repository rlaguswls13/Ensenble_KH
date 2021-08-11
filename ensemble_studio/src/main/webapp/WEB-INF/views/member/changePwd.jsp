<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<!-- CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/member/myPageTopBar.css"
	type="text/css" />
<link rel="stylesheet"
	href="${contextPath}/resources/css/member/changePwd.css"
	type="text/css" />
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<!-- 마이페이지 탑바 -->
		<jsp:include page="myPageTopBar.jsp"></jsp:include>
		<div class="change-form">
			<form action="changePwd" method="POST"
				onsubmit="return pwdValidate();">
				<h5>비밀번호변경</h5>
				<hr>
				<div class="form-group">
					<label>현재 비밀번호</label> <input type="password"
						class="form-control input" id="currentPwd" name="currentPwd"
						placeholder="비밀번호" required="required">
				</div>
				<div class="form-group">
					<label>새 비밀번호</label> <input type="password"
						class="form-control input" id="newPwd1" name="newPwd1"
						placeholder="새 비밀번호" required="required">
				</div>
				<div class="form-group">
					<label>새 비밀번호 확인</label> <input type="password"
						class="form-control input" id="newPwd2" name="newPwd2"
						placeholder="새 비밀번호 확인" required="required">
				</div>
				<div class="col-md-12">
					<span id="checkPwd2">&nbsp;</span>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-block btn-lg change-btn">변경하기</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script>
		// 비밀번호 유효성 검사 
		function pwdValidate(){
			const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
			
			const newPwd1 = $("#newPwd1").val().trim();
			const newPwd2 = $("#newPwd2").val().trim();
			
			if( !regExp.test(newPwd1) || ( newPwd1 != newPwd2 ) ){
				swal({
					"icon" : "error", 
					"title" : "비밀번호가 유효하지 않습니다."
				});
				
				return false;
			}
			
		};
		
		$("#newPwd2").on("input", function(){
			
			const newPwd3 = $("#newPwd1").val().trim();
			const newPwd4 = $("#newPwd2").val().trim();
			
			if(newPwd3 == newPwd4){
				$("#checkPwd2").text("비밀번호가 일치합니다.").css("color", "black");
			} else{
				$("#checkPwd2").text("비밀번호가 불일치합니다.").css("color", "red");
			}
			
		});
		
	</script>
</body>
</html>