<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application"
	value="${ pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" 
    	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/member/login.css" type="text/css" />
</head>


<body>
    <div class="container">
        <div class="login_body row">
            <div class="logo col-md-12">
                <img src="${contextPath}/resources/images/common/logo.png" width="30%" height="30%" onclick="location.href='/ensemble'">
            </div>
            <form class="row login_Form" action="login" method="POST"
                onsubmit="return loginValidate();">
                <div class="form-floating col-md-12">
                    <input type="text" class="form-control" id="floatingId" name="memberId" placeholder="아이디" value="${cookie.saveId.value}">
                </div>
                <div class="form-floating col-md-12">
                    <input type="password" class="form-control" id="floatingPassword" name="memberPw" placeholder="비밀번호">
                </div>
                
                <%-- 이전에 저장해둔 아이디가 존재한다면 변수 선언--%>
                <c:if test="${!empty cookie.saveId.value}">
                	<c:set var="ch" value="checked"/>
                </c:if>
                <div class="checkbox mb-2">
                    <label>
                        <input type="checkbox" name="save" id="save" ${ch}>ID 기억하기
                    </label>
                </div>
                <button class="btn-lg login-btn" type="submit">로그인</button>
                <div class="login_line col-md-12">
                    <hr>
                </div>
                <div class="login_naver">
                    <a href="#"><img src="${contextPath}/resources/images/common/naverLogin.png" id="naverimg" class="btn-lg login-btn" width="100%"
                            height="80%"></a>
                </div>
                <div class="login_line col-md-12">
                    <hr>
                </div>
                <p class="mt-2 col-md-6 findId"><a href="${contextPath}/member/findIdPwd" class="login_bottom">ID/PW 찾기</a></p>
                <p class="mt-2 col-md-6"><a href="${contextPath}/member/signUp" class="login_bottom">회원가입</a></p>
            </form>
        </div>
    </div>
    
    <script>
    	// 로그인 수행 시 아이디/비밀번호가 작성되었는지 확인하는 유효성 검사
    	function loginValidate(){
    		
	    	// 아이디가 입력되지 않았을 경우
	    	if($("#memberId").val().trim().length == 0){
	    		swal({
	    			"icon" : "warning",
	    			"title" : "아이디를 입력해주세요."
	    		}).then(function()){
	    			$("#memberId").focus();
	    		});
	    		
	    		// 제출되지 않도록 submit 기본 이벤트 제거
	    		return false;
	    		
	    	}
	    	
	    	// 비밀번호가 입력되지 않았을 경우
	    	if($("#memberPw").val().trim().length == 0){
	    		
	    		swal({
	    			"icon" : "warning",
	    			"title" : "비밀번호를 입력해주세요."
	    		}).then(function(){
	    			$("#memberPw").focus();
	    		});
	    		
	    		return false;
	    	}
    		
    	}
    	
    </script>
</body>
</html>