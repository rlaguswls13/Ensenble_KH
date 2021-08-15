<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<!-- CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/member/secession.css?ver=123"
	type="text/css" />
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="secession-form">
			<form action="secession" method="post"
				onsubmit="return secessionValidate();">
				<h5>회원탈퇴</h5>
				<hr>
				<div class="form-group">
					<label>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인합니다.</label>
				</div>



				<div class="form-group">
					<label>비밀번호 확인</label> <input type="password"
						class="form-control input" id="currentPwd" name="currentPwd"
						placeholder="비밀번호 확인" required="required">
				</div>



				<div class="agree-title">
					<h6>탈퇴 약관을 반드시 확인해주세요.</h6>
				</div>
				<div class="form-group agree-form">
					<table class="checkbox_group">
						<tr>
							<td class="agree-text">[회원탈퇴 약관]<br><br>

회원탈퇴 신청 전 안내 사항을 확인해 주세요.<br>
회원탈퇴를 신청하시면 현재 로그인 된 아이디는 사용하실 수 없습니다.<br>
회원탈퇴를 하더라도, 서비스 약관 및 개인정보 취급방침 동의하에 따라 일정 기간동안 회원 개인정보를 보관합니다.<br><br>

 - 회원 정보<br>
 - 상품 예약에 관한 기록<br>
 - 소비자 불만 또는 처리 과정에 관한 기록<br>
 - 게시판 작성 및 사용후기에 관한 기록<br><br>

※ 상세한 내용은 사이트 내 개인정보 취급방침을 참고해 주세요. 
 
							</td>
						</tr>
					</table>

				</div>
				<input type="checkbox" id="check_all" name="agree"> <label
					for="check_all"></label><span style="font-size: 10pt; color:black" id="check-mark">탈퇴 약관에 동의하며 이의를 제기하지 않겠습니다.</span>
				<div class="form-group col-md-12 agree-btn">
					<button type="button"
						class="btn btn-lg secession-btn cancle col-md-6"
						onclick="location.href='updateMember'">취소</button>
					<button type="button"
						class="btn btn-lg secession-btn secession col-md-6"
						data-toggle="modal" data-target="#modal_form" id="modal_open_btn">탈퇴</button>
				</div>

				<!-- 모달창 -->
				<div class="modal" tabindex="-1" id="modal_form">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-body">
								<p>정말 탈퇴하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn no-btn" data-dismiss="modal">아니오</button>
								<button type="submit" class="btn yes-btn">예</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>



	<script>
		// 약관 동의가 체크되었을 때 탈퇴 진행
		function secessionValidate() {
			if ($("#check_all:checked").length == 0) {
				swal({
					"icon" : "info",
					"title" : "탈퇴 약관에 동의해주세요."
				})
				return false;
			}
		}
	</script>
	



</body>
</html>