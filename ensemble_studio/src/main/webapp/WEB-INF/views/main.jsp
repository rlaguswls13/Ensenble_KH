<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ensemble Studio</title>

   
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/carousel/">
</head>
<jsp:include page="common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${contextPath}/resources/css/common/main.css?ver=123" type="text/css">

<body>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" style="">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active"> 
              <div class="carousel-img" style=" background-image: url('https://storage.googleapis.com/cr-resource/image/f242c0659290ab6d7b2229d63d416349/fromellapet/613e3ab169b7bb0824484eb05c3f8bdc.jpg'); "></div>
        </div>
          <div class="carousel-item">
            <div class="carousel-img" style=" background-image: url('https://cdn.imweb.me/upload/S20190926a0754ded73eb5/70f20eb08c7f9.jpg'); "></div>
          </div>
          <div class="carousel-item">
            <div class="carousel-img" style=" background-image: url('https://storage.googleapis.com/cr-resource/image/f242c0659290ab6d7b2229d63d416349/fromellapet/915eba63f0746bb78f0ce3775025bc86.jpg'); "></div>
          </div>
          <div class="carousel-item">
            <div class="carousel-img" style=" background-image: url('https://lh3.googleusercontent.com/a5dglzlgrU6gWPd0z6azm_q7uANlGaZM624qpzspm0UDCQuZyDJRt3p_2US5d8xsc3cv8R2tNw7W2JNLpcWmYUlYGVca7Z-EwxvrHxw=s0'); "></div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      <div style="padding:20px;"></div>
      <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Studio View</h5>
      <div style="padding:10px;"></div>
      <div class="row" style="  display: flex; justify-content: center;">
          <div class="col-12 col-lg-4 " > 
                <div class="studio-view-cards">
                    <div class="card-img" style="background-image: url('https://lh3.googleusercontent.com/3-eYJzRV_WYLfrfLj4kO6H1w171rrKegk4Jv-b3IsC5DnVBYtvX22Y4LH32qhnuzj1R-uyepMxbveJpQ11w92vU8ctf8ltPhHeiXQqmzxQ=s0');"></div>
                    <div class="container card-text1">A ROOM</div>
                    <a href="#" class="btn btn-ensemble">예약하기</a>
                    <div style="padding:15px;"></div>
                    <div class="container card-text2">
                        자연광이 변하는 위치를 치밀하게 <br>
                        계산하여 제작된 라이프 스타일의 세트장입니다. <br>
                        반려동물 프로필 촬영 및 동반 촬영이 가능하며 <br>
                        따뜻한 분위기를 제공합니다.
                    </div>
                </div>
          </div>
          <div class="col-12 col-lg-4 " > 
                <div class="studio-view-cards">
                    <div class="card-img" style="background-image: url('https://lh3.googleusercontent.com/3-eYJzRV_WYLfrfLj4kO6H1w171rrKegk4Jv-b3IsC5DnVBYtvX22Y4LH32qhnuzj1R-uyepMxbveJpQ11w92vU8ctf8ltPhHeiXQqmzxQ=s0');"></div>
                    <div class="container card-text1">A ROOM</div>
                    <a href="#" class="btn btn-ensemble">예약하기</a>
                    <div style="padding:15px;"></div>
                    <div class="container card-text2">
                        자연광이 변하는 위치를 치밀하게  <br>
                        계산하여 제작된 라이프 스타일의 세트장입니다. <br>
                        반려동물 프로필 촬영 및 동반 촬영이 가능하며 <br>
                        따뜻한 분위기를 제공합니다.
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4 " > 
                <div class="studio-view-cards">
                    <div class="card-img" style="background-image: url('https://lh3.googleusercontent.com/3-eYJzRV_WYLfrfLj4kO6H1w171rrKegk4Jv-b3IsC5DnVBYtvX22Y4LH32qhnuzj1R-uyepMxbveJpQ11w92vU8ctf8ltPhHeiXQqmzxQ=s0');"></div>
                    <div class="container card-text1">A ROOM</div>
                    <a href="#" class="btn btn-ensemble">예약하기</a>
                    <div style="padding:15px;"></div>
                    <div class="container card-text2">
                        자연광이 변하는 위치를 치밀하게  <br>
                        계산하여 제작된 라이프 스타일의 세트장입니다. <br>
                        반려동물 프로필 촬영 및 동반 촬영이 가능하며 <br>
                        따뜻한 분위기를 제공합니다.
                    </div>
                </div>
            </div>



      </div>
      <div style="padding:20px"></div>
      <hr>
      <div style="padding:20px"></div>
      <h5 style="text-align: center; font-family: 'Noto Serif KR', serif; font-weight: 600;">Notice</h5>
      <div style="padding:10px"></div>
      <div class="container">
        <div class="notice-img" style="background-image:url('')"></div>
        <div style="padding-bottom: 20px;">
            <h6 style="display: inline-block;">[공지] 이벤트를 합니다...</h6>
            <span style="float: right; color:#888">조회수 123</span>
        </div>

        <div class="notice-img" style="background-image:url('')"></div>
        <div style="padding-bottom: 20px;">
            <h6 style="display: inline-block;">[공지] 이벤트를 합니다...</h6>
            <span style="float: right; color:#888">조회수 123</span>
        </div>

        <div class="notice-img" style="background-image:url('')"></div>
        <div style="padding-bottom: 20px;">
            <h6 style="display: inline-block;">[공지] 이벤트를 합니다...</h6>
            <span style="float: right; color:#888">조회수 123</span>
        </div>


      </div>

      <div style="padding:30px;"></div>

      
      <jsp:include page="common/footer.jsp"></jsp:include>
</body>

</html>


