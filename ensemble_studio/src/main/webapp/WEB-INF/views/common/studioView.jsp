<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${room.roomName}</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/carousel/">
    <jsp:include page="header.jsp"></jsp:include>
</head>
<style>
    .carousel-img{
        width: 100%; height: 50vw; 
        background-repeat: no-repeat; 
        background-size:cover; 
        background-position: center;
    }
    .carousel-indicators > li {
        width:7px; height: 7px;
        margin-right: 20px;
        border-radius: 50%;
    }
    .box1{
        height: 270px;
    }
    .opt-box{
        padding-top: 10px ;
        height: auto;
    }
    .opt-text1{
        display: inline-block;
        width: 100px; height: 40px;
        font-weight: 500;
    }
    .opt-text2{
        display: inline-block;
        width: 260px;
        position: absolute;
        font-weight: 300;
    }
    .pr-box{
        padding-top: 10px ;
        height: auto;
    }
    .pr-text1{
        width: 100px; height: 40px;
        display: inline-block;
    }
    .pr-text2{
        display: inline-block;
        text-decoration: line-through;
        color: #888;
    }
    .pr-text3{
        display: inline-block;
        color: #FF0089;
        font-size: larger;
        font-weight: 300;
    }
    .pr-text4{
        display: inline-block;
        padding-left: 5px;
        font-size: larger;
        font-weight: 600;
    }
    .pr-text5{
        display: inline-block;
        font-weight: 300;
    }
    .btn-ensemble{
        background-color: #FDCDCD;
        width: 100%;
        padding-top : 10px; padding-bottom: 10px;
        margin: 0px;
    }
    .gallery-img{
        width: 30%;
        display: inline-block;
        border: 1px solid rgb(228, 228, 228);
        background-repeat: no-repeat; 
        background-size:cover; 
        background-position: center;
    }
    .gallery-img:after {
        content: "";
        display: block;
        padding-bottom: 100%;
    }
    .gallery-img:hover{
    	opacity : 0.7;
    }
    .width65{
           width: 65%;
           display: inline-block;
       }
       .user-profile{
            width: 20px; height: 20px;
            border: 1px solid gainsboro;
            border-radius: 100px;
            background-repeat: no-repeat;
            background-size: cover;
            display: inline-block;
            vertical-align:middle;
       }
       .user-name{
           width:fit-content;
           display: inline-block;
           font-size: 12px;
           margin-left: 5px;
           font-weight: 500;
       }
       .time{
           width:fit-content;
           display: inline-block;
           font-size: 12px;
           margin-left: 5px;
           font-weight: 300;
       }
       .comments{
        width:fit-content;
           display: inline-block;
           font-size: 12px;
           margin-left: 5px;
           font-weight: 400;
           color: grey;
            margin-right: 8px;
       }
       .report{
        width:fit-content;
           display: inline-block;
           font-size: 12px;
           margin-left: 5px;
           font-weight: 300;
       }
       .q-img{
           width:100px; height: 100px;
           border: 1px solid gainsboro;
           float: right;
           border-radius: 5px;
           background-repeat: no-repeat;
           background-size: cover;
       }
       
       .modal{
	        display: none;
			z-index: 500;
			width: 100%;
			height: 100%;
			position: fixed;
			top: 0;
			left: 0;
			background-color: rgba(0, 0, 0, 0.5);
		}
		.modal button {
			position: absolute;
			top: 3rem;
			right: 3rem;
			background: transparent;
			border: 0;
			color: #ffffff;
			font-size: 3rem;
		}
		.modalBox {
			position: absolute;
			background : transparent;
			width: 100%;
			height: 100%;
			text-align: center;
			align-items: center;
		}
		.modalBox img {
			max-width :100%;
			max-height:100%;
		}
       
	    @media(min-width:770px){
	        .pr-box{
	            padding-left: 20px;
	        }
	        .border-box{
	            border-right: thin solid rgb(223, 223, 223);
	        }
	    }
	    @media(max-width:769px){
	        .border-box{
	            border-bottom: thin solid rgb(223, 223, 223);
	        }
	    }
		
