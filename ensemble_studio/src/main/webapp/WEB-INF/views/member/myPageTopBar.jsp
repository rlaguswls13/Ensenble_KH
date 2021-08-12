<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <div class="myPage-navi">
            <ul>
                <li>
                    <h5>마이페이지</h5>
                </li>
                <li><button type="submit" class="myPage-btn" onclick="location.href='myPage'">전체</button></li>
                <li><button type="submit" class="myPage-btn" onclick="location.href='updateMember'">회원정보 수정</button></li>
                

            	<li>
                	<c:if test="${loginMember.memberPath == 'G'}">
                		<button type="submit" class="myPage-btn" onclick="location.href='changePwd'">비밀번호 변경</button>
                	</c:if>
                </li>
                <li>
                	<c:if test="${loginMember.memberPath == 'S'}">
                		<button type="submit" class="myPage-btn" onclick="sweetalert()">비밀번호 변경</button>
                	</c:if>
              	</li>
        

                <li><button type="submit" class="myPage-btn" onclick="">예약 상세 조회</button></li>
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
</script>