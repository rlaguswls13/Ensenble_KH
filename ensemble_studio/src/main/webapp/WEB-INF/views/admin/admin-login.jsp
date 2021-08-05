<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
	* {
    	font-family: 'Spoqa Han Sans Neo', 'sans-serif'; 
	}
    body{
        background-color: #363636;
        min-height:670px ;
    }
    .login-input{
        width: 250px;
        height: 30px;
        border: 0px;
        padding: 5px;
        padding-left: 10px;
    }
    .btn-beige{
        background-color: #F9F7EB;
        width: 265px;
        border: 0px;
        padding-top : 12px; padding-bottom: 12px;
        margin: 0px;
        border-radius: 3px;
    }
    .btn-grey{
        font-size: 12px;
        display: inline-block;
        background-color: #8E8E8E;
        width: 265px;
        border: 0px;
        padding-top : 12px; padding-bottom: 12px;
        margin: 0px;
        border-radius: 3px;
    }
</style>
<body>
    <div style="padding: 60px;"></div>
    <div style="text-align: center;">
        <img src="${contextPath}/resources/images/common/logo-white.png" style="width: 100px;">
        <div style="padding: 15px;"></div>
        <form action="${contextPath}/adminLogin" method="POST" onsubmit="return loginValidate();">
	        <input type="text" class="login-input" placeholder="아이디" name="memberId" id="memberId">
	        <div style="padding:1px"></div>
	        <input type="password" class="login-input" placeholder="비밀번호" name="memberPw" id="memberPw">
	        <div style="padding:5px"></div>
	        <button class="btn-beige" type="submit">로그인</button>
        </form>
        
        <div style="padding:5px"></div>
        <a href="${contextPath}" class="btn-grey" style="color:black; text-decoration: none;">홈페이지로 이동</a>
    </div>
    <div style="padding: 80px;"></div>
    
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
  
  <script>
		function loginValidate(){
			
			if($('#memberId').val().trim().length==0){
				swal({
					"icon" : "warning",
					"title" : "아이디를 입력해주세요."
 				}).then(function(){
 					$('#memberId').focus(); //아이디 입력창으로 포커스 이동
 				});
				return false;
			}
			
			if($('#memberPw').val().trim().length==0){
				swal({
					"icon" : "warning",
					"title" : "비밀번호를 입력해주세요."
 				}).then(function(){
 					$('#memberPw').focus(); //비밀번호 입력창으로 포커스 이동
 				});
				return false;
			}
		};
		
	</script>
	
  
  
</body>
</html>