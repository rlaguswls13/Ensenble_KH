<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ensemble Studio</title>

   
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/carousel/">
</head>
<jsp:include page="common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${contextPath}/resources/css/common/main.css?ver=456" type="text/css">


<body>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" style="">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active"> 
              <div class="carousel-img" style=" background-image: url('https://storage.googleapis.com/cr-resource/image/f242c0659290ab6d7b2229d63d416349/fromellapet/613e3ab169b7bb0824484eb05c3f8bdc.jpg'); "></div>
        </div>
          <div class="carousel-item">
            <div class="carousel-img" style=" background-image: url('https://cdn.imweb.me/upload/S20190926a0754ded73eb5/70f20eb08c7f9.jpg'); "></div>
          </div>
          <div class="carousel-item">
            <div class="carousel-img" style=" background-image: url('https://storage.googleapis.com/cr-resource/image/f242c0659290ab6d7b2229d63d416349/fromellapet/915eba63f0746bb78f0ce3775025bc86.jpg'); "></div>
          </div>
          <div class="carousel-item">
            <div class="carousel-img" style=" background-image: url('https://lh3.googleusercontent.com/a5dglzlgrU6gWPd0z6azm_q7uANlGaZM624qpzspm0UDCQuZyDJRt3p_2US5d8xsc3cv8R2tNw7W2JNLpcWmYUlYGVca7Z-EwxvrHxw=s0'); "></div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      <div style="padding:20px;"></div>
      <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Studio View</h5>
      <div style="padding:10px;"></div>
      <div class="row" style="  display: flex; justify-content: center;">
          
          <c:forEach items="${mainRList}" var="r">
          <div class="col-12 col-lg-4 "> 
                <div class="studio-view-cards">
                	<a href="${contextPath}/studio/${r.roomHref}">
                		<div class="card-img" style="background-image: url('${contextPath}/${r.atList[0].filePath}${r.atList[0].fileName}');"></div>
                    	<div class="container card-text1">${r.roomName}</div>
                	</a>
                    <a href="${contextPath}/reservation/rvStatus" class="btn btn-ensemble">예약하기</a>


                    <div style="padding:15px;"></div>
                    <div class="container card-text2">
                        ${r.roomAbout }
                    </div>
                </div>   
          </div>
          </c:forEach>


      </div>
      <div style="padding:20px"></div>
      <hr>
      <div style="padding:20px"></div>
      <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Notice</h5>
      <div style="padding:10px"></div>
      <div class="container">
      
	      <c:if test="${!empty noticeList}">
	      <c:forEach items="${noticeList}" var="notice">
	      	<c:if test="${!empty notice.atList }">
	      	<div class="notice-img" style="background-image:url('${contextPath}/${notice.atList[0].atPath}${notice.atList[0].atName}')"></div>
	      	</c:if>
	      	<c:if test="${empty notice.atList }">
	      	<div class="notice-img" style="background-image:url('${contextPath}/resources/images/common/notice.png')"></div>
	      	</c:if>
		      
		        <div style="padding-bottom: 20px;">
		            <h6 style="display: inline-block;">[ ${notice.boardCTNm}] ${notice.boardTitle }</h6>
		            <span style="float: right; color:#888">조회수 ${notice.boardReadCount }</span>
		      </div>
	      </c:forEach>
	      </c:if>
      </div>

      <div style="padding:30px;"></div>

      
      <jsp:include page="common/footer.jsp"></jsp:include>
</body>

</html>


