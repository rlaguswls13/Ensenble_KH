<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reviewBoardList</title>
    
    <!-- External CSS-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/html_checking_div.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/reviewBoardList.css">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
   
    <!-- JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    
    <!-- include summernote -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <!-- sweetalert API 추가 --> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    
    <content>		
        <div class="" id="board_header">
            <div class="row-sm-12 d-flex justify-content-center">
                <div class="col" id="board_head_Title">Review</div>
            </div>
            <div></div>
            <form action="boardSerach">
                <div class="row-sm-12 d-flex justify-content-center">
                    <input type="text" id="board_main_search_input">
                    <button class="btn btn-success m-1" id="board_main_search_btn">검색</button>
                </div>
            </form>
            <div class="row-sm-12 d-flex justify-content-start" id="div_btn"></div>
        </div>

        <div class="row-sm-12 d-flex justify-content-end text-center">
            <div class="col-sm-4">
                <button>글작성</button>
            </div>
        </div>

        <!-- 리뷰 내용 추가-->
        <div class="row-sm-12" id="shell">
            <div class="row-sm-12 mr-4 my-4" id="board_content">
                <div class="d-flex row-sm-12">
                    <div class="col-sm-2"><img src="" alt=""></div>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">유저닉네임</div>
                </div>
                <div class="row-sm-12">
                    <div class="col-sm-12" id="board_img_div">
                        <a href=""><img src="" alt="">1</a>
                    </div>
                </div>
                <div class="d-flex row-sm-12">
                    <div class="col-sm-4">
                        <img src="" alt=""> 댓글
                    </div>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <img src="" alt=""> 하트
                    </div>
                </div>
                <div class="row-sm-12">
                    <div class="col-sm-12" id="title-content">
                        <a href=""><h5>제목입니다.</h5></a>
                    </div>
                </div>
                <div class="row-sm-12">
                    <div class="col-sm-12" id="hashtag-content">
                        <a href="">#해시태그</a>
                    </div>
                </div>
            </div> 
        </div> 

        <div class="row-sm-12 d-flex justify-content-center" id="">
            페이지
        </div>
    </content>
    
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
    <script>
        $(document).ready(function(){
            var category_btn = '';
            
            // 버튼을 #개 추가
            for (var i = 0; i < 3; i++) {
                var add_btn = '<button type="button" class="btn btn-success m-1" id="cartegoty_btn">버튼{}</button>';
                add_btn = add_btn.replace('{}', i+1);
                category_btn = category_btn + add_btn + '\n';
            }
            
            $('#div_btn').html(category_btn);
            
            // 버튼을 동적연결한다.
            $(document).on("click", "#cartegoty_btn", function(){
                var idx = $(this).index();
                
                alert('버튼 {}을 눌렀습니다.'.replace('{}', idx))
            });
            
        });
    </script>

</body>
</html>