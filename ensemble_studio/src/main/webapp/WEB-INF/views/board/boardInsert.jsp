<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>boardInsert</title>
    
    <!-- External CSS-->
    <link rel="stylesheet" type="text/css" href="../resoruces/css/html_checking_div.css">
    <link rel="stylesheet" type="text/css" href="../resoruces/css/reviewBoardDetail.css">

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
    
    <h1>게시글 작성</h1>
    <hr>

    

    <form action="" method="POST">
        <div class="row-sm-12 d-flex">
            <div class="col-sm-10">게시판 종류</div>
            <div class="col-sm-2">카테고리</div>
        </div>
        <div class="row-sm-12 d-flex">
            <div class="col-sm-9">해시태그 입력</div>
            <div class="col-sm-3">
                <button class="btn-secondary">등록</button>
                <button class="btn-secondary">취소</button>
            </div>
            <div></div>
        </div>
        <textarea id="summernote" name="editordata"></textarea>
    </form>


    <script>
         $('#summernote').summernote({
            placeholder: '<h1>글을 작성해주세요</h1>',
            tabsize: 2,  // 
            height: 600, // 작성칸 높이
            minHeight : null, // 작성칸 최소 높이 
            maxHeight : null, // 작성칸 최대 높이 
            lang: 'ko-KR',    // 작성칸 초기 언어
            tabDisable: true, // tab 기능 여부
            spellCheck: true, // 맞춤법 체크

            toolbar: [
                    // [설정 그룹], [해당 속성 버튼]]
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                    ['color', ['forecolor','color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert',['picture','link','video']],
                    ['view', ['fullscreen', 'help']]
                    ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
    </script>


    
</body>


</html>