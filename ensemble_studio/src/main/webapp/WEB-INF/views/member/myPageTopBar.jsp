<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <div class="myPage-navi">
            <ul>
                <li>
                    <h5 id="myPageText">마이페이지</h5>
                </li>
                <li><a class="myPage-btn-checked" id="btn1" href="${contextPath}/member/myPage">전체</a></li>
                <li><a class="myPage-btn" id="btn2" href="${contextPath}/member/updateMember">회원정보 수정</a></li>
                

            	
                	<c:if test="${loginMember.memberPath == 'G'}">
                	<li>
                		<a class="myPage-btn" id="btn3" href="${contextPath}/member/changePwd">비밀번호 변경</a>
                	</li>
                	</c:if>
               
                
                	<c:if test="${loginMember.memberPath == 'S'}">
                	<li>
                		<a id="btn3" class="myPage-btn social-btn" href="">비밀번호 변경</a>
                	</li>
                	</c:if>
              	
        

                <li><a class="myPage-btn" id="btn4" href="${contextPath}/reservation/rvList">예약 상세 조회</a></li>
            </ul>
        </div> 
        
        
<script>
function sweetalert(){
	swal({
		  "icon": "warning",
		  "title": "비밀번호 변경 불가",
		  "text": "소셜로그인 회원은 비밀번호를 변경할 수 없습니다."
		});
}

$(document).ready(function(){
	
	if(location.href.toString().includes("updateMember")){
		$("#btn1").removeClass("myPage-btn-checked").addClass("myPage-btn");
		$("#btn2").removeClass("myPage-btn").addClass("myPage-btn-checked");
	}
	if(location.href.toString().includes("changePwd")){
		$("#btn1").removeClass("myPage-btn-checked").addClass("myPage-btn");
		$("#btn3").removeClass("myPage-btn").addClass("myPage-btn-checked");
	}
	if(location.href.toString().includes("rvList")){
		$("#btn1").removeClass("myPage-btn-checked").addClass("myPage-btn");
		$("#btn4").removeClass("myPage-btn").addClass("myPage-btn-checked");
	}
	
	$(".social-btn").on("click", function(){
		sweetalert();
	})
	
});
</script>