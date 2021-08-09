<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZu75yZLCoVaSN1DJBnZ2LeMpYccCcWLE&callback=initMap"async defer></script>
</head>
<style>
    #about-map{
        width:100%;
        height:400px;
        background-color: #eee;
    }
    .team-name{
    	padding-top: 20px;
    	padding-bottom:10px; 
    	font-weight: 600;
    }
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <img src="${contextPath}/resources/images/about/about_ensemble.png" style="width:100%">
    <div style="padding:20px;"></div>
    <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">About</h5>
    <div style="padding:10px;"></div>
    <div style="font-family: 'cafe24 oneprettynight'; line-height: 1.4; text-align: center;">
        앙상블 스튜디오는 반려동물을 사랑하는 사람들이 <br>
        모여 만든 공간 대여 스튜디오입니다.<br>
        우리집같은 편안함과 자연광이 드는 따뜻한 공간이며<br>
        반려동물을  내 가족처럼 아끼고 배려하는 스튜디오입니다.
    </div>

    <div style="padding:20px;"></div>
    <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Team</h5>
    <div style="padding:10px;"></div>

    <div class="container">
        <div class="row">
            <div class="col-6 col-lg-3">
                <div style="text-align: center; padding-bottom: 40px;">
                    <img src="${contextPath}/resources/images/about/about_us_1.png" style="width:150px;">
                    <div class="team-name">김현진</div>
                    <div>멍때리냥 팀원</div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div style="text-align: center; padding-bottom: 40px;"">
                    <img src="${contextPath}/resources/images/about/about_us_2.png" style="width:150px;">
                    <div class="team-name">이다혜</div>
                    <div>멍때리냥 팀원</div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div style="text-align: center; padding-bottom: 40px;"">
                    <img src="${contextPath}/resources/images/about/about_us_3.png" style="width:150px;">
                    <div class="team-name">이용국</div>
                    <div>멍때리냥 팀원</div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div style="text-align: center; padding-bottom: 40px;"">
                    <img src="${contextPath}/resources/images/about/about_us_4.png" style="width:150px;">
                    <div class="team-name">최아람</div>
                    <div>멍때리냥 팀장</div>
                </div>
            </div>
        </div>
    
    </div>
    
    <div style="padding:20px;"></div>
    <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Info</h5>
    <div style="padding:10px;"></div>
    <div style="font-weight: 200; text-align: center; line-height: 1.6;">
        <b>문의</b>  02-722-0858 <br>
        <b>영업시간</b>   월~금요일	AM 09:00 - PM 09:30<br>
        <b>주소</b>   서울 중구 남대문로 120 대일빌딩 2층<br>
    </div>
    <div style="padding: 20px;"></div>
    <div id="about-map"></div>
    <div style="padding: 20px;"></div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script>
	    var e = document.getElementById("about-map");
	    var kh= new google.maps.LatLng(37.567924, 126.983083);
	    var opts= {
	        center: kh,
	        zoom: 14
	    };
	    var map=new google.maps.Map( e , opts );
	    var marker= new google.maps.Marker( {
	        position: kh,
	        title:"KH정보교육원"
	    } );
	    marker.setMap(map);
	
	    marker.addListener('click', function(){
	        open('https://www.iei.or.kr', '_blank');
	    });
	
	</script>
</body>

</html>