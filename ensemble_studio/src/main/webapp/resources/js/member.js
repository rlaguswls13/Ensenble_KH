// 회원 가입 유효성 검사

// 각 유효성 검사 결과를 저장할 객체
const checkObj = {
   "id": false,
   "nickname": false,
   "pwd1": false,
   "pwd2": false,
   "phone2": false,
   "email": false
};

// 아이디가 입력될 때 마다 유효성 검사
// 조건 : 영어, 숫자 6~12글자 

$("#id").on("input", function() {

   // 아이디가 입력되는 경우 hidden타입 태그의 값을 false로 변경
   // $("#idDup").val(false);

   // 정규표현식 객체 생성
   const regExp = /^[a-zA-Z0-9]{6,12}$/;

   // 입력된 아이디(양쪽 공백 제거)를 얻어와 inputId 변수에 저장
   const inputId = $("#id").val().trim();

   // 입력된 아이디가 정규식에 일치하는 경우 == 유효한 값인 경우
   if (regExp.test(inputId)) {
      /*        $("#checkId").text("유효한 아이디 입니다.").css("color","green");
            checkObj.id = true;*/

      // Ajax를 이용하여 비동기적으로 아이디 중복 검사를 진행

      // jQuery를 이용한 Ajax
      $.ajax({
         url: "idDupCheck",  // 요청 주소(필수로 작성!) 상대경로
         data: { "id": inputId },     // 전달하려는 값(파라미터)  
         type: "post",  // 데이터 전달 방식

         success: function(result) {
            // 매개변수 result : 서버에서 비동기로 전달 받은 응답 데이터

            console.log(result);

            if (result > 0) { // 아이디가 중복 되는 경우
               $("#checkId").text("이미 사용중인 아이디 입니다.").css("color", "red");
               checkObj.id = false;

            } else { // 아이디가 중복되지 않는 경우
               $("#checkId").text("사용 가능한 아이디 입니다.").css("color", "black");
               checkObj.id = true;
            }


         }, // 비동기 통신 성공 시 동작

         error: function(e) {
            // 매개변수 e : 예외 발생 시 Exception 객체를 전달 받을 변수

            console.log("ajax 통신 실패");
            console.log(e);

         } // 비동기 통신 실패 시 동작
      });


   } else {
      $("#checkId").text("영어, 숫자 6~12글자로 작성해주세요.").css("color", "red");

      checkObj.id = false;
   }
});


// 닉네임 유효성 검사
// 조건 : 숫자, 영어, 한국어 2~8글자 -> ^[가-힣ㄱ-ㅎa-zA-Z0-9]{2,}\$
$("#nickname").on("input", function() {
   const regExp = /^[가-힣ㄱ-ㅎa-zA-Z0-9_\-*]{2,8}$/;

   const inputNickname = $(this).val().trim();

   // 입력된 닉네임이 정규식에 일치하는 경우 == 유효한 값인 경우
   if (regExp.test(inputNickname)) {

      $("#checkNickname").text("유효한 닉네임입니다.").css("color", "black");

      checkObj.nickname = true;

   } else {
      $("#checkNickname").text("숫자, 영어, 한국어, _-* 2~8글자로 작성해주세요.").css("color", "red");

      checkObj.nickname = false;
   }
});

// 이메일 유효성 검사
// 조건 : 아이디 4글자 이상, 이메일 형식  ->   /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
$("#email").on("input", function() {
   const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

   // 이벤트 핸들러 내부에 작성된 this == 이벤트가 발생한 요소 == $("#name")
   const inputEmail = $(this).val().trim();

   if (regExp.test(inputEmail)) {
      $("#checkEmail").text("유효한 이메일 형식입니다.").css("color", "black");

      checkObj.email = true;

   } else {
      $("#checkEmail").text("이메일 형식이 올바르지 않습니다.").css("color", "red");

      checkObj.email = false;
   }

});



// 비밀번호 유효성 검사
// 조건 : 영어, 숫자, 특수문자(# , -, _) 6~20글자
$("#pwd1").on("input", function() {
   const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
   const inputPwd1 = $(this).val().trim();

   if (regExp.test(inputPwd1)) {
      $("#checkPwd1").text("유효한 비밀번호 형식입니다.").css("color", "black");

      checkObj.pwd1 = true;
   } else {
      $("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.").css("color", "red");

      checkObj.pwd1 = false;
   }
});

