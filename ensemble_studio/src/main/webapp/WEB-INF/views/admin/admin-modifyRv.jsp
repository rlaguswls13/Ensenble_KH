<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 수정</title>
<jsp:include page="admin-header.jsp"></jsp:include>
</head>
<style>
	.container {
            width: 1000px;
            height: 1600px;
            border: 1px solid gray;
        }

        /* 촬영정보 선택  */
        .reservationOption {
            height: 200px;
        }

        .optionDetail {
            float: left;
            width: 200px;
            height: 210px;
            font-size: 20px;
            font-weight: bold;
        }

        .optionRadio {
            float: left;
            width: 600px;
            height: 210px;
        }

        .optionListA {
            float: left;
            width: 250px;
            height: 200px;
        }

        .optionListB {
            float: left;
            width: 250px;
            height: 200px;
        }

        .rvDetail2 {
            width: 800px;
            font-size: 20px;
            font-weight: bold;
        }

        .reservationOption1 {
            height: 600px;
            width: 1000px;
        }

        .price {
            height: 40px;
            width: 800px;

        }

        #totalPrice {
            width: 150px;
            height: 30px;
            float: right;
            font-size: 30px;
        }

        #priceText {
            margin-top: 10px;
            width: 100px;
            height: 30px;
            float: right;
            font-size: 15px;
        }

        .userInfo {
            height: 200px;
            width: 800px;
        }

        .info {
            height: 30px;
            width: 800px;

        }

        .text {
            float: left;
            font-size: 15px;
            width: 100px;
            font-weight: bold;

        }

        .infodt {
            float: left;
            font-size: 15px;
            width: 200px;
            color: gray;

        }
        #etcText{
            width: 100px;
            float : left;
        }
        #etcBox{
            width: 60px;
            float : left;
        }
</style>
<body>
	
	    <div class="container">


        <!-- 아이디 -->
        <div class="row mb-3 form-row" >
            <div class="col-md-2">
                <h6>아이디</h6>
            </div>
            <div class="col-md-5">
                <h5 id="id"> </h5>
            </div>
        </div>

        <!-- 이름 -->
        <div class="row mb-3 form-row">
            <div class="col-md-2">
                <h6>이름</h6>
            </div>
            <div class="col-md-5">
                <h5 id="name"> </h5>
            </div>
        </div>

        <!-- 예약 일자 -->
        <div class="row mb-3 form-row">
            <div class="col-md-2">
                <label for="memberEmail">예약 일자</label>
            </div>
            <div class="col-md-6">
                <input type="date" class="form-control" id="rvDate" name="rvDate" value="2021.07.22(목)">
            </div>
        </div>
        <!-- 예약 시간 -->
        <div class="row mb-3 form-row">
            <div class="col-md-2">
                <label for="memberEmail">예약 시간</label>
            </div>
            <div class="col-md-6">
                <input type="email" class="form-control" id="rvTime" name="rvTime" value="12:00~15:00">
            </div>
        </div>

        <!-- 예약 상품 -->
        <div class="row mb-3 form-row">
            <div class="col-md-2">
                <label for="memberEmail">예약 상품</label>
            </div>
            <div class="col-md-6">
                <input type="email" class="form-control" id="rvProduct" name="rvProduct" value="A Room">
            </div>
        </div><br>


        <div class="reservationOption1">
            <div class="reservationOption">
                <div class="optionDetail">옵션 내용</div>
                <div class="optionRadio">
                    <div class="optionListA">
                        <input type="radio" id="d" value="d" name="option">
                        <label for="d">캐논 100D (무료) </label><br><br>

                        <input type="radio" id="e" value="e" name="option">
                        <label for="e">캐논 5D Mark II (+20,000원) </label><br><br>

                        <input type="radio" id="f" value="f" name="option">
                        <label for="f">캐논 5D Mark IV (+30,000원)</label><br><br>

                        <input type="radio" id="g" value="g" name="option">
                        <label for="g">70-200mm f 렌즈(+10,000원)</label><br><br>

                        <input type="radio" id="h" value="h" name="option">
                        <label for="h">탑라이트 조명 (무료)</label>
                    </div>
                    <div class="optionListB">
                        <input type="radio" id="i" value="i" name="option">
                        <label for="i">소프트박스 2개(+10,000원)</label><br><br>

                        <input type="radio" id="j" value="j" name="option">
                        <label for="j">컬러필터(+10,000원)</label><br><br>

                        <input type="radio" id="k" value="k" name="option">
                        <label for="k">반사판(+10,000)</label><br><br>

                        <input type="radio" id="l" value="l" name="option">
                        <label for="l">건조간식(+5,000원)</label><br><br>

                        <input type="radio" id="m" value="m" name="option">
                        <label for="m">육포(+3,000)</label>
                    </div>
                </div>

            </div> <br><br><br>
            <div class="rvDetail2">

                이용 인원 수 : <input type="text"><br><br>
                방문 차량 수 : <input type="text"><br><br>
                반려 동물 수 : <input type="text"><br><br>
                촬영 내용 &nbsp;&nbsp;&nbsp; : <input type="text"><br><br>

                <div id="etcText">
                    비고 :<br>
                </div>
                <div id="etcBoxt">
                    <textarea rows="8" cols="50" name="ta" style="resize:none;">  </textarea>
                </div>
          

                </div>
                <hr>
                

           



                    <div class="row4">
                        <button class="btn btn-primary btn-lg button0" type="submit" style="width:200px;">수정하기</button>
                       </div>


                
            </div>
        </div>
</body>
</html>