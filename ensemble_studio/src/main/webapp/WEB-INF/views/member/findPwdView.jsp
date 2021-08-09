<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<!-- CSS -->
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

<link rel="stylesheet"
	href="${contextPath}/resources/css/member/findPwdView.css"
	type="text/css" />
</head>
<body>
	<div class="container">
		<div class="find_body">
			<div class="logo col-md-12">
				<img src="${contextPath}/resources/images/common/logo.png" width="30%" height="30%" onclick="location.href='/ensemble'">
			</div>

			<div class="find_content">
				<div class="findView_title">비밀번호 찾기</div>
				<div class="form-group findView_text">
					비밀번호가 입력하신 이메일 주소로 전송되었습니다. 메일함을 확인해주세요.
					<button type="submit" class="btn main-btn" onclick="location.href='/ensemble'">메인 페이지로 이동</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>