<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<!-- 스왈창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/member/findIdPwd.css"
	type="text/css" />
</head>
<body>

	<div class="container">
		<div class="find_body">
			<div class="logo col-md-12">
				<img src="${contextPath}/resources/images/common/logo.png"
					width="30%" height="30%" onclick="location.href='/ensemble'">
			</div>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-link active findId col-6" id="nav-id-tab"
						data-toggle="tab" href="#nav-id" role="tab" aria-controls="nav-id"
						aria-selected="true">아이디 찾기</a> <a class="nav-link findPwd col-6"
						id="nav-pwd-tab" data-toggle="tab" href="#nav-pwd" role="tab"
						aria-controls="nav-pwd" aria-selected="false">비밀번호 찾기</a>
				</div>
			</nav>
			<div class="findborder">

				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-id" role="tabpanel"
						aria-labelledby="nav-id-tab">
						<div class="findId-con findIdPwd">
							<form action="findId" method="POST" onsubmit="">
								<div class="find-text1">등록된 이메일로 찾기</div>
								<div class="find-text2">회원정보 이메일 주소와 입력한 이메일 주소가 같아야 아이디를
									찾을 수 있습니다.</div>

								<hr>
								<div class="form-group" id="nickForm">
									<div class="name1">닉네임</div>
									<input type="text" class="form-control input" id="inputNick"
										name="inputNick" placeholder="닉네임을 입력해주세요."
										required="required">
								</div>
								<div class="form-group" id="emailform">
									<div class="email1">이메일</div>
									<input type="text" class="form-control input" id="inputEmail"
										name="inputEmail" placeholder="이메일을 입력해주세요."
										required="required">
									<button type="submit" class="btn next-btn">다음으로</button>
								</div>


							</form>

						</div>
					</div>
					<div class="tab-pane fade" id="nav-pwd" role="tabpanel"
						aria-labelledby="nav-pwd-tab">
						<div class="findPwd-con findIdPwd">
							<form action="findPwd" method="POST" onsubmit="">
								<div class="find-text1">등록된 이메일로 찾기</div>
								<div class="find-text2">아래의 본인확인을 통해 임시비밀번호가 이메일로 전송됩니다.</div>
								<hr>
								<div class="form-group" id="idform">
									<div class="id1">아이디</div>
									<input type="text" class="form-control input" id="inputId"
										name="inputId" placeholder="아이디를 입력해주세요." required="required">
								</div>
								<div class="form-group" id="emailform">
									<div class="email1">이메일</div>
									<input type="text" class="form-control input" id="inputEmail"
										name="inputEmail" placeholder="이메일을 입력해주세요."
										required="required">
									<button type="submit" class="btn extra-btn">임시비밀번호 발송</button>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<c:if test="${!empty title }">
		<script>
			swal({
				"icon" : "${icon}",
				"title" : "${title}",
				"text" : "${text}"
			});
		</script>
		<c:remove var="icon" />
		<c:remove var="title" />
		<c:remove var="text" />
	</c:if>
</body>
</html>