<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지 상품등록</title>
    <jsp:include page="admin-header.jsp"></jsp:include>
</head>
<style>
    .prod-text{
        display: inline-block;
        width: 100px;
        font-weight: 500;
        vertical-align: top;
        padding-top:8px;
    }
    .prod-input-min{
    	display: inline-block;
        width: 200px;
        padding:5px 10px 5px 10px;
    }
    .prod-textarea{
    	display: inline-block;
        width: 500px;
        max-width: 80%;
        height: 200px;
        padding:5px 10px 5px 10px;
        resize: none;
    }
    .prod-input-med{
    	display: inline-block;
        width: 500px;
        max-width: 80%;
        padding:5px 10px 5px 10px;
    }
    .img-box{
        width: 600px;
        max-width: 80%;
        display: inline-block;
    }
    .main-img1{
        width: 100%;
        height: 200px;
        display: inline-block;
        border: 1px solid #ddd;
        background-repeat: no-repeat; 
        background-size:cover; 
        background-position: center;
    }
    .main-img2{
        width: 49%;
        height: 100px;
        border: 1px solid #ddd;
        display: inline-block;
        background-repeat: no-repeat; 
        background-size:cover; 
        background-position: center;
    }
    .imgs9{
        width: 32%;
        border: 1px solid #ddd;
        display: inline-block;
        background-repeat: no-repeat; 
        background-size:cover; 
        background-position: center;
    }
    .imgs9:after {
        content: "";
        display: block;
        padding-bottom: 100%;
    }
    .btn-ensemble{
    	color: black;
        background-color: #FDCDCD;
        padding-left: 25px; padding-right: 25px;
        float: right;
        padding-top : 10px; padding-bottom: 10px;
        border: 0px;
        margin-left: 10px;
    }
    .btn-grey{
   		color: black;
        background-color: #eee;
        padding-left: 25px; padding-right: 25px;
        float: right;
        padding-top : 10px; padding-bottom: 10px;
        border: 0px;
    }
    #file-area{
        display: none;
    }
</style>
<body>
    <div class="main_bg">
        <div class="main_content">
            <h2>상품 등록</h2>
            <div style="padding: 5px;"></div>

            <form action="insert" method="POST" enctype="multipart/form-data" role="form">

                <div class="prod-text">상품 이름</div>
                <input type="text" class="form-control prod-input-min" name="roomName" id="roomName" required>
                <div style="padding: 10px;"></div>

                <div class="prod-text" >설명</div>
                <textarea class="form-control prod-textarea" name="roomAbout" id="roomAbout" rows="6" required></textarea>
                <div style="padding: 10px;"></div>

                <div class="prod-text" >구성</div>
                <input type="text" class="form-control prod-input-med" name="roomConfig" id="roomConfig" required>
                <div style="padding: 10px;"></div>

                <div class="prod-text">정상가</div>
                <input type="number" class="form-control prod-input-min" name="roomPrice" id="roomPrice" required>
                <div style="padding: 10px;"></div>
                
                <div class="prod-text">할인률</div>
                <input type="number" class="form-control prod-input-min" name="roomDiscount" id="roomDiscount" value="0"  required>
                <div style="padding: 10px;"></div>

                <div class="prod-text" >기본 옵션</div>
                <input type="text" class="form-control prod-input-med" id="roomOpt" name="roomPrimaryOption" required> 
                <div style="padding: 10px;"></div>
                
                <div class="prod-text" >연결 주소</div>
                <span>ensemble/studio/</span>
                <input type="text" class="form-control prod-input-min" name="roomHref" required> 
                <div style="padding: 10px;"></div>

                <div class="prod-text">메인 사진</div>
                <div class="img-box">
                    <div class="img main-img1" style="background-image: url();"></div>
                    <div class="img main-img2" style="background-image: url();"></div>
                    <div class="img main-img2" style="background-image: url(); float: right;"></div>
                </div>
                <div style="padding: 10px;"></div>

                <div class="prod-text">추가사진 <br>(9개)</div>
                <div class="img-box">
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                    <div class="img imgs9" style="background-image: url();"></div>
                </div>
                <div style="padding: 10px;"></div>

				<div id="file-area">
					<input type="file" id="img0" name="images" onchange="LoadImg(this,0)" accept="image/*"> 
					<input type="file" id="img1" name="images" onchange="LoadImg(this,1)" accept="image/*"> 
					<input type="file" id="img2" name="images" onchange="LoadImg(this,2)" accept="image/*"> 
					<input type="file" id="img3" name="images" onchange="LoadImg(this,3)" accept="image/*"> 
					<input type="file" id="img4" name="images" onchange="LoadImg(this,4)" accept="image/*"> 
					<input type="file" id="img5" name="images" onchange="LoadImg(this,5)" accept="image/*"> 
					<input type="file" id="img6" name="images" onchange="LoadImg(this,6)" accept="image/*"> 
					<input type="file" id="img7" name="images" onchange="LoadImg(this,7)" accept="image/*"> 
					<input type="file" id="img8" name="images" onchange="LoadImg(this,8)" accept="image/*"> 
					<input type="file" id="img9" name="images" onchange="LoadImg(this,9)" accept="image/*"> 
					<input type="file" id="img10" name="images" onchange="LoadImg(this,10)" accept="image/*"> 
					<input type="file" id="img11" name="images" onchange="LoadImg(this,11)" accept="image/*"> 
				</div>
				
				<div style="text-align: right; margin-right:3%">
	                <button class="btn btn-ensemble">추가하기</button>
	                <button type="button" class="btn btn-grey" id="cancelBtn">취소하기</button>
            	</div>
            
            </form>

            <div style="padding:20px"></div>
        </div>
    </div>
    <script>

		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$(".img").on("click", function() {
				var index = $(".img").index(this);
				$("#img" + index).click();
			});
        });

		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				// 자바스크립트 FileReader
				// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

				reader.readAsDataURL(value.files[0]);
				// FileReader.readAsDataURL()
				// 지정된의 내용을 읽기 시작합니다. Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.

				// FileReader.onload
				// load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
				reader.onload = function(e) {
					// e.target.result
					// -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)

					$(".img").eq(num).css("background-image", "url("+e.target.result+")");
				}

			}
		}
		
		
		$("#cancelBtn").on('click', function () {
			swal({
				  title: "정말 취소하시겠습니까?",
				  text: "취소하면 내용을 되돌릴 수 없습니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((result) => {
				  if (result) {
					  window.history.back();
				  } else {
				    swal("취소를 철회합니다.");
				  }
				});
		});
		
    </script>
</body>
</html>