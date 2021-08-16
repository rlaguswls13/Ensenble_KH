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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/html_checking_div.css">
    <%-- <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board/normalBoard.css"> --%>
    
    <jsp:include page="../common/header.jsp"/>

	<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
<style>
 
.insert_container{

	margin-left: 20%;
	margin-right: 20%;
}


.note-editor{
	width: 90%;
}

#boardTitle{
	width: 69%
}


</style>
 
</head>
<body>

	
    <div class="insert_container">
	    <h3 class="my-3">${boardType.boardName} 게시글 작성</h3>
	    
	    <hr>    
	
	    <form action="insert" method="POST" role="form" onsubmit="return boardValidate();">
	        <div class="form-inline mb-2">
	        
		 		<select class="form-control mr-2" id="boardCTNo" name="boardCTNo" >
							<c:forEach items="${typeList}" var="typeList">
								<option class="dropdown-item" value="${typeList.boardCTNo}">
									${typeList.boardCTNm}
								</option>
							</c:forEach>					
			    </select>	
	        
	        
				<input type="text" class="form-control mr-2" id="boardTitle" name="boardTitle"	placeholder="제목을 입력해주세요.">
				<button class="btn btn-secondary mr-2" type="submit">글등록</button>		
			</div>
			

				
				
 
	      
	        <textarea class="summernote" id="summernote" name="boardContent"></textarea>
	   		 <div class="col-sm-11 my-3">
	   		 	<a class="btn btn-secondary mr-2 float-right" href="list?type=${param.type}&cp=${param.cp}${searchStr}">목록으로</a>			
				<button class="btn btn-secondary mr-2 float-right" type="reset"  onclick="return resetSummerNote();">내용삭제</button>
				
	         </div>
	    </form>
    </div>
    
 
	<jsp:include page="../common/footer.jsp"/>

    <script>
    
    
			(function printToday() {
				// 오늘 날짜 출력 
				var today = new Date();
				var month = (today.getMonth() + 1);
				var date = today.getDate();
		
				var str = today.getFullYear() + "-"
						+ (month < 10 ? "0" + month : month) + "-"
						+ (date < 10 ? "0" + date : date);
				$("#today").html(str);
			})();
		
			// 유효성 검사 
			function boardValidate() {
				if ($("#boardTitle").val().trim().length == 0) {
					alert("제목을 입력해 주세요.");
					$("#title").focus();
					return false;
				}
		
				if ($("#summernote").val().trim().length == 0) {
					alert("내용을 입력해 주세요.");
					$('#summernote').summernote('focus');
					return false;
				}
			}    
			
		// summernote 초기화
		function resetSummerNote(){
			$('#summernote').summernote('code', '');
		}
    
    
    	// summernote 스타일 및 기능변경
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
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            
            callbacks: {
            	onImageUpload : function(files, editor){
            		sendBoardFile(files[0], this);
            		},
            	onImageLinkInsert: function(url, editor) {
            		sendBoardFileUrl(url, this);
            	    }
                   
            }
        });
        
        // 이미지 파일 업로드
        function sendBoardFile(file, el) {
        	data = new FormData()
        	data.append("file", file);
           	$.ajax({
           		url: 'insertImage',
           		type: "POST",
           		data: data,
           		enctype: 'multipart/form-data',
             	cache: false,
             	contentType: false,
             	processData: false,
             	             	
             	success: function(fileName) {

             		var image = "${contextPath}/" + fileName;
             		$(el).summernote('editor.insertImage', image, function($image) {
             			$image.css('width', '30%');
             			$image.css('height', 'auto');
             		});             		
             	}
           	});
         }
        
     	// url 파일 업로드
        function sendBoardFileUrl(url, el) {
        	data = new FormData()
        	data.append("url", url);
        	console.log(url);
           	$.ajax({
           		url: 'insertImageUrl',
           		type: "POST",
           		data: data,
             	cache: false,
             	contentType: false,
             	processData: false,
             	             	
             	success: function(fileName) {

             		var image = "${contextPath}/" + fileName;
             		$(el).summernote('editor.insertImage', image, function($image) {
             			$image.css('width', '30%');
             			$image.css('height', 'auto');
             		});             		
             	}
           	});
         }
         
         
         // hashTag
         function resetHashTag(){}
         function oneResetHashTag(){}
         function allResetHashTag(){}
    </script>



</body>


</html>