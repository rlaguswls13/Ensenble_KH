<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reviewBoardDetail</title>

</head>
<body>
    <content>
        <form action="" method="POST">
            <div class="" id="review_detail_header">
                <div class="row-sm-12">
                    <div class="row-sm-12">
                        <div class="col-sm-12">스튜디오룸</div>
                    </div>
                    <div class="row-sm-12">
                        <div class="col-sm-12">글 제목</div>
                    </div>
                    <div class="row-sm-12 d-flex text-center">
                        <div class="col-sm-2">
                            <img src="" alt="">
                            <span>유저닉네임</span>
                        </div>
                        <div class="col-sm-3">
                            <span>날짜</span>
                        </div>
                        <div class="col-sm-3">
                            <span>좋아요</span>
                        </div>
                        <div class="col-sm-2">
                            <span>조회수</span>
                        </div>
                        <div class="dropdown mr-1">
                            <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                              <a class="dropdown-item" href="#">수정</a>
                              <a class="dropdown-item" href="#">삭제</a>
                            </div>
                        </div>               
                    </div>
                </div>
            </div>
            <hr>
            <div class="" id="review_detail_context">
                

            </div> 
            
            <hr>
            <h5 id="replyTitle">댓글 (수)</h5>
            <hr>
                            
            <div class="row-sm-12 d-flex" id="input-reply">
                <div class="col-sm-1">
                    <img src="" alt="">
                </div>
                <div class="col-sm-11">
                    <input type="text">
                    <button>등록</button>
                </div>
            </div>

            <div class="row-sm-12 d-flex" id="detail-reply">
                <div class="col-sm-1">
                    <img src="" alt="">
                </div>
                <div class="col-sm-11">
                    <div class="row-sm-12 d-flex">
                        <div class="col-sm-10">1</div>
                        <div class="dropdown mr-1">
                            <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                            <a class="dropdown-item" href="#">수정</a>
                            <a class="dropdown-item" href="#">삭제</a>
                            <a class="dropdown-item" href="#">신고</a>
                            </div>
                        </div>   
                    </div>
                    <div class="row-sm-12 d-flex">
                        <div class="col-sm-4">
                            <span>작성일</span>
                        </div>
                        <div class="col-sm-4">
                            <span>좋아요</span>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <hr>
            <button id="move-board-list">목록으로</button>
        </form>
    </content>
    
    
</body>
</html>