</style>
<body>
    <div style="padding:20px;"></div>
    <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">${room.roomName}</h5>
    <div style="padding:10px;"></div>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" style="">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active"> 
              <div class="carousel-img" style="background-image: url('${contextPath}/${room.atList[0].filePath}${room.atList[0].fileName }'); "></div>
        </div>
        <c:forEach items="${room.atList}" var="at" begin="1"> 
	    <c:if test="${at.fileType==1}">
	    	<div class="carousel-item">
            <div class="carousel-img" style="background-image: url('${contextPath}/${at.filePath}${at.fileName }'); "></div>
          </div>
	    </c:if>
	    </c:forEach>
          
         
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
      <div class="container">
        <h6 style=" font-family: 'Noto Serif KR', serif; font-weight: 600; font-size:24px; line-height:2;">${room.roomName}</h6>
        <div style="font-family: 'cafe24 oneprettynight';">
          ${room.roomAbout}
        </div>
      </div>

      
      <div style="padding:10px;"></div>
      <hr>
      <div class="container">
        <div class="row">
            <div class="col-12 col-md-6 box1 border-box" >
                <div class="opt-box">
                    <div class="opt-text1">??????</div>
                    <div class="opt-text2">${room.roomConfig }</div>
                </div>
                <div class="opt-box">
                    <div class="opt-text1">?????? ??????</div>
                    <div class="opt-text2">?????? 5D Mark II , ?????? 5D Mark  IV,  <br>70-200mm f ??????, ??????????????? 2???, <br>????????????,  ?????????, ????????????, ?????? </div>
                </div>
                <div style="padding: 60px;"></div>
                <c:if test="${!empty countReview }">
	                <c:if test="${room.roomName eq 'A ROOM' }">
	                <a href="${contextPath }/board/1/list?bctN=1" style="color: black; font-weight: 500;">?????? ?????? ${countReview}??? ?????? ?????? &nbsp;&nbsp;<span style="color:#888">></span></a>
	                </c:if>
	                <c:if test="${room.roomName eq 'B ROOM' }">
	                <a href="${contextPath }/board/1/list?bctN=2" style="color: black; font-weight: 500;">?????? ?????? ${countReview}??? ?????? ?????? &nbsp;&nbsp;<span style="color:#888">></span></a>
	                </c:if>
	                <c:if test="${room.roomName eq 'C ROOM' }">
	                <a href="${contextPath }/board/1/list?bctN=3" style="color: black; font-weight: 500;">?????? ?????? ${countReview}??? ?????? ?????? &nbsp;&nbsp;<span style="color:#888">></span></a>
	                </c:if>
                </c:if>
                
            </div>
            <div class="col-12 col-md-6 box1" >
                <div class="pr-box" >
                    <div class="pr-text1">?????????</div>
                    <div class="pr-text2"><fmt:formatNumber value="${room.roomPrice }" pattern="#,###,###" />???</div> <br>
                    <div class="pr-text1">?????????</div>
                    <div class="pr-text3">${room.roomDiscount }%</div>
                    <div class="pr-text4"><fmt:formatNumber value="${room.roomDiscountedPrice }" pattern="#,###,###" />???</div>
                    <hr>
                </div>
                <div class="pr-box">
                    <div class="pr-text1">?????? ??????</div>
                    <div class="pr-text5">${room.roomPrimaryOption }</div>
                    <hr>
                    <div style="padding:5px"></div>
                    <a href="../reservation/rvStatus" class="btn btn-ensemble">????????????</a>
                    <div style="padding:5px"></div>
                </div>
            </div>
          </div>
      </div>
      <hr>

    <div style="padding:20px;"></div>
    <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Gallery</h5>
    <div style="padding:10px;"></div>

    <div style="text-align: center;">
	    <c:forEach items="${room.atList}" var="at"> 
	    <c:if test="${at.fileType==2}">
	    	<div class="gallery-img" style="background-image: url(${contextPath}/${at.filePath}${at.fileName});"></div>
	    </c:if>
	    </c:forEach>
    </div>
    <div style="padding:20px"></div>

    <hr>

    <div style="padding:20px;"></div>
    <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Review</h5>
    <div style="padding:10px;"></div>

	<c:forEach items="${reviewList}" var="review">
		<div class="container">
	        <div class="width65">
	            <h6><a href="../board/1/${review.boardNo }?cp=1">${review.boardTitle }</a></h6>
	            <p id="tmp" style="font-size: 12px; line-height: 1.4; display:block; height:30px">
		            <c:if test="${fn:length(review.boardContent) >= 20 }">
		            	<c:out value='${fn:substring(review.boardContent,0, 20)}' />...
		            </c:if>
		            <c:if test="${fn:length(review.boardContent) < 20 }">
		            	<c:out value='${review.boardContent}' />
		            </c:if>
	            </p>
	            <div class="user-profile" style="background-image: url('${contextPath}${review.memberImage }');"></div>
	            <div class="user-name">${review.memberNk }</div>
	            <div class="time">${fn:substring (review.boardDT,0,11) }</div>
	            <div class="comments">?????? ${review.replyCount }</div>
	            <a href="#">
	                <img src="https://drive.google.com/uc?id=1e719tW6BVTrSPiZQIxJZ8LUWWuNsx0Lc" height="15px">
	                <div class="comments">?????????</div>
	            </a>
	                
	        </div>
	        <c:if test="${!empty review.atList }">
	        <div class="q-img" style="background-image: url(${review.atList[0].atPath}/${review.atList[0].atName});"></div>
	        </c:if>
	        <div style="padding:5px"></div>
	        <hr>
	        <div style="padding:5px"></div>
	    </div>
	</c:forEach>
    
	<div class="modal">
		<div class="modalBox">
			<img class="modal-img" src="">
		</div>
		<button>&times;</button>
	</div>
    
    <div style="padding:20px"></div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script>
	    $(function(){
	    	$(".gallery-img").on("click", function(){
	    		$(".modal").show();
	    		var src = $(this).css("background-image").replace(/^url\(['"](.+)['"]\)/, '$1');
	    		$(".modalBox img").attr("src", src);
	    		
	    	})
	    	
	    	//.modal?????? button??? ???????????? .modal??????
			$(".modal button").click(function(){
				$(".modal").hide();
			});
		
			//.modal?????? ????????? ??????
			$(".modal").click(function (e) {
	    		if (e.target.className != "modal-img") {
	    			$(".modal").hide();
	   			} else {
	   				return false;
	    		}
	  		});
	
	    });
	    
    </script>
</body>
</html> 