// 비밀번호, 비밀번호 확인 일치 여부 판단
$("#pwd1,  #pwd2").on("input", function() {

   const pwd1 = $("#pwd1").val();
   const pwd2 = $("#pwd2").val();

   if (pwd1.trim() == "" && pwd2.trim() == "") { // 둘다 비었을 때
      $("#checkPwd1").html("&nbsp;"); // &nbsp;  == 띄어쓰기
      $("#checkPwd2").html("&nbsp;");

      checkObj.pwd2 = false;

   } else if (pwd1 == pwd2) {
      $("#checkPwd2").text("비밀번호가 일치합니다.").css("color", "black");

      checkObj.pwd2 = true;

   } else {
      $("#checkPwd2").text("비밀번호가 불일치합니다.").css("color", "red");

      checkObj.pwd2 = false;
   }
});


// 전화번호 유효성 검사
$(".phone").on("input", function() {

   // 전화번호 input 태그에 4글자 초과 입력하지 못하게 하는 이벤트
   if ($(this).val().length > 4) {
      $(this).val($(this).val().slice(0, 4));
   }


   const regExp1 = /^[0-9]{3,4}$/; // 숫자 3~4글자
   const regExp2 = /^[0-9]{4}$/; // 숫자 4글자

   const ph2 = $("#phone2").val();
   const ph3 = $("#phone3").val();

   if (regExp1.test(ph2) && regExp2.test(ph3)) {
      $("#checkPhone").text("유효한 전화번호 형식입니다.").css("color", "black");

      checkObj.phone2 = true;

   } else {
      $("#checkPhone").text("전화번호 형식이 유효하지 않습니다.").css("color", "red");

      checkObj.phone2 = false;
   }
});

// 체크박스 다중 선택 스크립트
$(".agree-form").on("click", "#check_all",
   function() {
      $(this).parents(".agree-form").find('input').prop(
         "checked", $(this).is(":checked"));

   });

// 체크박스 개별 선택
$(".agree-form").on("click", ".normal", function() {
   var is_checked = true;

   $(".agree-form .normal").each(function() {
      is_checked = is_checked && $(this).is(":checked");
   });

   $("#check_all").prop("checked", is_checked);
});

/*function TOSvalidate() {
   if ($("#check_all:checked").length == 0) {
      swal({
         "icon": "info",
         "title": "약관 동의에 체크해주세요."
      })
      return false;

   }
}
*/





// 회원 가입 버튼 클릭 시 전체 유효성 검사 여부 확인
function validate() {

   // checkObj에 작성된 속성들이 모두 true인지 확인

   // 객체 내 속성을 순차접근하는 반복문 :  for in구문
   for (const key in checkObj) {

      if (!checkObj[key]) { // false 값을 가진 속성이 있을 경우
         let msg;
         switch (key) {
            case "id":
               msg = "아이디가 유효하지 않습니다.";
               break;
            case "nickname":
               msg = "닉네임이 유효하지 않습니다.";
               break;
            case "pwd1":
               msg = "비밀번호가 유효하지 않습니다.";
               break;
            case "pwd2":
               msg = "비밀번호가 일치하지 않습니다. ";
               break;
            case "phone2":
               msg = "전화번호가 유효하지 않습니다. ";
               break;
            case "email":
               msg = "이메일이 유효하지 않습니다.";
               break;
         }

         // msg에 담긴 내용 출력
         swal(msg).then(function() {

            const selector = "#" + key;

            $(selector).focus();
            // 유효하지 않은 값을 입력한 부분으로 포커스 이동
         });

         return false;  // submit 이벤트 제거(회원가입 실행 X)

      }
      
   }
   
      // 약관 동의 체크 여부 확인
   if ($("#check_all:checked").length == 0) {
      swal({
         "icon": "info",
         "title": "약관 동의에 체크해주세요."
      })
      return false;
 
   }

   // name 속성값이 phone인 요소를 모두 얻어와 배열로 만들기
   const phone = $("[name='phone']");

   // 요소에 저장된 value만 얻어와 합치기
   const memberPhone = $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val();

   // form 태그에 type="hidden"으로 추가
   const inputPhone = $("<input>", { type: "hidden", name: "memberPhone", value: memberPhone });

   // append() :  선택된 요소의 마지막 자식으로 추가
   $("form[name='signUpForm']").append(inputPhone);


}

// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
$(function() {
   $(".inputImage").on("click", function() {
      $("#Image").click();
   });

});


// 체크박스를 클릭하면 모달창이 뜨게
$('#check_1').on('change', function(e) {
   if (e.target.checked) {
      $('#myModal1').modal();
   }
});

$('#check_2').on('change', function(e) {
   if (e.target.checked) {
      $('#myModal2').modal();
   }
});

$('#check_3').on('change', function(e) {
   if (e.target.checked) {
      $('#myModal3').modal();
   }
});

// span태그 선택하면 체크박스도 체크되게
$('#check-mark2').on('click', function(){
   $("#check_2").click();
});

$('#check-mark3').on('click', function(){
   $("#check_3").click();
});



