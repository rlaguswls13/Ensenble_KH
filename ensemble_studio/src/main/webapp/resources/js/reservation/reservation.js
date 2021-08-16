
		function validate() {
			const roomNo = $("input[name='roomNo']"); //방번호
			const rvDate = $("input[name='rvDate']"); //예약일 

			const rvPeople = $("input[name='rvPeople']"); //예약시간 

			const rvCars = $("input[name='rvCars']"); //방문차량수 
			const rvAnimals = $("input[name='rvAnimals']"); //방려 동물 수 
			const rvPurpose = $("input[name='rvPurpose']"); //촬영 내용
			const rvTime = $("input[name='rvEtc']"); //비고 

			const inputOption = $("<input>", {
				type : "checkbox",
				name : "optionList",
				value : "input[name='optionList']:checked".val()

			});


		}
		 
		 $("[name=roomNo]").on("change", function(){
			 const index = $("[name=roomNo]").index($(this));
			 const price = Number($(this).attr("price"));
			 
			 $("#reservationForm")[0].reset();
			 
			 $("[name=roomNo]").eq(index).prop("checked", true);
			 
			 // reservationForm
			 $("#totalPrice").text(price + "원");
		 })
		 
		 // 옵션 값이 변할 때 마다
		 $("[name=option]").on("change", function(){
			 let totalPrice = 0;
			 
			 $("[name=option]").each(function(){
				if( $(this).prop("checked") == true){
					totalPrice += Number($(this).attr("price"));
				}
				 
			 });
			 
			 totalPrice += Number( $("[name=roomNo]").attr("price") );
			 
			 $("#totalPrice").text(totalPrice + "원");
		 });
		 
		 
		 const checkObj = {
				    "roomNo": false,
				    "rvDate": false,
				    "rvTime": false,
				    "option": false,
				    "rvPeople": false,
				    "rvCars": false,
				    "rvAnimals": false,
				    "rvPurpose": false,
				    "rvEtc": false
				};
		 
		 $("#rvPeople").on("input", function(){
			
			if(rvPeople.trim() == ""){
				
				checkObj.rvPeople = false;
			
			}else{
		
				checkObj.rvPeople = true;
			}
			
			 
		 });
		 $("#rvCars").on("input", function(){
			
			if(rvCars.trim() == ""){
				
				checkObj.rvCars = false;
				
			}else{
				
				checkObj.rvCars = true;
			}
			
			 
		 });
		 $("#rvAnimals").on("input", function(){
			
			if(rvAnimals.trim() == ""){
				
				checkObj.rvAnimals = false;
			
			}else{
				
				checkObj.rvAnimals = true;
				
			}
			
			 
		 });
		 $("#rvPurpose").on("input", function(){
			
			if(rvPurpose.trim() != ""){
				
				checkObj.rvPurpose = false;
				
			}else{
				checkObj.rvPurpose = true;
				
			}
			
			 
		 });
		 
		 $("#rvEtc").on("input", function(){
			
			if(rvEtc.trim() == ""){
		
				checkObj.rvEtc = false;
			
			}else{
				
				checkObj.rvEtc = true;
				
			}
			
			 
 });
		 
 function validate() {
	 
	 for(const key in checkOnj){
			 
	 if (!checkObj[key]) {
			 let msg;
			 switch (key) {
			 case "roomNo" : msg="스튜디오를 선택해주세요";break;
			 case "rvDate" : msg="예약일자를 선택해주세요";break;
			 case "rvTime" : msg="예약시간을 선택해주세요";break;
			 case "option" : msg="옵션을 선택해주세요";break;
			 case "rvPeople" : msg="방문자 수를 입력해주세요";break;
			 case "rvCars" : msg="방문차량 수를 입력해주세요";break;
			 case "rvAnimals" : msg="반려동물 수를 입력해주세요";break;
			 case "rvPurpose" : msg="방문 목적을 입력해주세요";break;
			 case "rvEtc" : msg="비고를 입력해주세요";break;
	
	 
				 
			 }
			 
			 swal(msg).then(function(){
				
				 const selector = "#" + key;
				 
				 $(selector).focus();
				 
			 });
			 return false;
		 }
		}
		
		 const roomNo = $("[name='roomNo']");
		 const rvDate = $("[name='rvDate']");
		 const rvTime = $("[name='rvTime']");
		 const option = $("[name='option']");
		 const rvPeople = $("[name='rvPeople']");
		 const rvCars = $("[name='rvCars']");
		 const rvAnimals = $("[name='rvAnimals']");
		 const rvPurpose = $("[name='rvPurpose']");
		 const rvEtc = $("[name='rvEtc']");
		 }
	