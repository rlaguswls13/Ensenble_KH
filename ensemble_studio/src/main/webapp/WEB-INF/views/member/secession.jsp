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
	href="${contextPath}/resources/css/member/secession.css"
	type="text/css" />
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="secession-form">
			<form action="secession" method="post" onsubmit="return secessionValidate();">
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
							<td class="agree-text">[제1조] 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가
								불가능합니다.탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다. <br>
								<br> [제2조] 회원탈퇴 후 회원정보 및 사이트 이용기록은 모두 삭제됩니다.회원정보 및 사이트
								이용기록은 최대 1개월 보관 후 모두 삭제되며 삭제된 데이터는 복구되지 않습니다.

							</td>
						</tr>

						<tr>
							<td>
								<!--                             <input type="checkbox" id="check_all">
                            <label for="check_all">탈퇴 약관에 동의하며 이의를 제기하지 않겠습니다.</label> -->
							</td>
						</tr>
					</table>

				</div>
				<input type="checkbox" id="agree" name="agree"> <label
					for="check_all">탈퇴 약관에 동의하며 이의를 제기하지 않겠습니다.</label>
				<div class="form-group col-md-12 agree-btn">
					<button type="button"
						class="btn btn-lg secession-btn cancle col-md-6" onclick="location.href='updateMember'">취소</button>
					<button type="submit"
						class="btn btn-lg secession-btn secession col-md-6">탈퇴</button>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		// 약관 동의가 체크되었을 때 탈퇴 진행
		function secessionValidate(){
			if($("#agree:checked").length == 0){
				swal({"icon" : "info", "title" : "탈퇴 약관에 동의해주세요."})
				return false;
			}
		}
	</script>
</body>
</html>