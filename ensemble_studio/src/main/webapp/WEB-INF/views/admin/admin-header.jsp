<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin header</title>
     <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- Bootstrap core JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <!-- sweetalert API 추가 --> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- spoqa han sans font -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
	<!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/admin-header.css?ver=234">
<body>
    <div class="wrapper">
        <div class="sidebar">
            <div style="text-align: center; padding-bottom: 20px;">
                <img src="${contextPath}/resources/images/common/logo-white.png" width="100px">
            </div>
            <hr style="width: 90%; border-width: 1px 0px 0px 0px; margin:auto; border-color: #888;">
            <ul >
                <li style="padding-bottom: 0px;"><a href="${contextPath}" ><i class="fa fa-home" ></i>사이트 바로가기</a></li>
            </ul>
            <hr style="width: 90%; border-width: 1px 0px 0px 0px; margin:auto; border-color: #888;">
            <div style="color: #696969; padding-top: 20px; padding-bottom: 5px; padding-left: 25px;">사이트 관리</div>
            <ul>
                <li><a href="${contextPath}/admin"><i class="fa fa-th-large"></i>대시보드</a></li>
                <li><a href="${contextPath}/admin/reservation"><i class="fa fa-calendar"></i>예약 관리</a></li>
                <li><a href="${contextPath}/admin/studio"><i class="fa fa-edit"></i>상품 관리</a></li>
                <li><a href="${contextPath}/admin/sales"><i class="fa fa-line-chart"></i>매출현황</a></li>
                <li><a href="${contextPath}/admin/member"><i class="fa fa-user"></i>회원 관리</a></li>
            </ul>
        </ul>
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