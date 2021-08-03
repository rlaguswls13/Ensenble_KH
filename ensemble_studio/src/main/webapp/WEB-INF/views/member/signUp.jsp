<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUp</title>

<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- sweetalert API 추가 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
 


<link rel="stylesheet" href="${contextPath}/resources/css/member/signUp.css" type="text/css" />
</head>
<body>
    <div class="container">
        <div class="signup-form">
            <div class="logo col-md-12">
                <img src="${contextPath}/resources/images/common/logo.png" width="30%" height="30%">
            </div>
            <form action="signUp" name="signUpForm" method="post" onsubmit="return validate();">
                <h5>회원가입</h5>
                <hr>
                <div class="form-group">
                    <label>아이디</label>
                    <input type="text" class="form-control input" id="id" name="memberId" placeholder="아이디" 
                        autocomplete="off" required="required">
                </div>
                <div class="col-md-12">
                    <span id="checkId">&nbsp;</span>
                </div>
                <div class="form-group">
                    <label>닉네임</label>
                    <input type="text" class="form-control input" id="nickname" name="memberNick" placeholder="닉네임"
                        required="required">
                </div>
                <div class="col-md-12">
                    <span id="checkNickname">&nbsp;</a></span>
                </div>
                <div class="form-group">
                    <label>비밀번호</label>
                    <input type="password" class="form-control input" id="pwd1" name="memberPw" placeholder="비밀번호"
                        required="required">
                </div>
                <div class="col-md-12">
                    <span id="checkPwd1">&nbsp;</span>
                </div>
                <div class="form-group">
                    <label>비밀번호 확인</label>
                    <input type="password" class="form-control input" id="pwd2" name="memberPw2" placeholder="비밀번호 확인"
                        required="required">
                </div>
                <div class="col-md-12">
                    <span id="checkPwd2">&nbsp;</span>
                </div>
                <div class="form-group">
                    <label>이메일</label>
                    <input type="email" class="form-control input" id="email" name="memberEmail" placeholder="이메일"
                        required="required">
                </div>
                <div class="col-md-12">
                    <span id="checkEmail">&nbsp;</span>
                </div>
                <div class="form-group">
                    <label>전화번호</label>
                    <div class="form-group row col-md-12 inputPhone">
                        <div class="col-md-4 inputPhone1">
                            <select class="custom-select" id="phone1" name="phone" required>
                                <option>010</option>
                                <option>011</option>
                                <option>016</option>
                                <option>017</option>
                                <option>019</option>
                            </select>
                        </div>

                        <!-- number타입의 input태그에는 maxlength를 설정할 수 없음 -->
                        <!-- 전화번호2 -->
                        <div class="col-md-4 inputPhone1">
                            <input type="number" class="form-control phone" id="phone2" name="phone" placeholder="0000"
                                required>
                        </div>

                        <!-- 전화번호3 -->
                        <div class="col-md-4 inputPhone1">
                            <input type="number" class="form-control phone" id="phone3" name="phone" placeholder="0000"
                                required>
                        </div>
                    </div>
                    <div class="col-md-12 inputPhone">
                        <span id="checkPhone">&nbsp;</span>
                    </div>
                </div>
                <div class="agree-title">
                    <h5>이용 약관에 동의해 주세요</h5>
                </div>
                <div class="form-group agree-form">
                    <table class="checkbox_group">
                        <tr>
                            <td>
                                <input type="checkbox" id="check_1" class="normal">
                                <label for="check_1">개인정보 처리방침 동의</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" id="check_2" class="normal">
                                <label for="check_2">서비스 이용약관 동의</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" id="check_3" class="normal">
                                <label for="check_3">마케팅 수신 동의</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" id="check_all">
                                <label for="check_all">전체 동의</label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-block btn-lg signUp-btn">회원가입 완료</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="${contextPath}/resources/js/member.js"></script>
    
    
</body>
</html>