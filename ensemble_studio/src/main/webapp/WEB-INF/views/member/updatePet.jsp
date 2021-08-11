<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>반려동물 정보 수정</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPageTopBar.css" type="text/css" />
    <style>
		*{
			color:black;
		}
        .pet-form {
            width: 500px;
            margin: 0 auto;
            padding: 30px 0;
            border: 1px solid lightgrey;
        }

        .content {
            margin: auto;
            width: 70%;
        }

        .pet-form form {
            color: #9ba5a8;
            margin-bottom: 15px;
            background: #fff;
            padding: 30px;
        }

        .pet-form h2 {
            color: #333;
            font-weight: bold;
            margin-top: 0;
        }

        .pet-form hr {
            margin: 0 -30px 20px;
        }

        .pet-form .form-group {
            margin-bottom: 10px;
        }

        .pet-form label {
            font-weight: normal;
            font-size: 13px;
        }

       .pet-form .insert-btn {
        	width: 100%;
            font-size: 16px;
            font-weight: bold;
            background: #FDCDCD;
            border: none;
            height:40px;
            line-height:2;
        }

        .pet-form .insert-btn:hover {
            border-color: none;
            box-shadow: 1px 1px 0 rgb(0, 0, 0, 0.3);
            position: relative;
        }

        .pet-form a {
            color: #fff;
            text-decoration: underline;
        }

        input::placeholder {
            font-size: 80%;
        }


        .petAge,
        .petKg {
            width: 100%;
        }

        .petKg-form,
        .petAge-form {
            padding-left: 0;
        }

        .petKg-input,
        .petAge-input {
            width: 60%;
            margin-right: 0;
            display: inline-block;
        }

        .petAgeKg {
            width: 100%;
            margin: auto;
        }
        
        input[type='radio'],
		input[type='radio']:checked {
		  appearance: none;
		  width: 0.9rem;
		  height: 0.9rem;
		  border-radius: 100%;
		  margin-right: 0.1rem;
		}
		
		input[type='radio'] {
		  background-color: $white-color;
		  border: 2px solid #FDCDCD;
		}
		input[type='radio']:checked {
		  background-color: #FDCDCD;
		}
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="container">
        <jsp:include page="myPageTopBar.jsp"></jsp:include>

        <div class="pet-form">
            <div class="content">
                <form action="${ani.aniNo }" method="POST">
                    <h5>반려동물 수정</h5>
                    <hr>
                    <div class="form-group">
                        <label for="aniName">반려동물 이름</label>
                        <input type="text" class="form-control input" id="aniName" name="aniName" value="${ani.aniName}">
                    </div>
                    <div class="form-group">
                        <label>반려동물 성별</label><br>
                        <c:if test="${ani.aniGender eq 'M' }">
	                        <input type="radio" name="aniGender" id="M" value="M" checked> 
	                        <label for="M" style="font-size:smaller">남</label>
	                        
	                        <div style="display:inline-block; width:30px;"></div>
	                        <input type="radio" name="aniGender" id="F" value="F"> 
	                        <label for="F" style="font-size:smaller">여</label>
                        </c:if>
                        <c:if test="${ani.aniGender eq 'F' }">
	                        <input type="radio" name="aniGender" id="M" value="M"> 
	                        <label for="M" style="font-size:smaller">남</label>
	                        
	                        <div style="display:inline-block; width:30px;"></div>
	                        <input type="radio" name="aniGender" id="F" value="F" checked> 
	                        <label for="F" style="font-size:smaller">여</label>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label for="aniType">반려동물 종류</label>
                        <input type="text" class="form-control input" id="aniType" name="aniType" value="${ani.aniType }"
                            required />
                    </div>
                    <div class="form-group row petAgeKg">
                        <div class="petAge-form col-md-6">
                            <label for="aniAge">반려동물 나이</label>
                            <div class="petAge-input">
                                <input type="number" class="form-control petAge" id="aniAge" name="aniAge"
                                    value="${ani.aniAge }" required />
                            </div>
                            <span>살</span>
                        </div>
                        <div class="petKg-form col-md-6">
                            <label for="aniKg">반려동물 몸무게</label>
                            <div class="petKg-input">
                                <input type="number" class="form-control petKg" id="aniKg" name="aniKg" value="${ani.aniKg }"
                                    required />
                            </div>
                            <span>kg</span>
                        </div>
                    </div>
					
					<div style="padding:10px;"></div>
					
                    <div class="form-group">
                        <button type="submit" class="btn insert-btn">
                            수정하기
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
</body>

</html>