<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- Bootstrap core JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <!-- sweetalert API 추가 --> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- spoqa han sans font -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
	<!-- google font : noto serif -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
	<!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
	@font-face {
	    font-family: 'Cafe24Oneprettynight';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
    * { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; }
   	a { color: black; }
   	a:hover{
		text-decoration: none !important;
		color:#FF657D !important;
	}
    .header-navbar-border{
        padding-top: 15px;
        padding-bottom: 15px;
        border-top: 1px solid rgb(182, 182, 182);
        border-bottom: 1px solid rgb(182, 182, 182);
        background-color: white;
    }
    
    .noto-serif{
        font-family: 'Noto Serif KR', serif;
    }
    .noto-serif-bold{
        font-family: 'Noto Serif KR', serif;
        font-weight: 700;
    }
    .padding-right-50{
      padding-right: 50px;
    }

    @media (min-width:990px){
      .header-home-mob{
        visibility: hidden;
      }
      .header-home-web{
        display: inline-block;
      }
      .navbar-nav.navbar-center {
        position: absolute;
        left: 50%;
        transform: translatex(-50%);
      } 
    }
    @media(max-width:980px){
      .header-home-web{
        display:none;
      }
    }
</style>
<body>
  <div >
    <div style="padding:20px; text-align: center;">
      <a href="${contextPath}">
        <img src="${contextPath}/resources/images/common/logo.png" style="width:100px;">
      </a>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light header-navbar-border" style="z-index:100">


      <a class="navbar-brand noto-serif-bold header-home-mob" href="${contextPath }">Home</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
  
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto navbar-center">
          <li class="nav-item active padding-right-50">
            <a class="nav-link noto-serif header-home-web" href="${contextPath }" >Home</a>
          </li>
          <li class="nav-item active padding-right-50">
            <a class="nav-link noto-serif" href="${contextPath }/about">About</a>
          </li>
          <li class="nav-item active dropdown padding-right-50" style="width:165px">
            <a class="nav-link noto-serif" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Studio View
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <c:forEach items="${mainRList}" var="r">
            	<a class="dropdown-item noto-serif" href="${contextPath }/studio/${r.roomHref}">${r.roomName}</a>
            </c:forEach>
            </div>
          </li>
          <li class="nav-item active padding-right-50">
            <a class="nav-link noto-serif" href="${contextPath}/board/1/list">Review</a>
          </li>
          <li class="nav-item active dropdown padding-right-50">
            <a class="nav-link noto-serif" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              CS
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item noto-serif" href="${contextPath}/board/2/list">Notice</a>
              <a class="dropdown-item noto-serif" href="${contextPath}/board/3/list">FAQ</a>
              <a class="dropdown-item noto-serif" href="${contextPath}/board/4/list">1:1</a>
            </div>
          </li>
          <c:if test="${empty loginMember}">
            <li class="nav-item active">
                <a href="${contextPath}/member/login" class="icon" id="user-icon" style="display: inline-block; padding-top:8px; "><i class="fa fa-user"></i></a>
            </li>
          </c:if>
          <c:if test="${!empty loginMember}">
            <li class="nav-item active dropdown">
              <a class="nav-link noto-serif" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-user"></i>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item noto-serif" href="${contextPath}/member/myPage">My Page</a>
                <a class="dropdown-item noto-serif" href="${contextPath}/member/logout">Logout</a>
              </div>
            </li>
          </c:if>
          
        </ul>
      </div>
    </nav>

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