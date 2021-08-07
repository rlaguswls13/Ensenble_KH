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
  
</head>
<body>

	
    
    <h3>게시글 작성</h3>
    
    <hr>    

    <form action="update" method="POST" role="form" onsubmit="return boardValidate();">
        <div class="row-sm-12 d-flex dropdown">
        	
			<span class="col-sm-10">${board.boardNm}</span>
 			<select class="col-sm-2" id="boardCTNo" name="boardCTNo">
				<c:forEach items="${typeList}" var="typeList">
					<option class="dropdown-item" value="${typeList.boardCTNo}"
						${typeList.boardCTNo == board.boardCTNo ? 'selected' : '' } >
						${typeList.boardCTNm}
					</option>				
				</c:forEach>					
			</select>
        </div>
        
        <div class="form-inline mb-2">
			<label class="input-group-addon mr-3 insert-label">제목</label> 
			<input type="text" class="form-control" id="boardTitle" name="boardTitle"
					placeholder="제목을 입력해주세요." size="100%" value="${board.boardTitle}">
		</div>
		
		<div class="form-inline mb-2">
			<label class="input-group-addon mr-3 insert-label">작성일</label>
			<h5 class="my-0" id="today">${board.boardDT}</h5>
		</div>
		
		<div class="form-inline mb-2">
			<label class="input-group-addon mr-3 insert-label">작성자</label>
			<h5 class="my-0" id="writer">${board.memberNk}</h5>
		</div>
      
        <div class="row-sm-12 d-flex">
            <div class="col-sm-9">
            	<input type="text" class="form-control" id="boardTitle" name="boardHashTag" placeholder="해시태그입력" size="100%">
            </div>
            <div class="col-sm-3">
                <button class="btn-secondary">등록</button>
                <button type="reset" class="btn-secondary">취소</button>
            </div>
            <div></div>
        </div>
        <textarea class="summernote" id="summernote" name="boardContent"></textarea>
    </form>
    
    <a href="list?type=${param.type}&cp=${param.cp}${searchStr}"
            	class="btn btn-primary float-right mr-2">목록으로</a>


	<jsp:include page="../common/footer.jsp"/>

    <script>
		// summernote 내용입력
		$('#summernote').summernote('code', '${board.boardContent}');
    
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
         
         document
    </script>



</body>


</html>