<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>에러 페이지</title>
</head>
<style>
	button{
		width:200px;
		height:50px;
		border : 0px;
		border-radius : 5px;
		background-color : #eee;
		margin:10px;
	}		
</style>
<body>
	<br><br><br><br><br><br>
	<center><img src="https://www.nicepng.com/png/full/135-1358116_error-png.png" style="width:100px;" ></center>
	<br>
	<h2 align="center">에러가 발생했습니다.</h2>
	<h3 align="center">${errorMsg}</h3>
	<div align="center">
		<button type="button" onclick="history.back();">이전 페이지로 이동</button>
		<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}';">메인 페이지로 이동</button>
	</div>
	
</body>
</html>