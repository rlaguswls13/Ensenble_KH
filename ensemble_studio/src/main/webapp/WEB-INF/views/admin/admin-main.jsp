<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지 메인</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<jsp:include page="admin-header.jsp"></jsp:include>
<style>
   .btn-ensemble{
        background-color: #FDCDCD;
        padding-left: 25px; padding-right: 25px;
        float: right;
        padding-top : 5px; padding-bottom: 5px;
   }
   select {
		width:60px;
		padding: .2em .8em;
		font-family: inherit;
		border-radius: 5px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		font-size : smaller;
	}
	
	.selectY {
		border: 1px solid #7DBC8C;
		background: url('${contextPath}/resources/images/admin/select-green.png')
			no-repeat 85% 50%;
		color: #7DBC8C;
	}
	
	.selectN {
		border: 1px solid #C64242;
		background: url('${contextPath}/resources/images/admin/select-red.png')
			no-repeat 85% 50%;
		color: #C64242;
	}
</style>
<body>
	
    <div class="main_bg">
        <div class="main_content">
		<h2 style="display: inline-block;">예약관리</h2>
		<a href="admin/reservation" class="btn btn-ensemble" style="color: black;">더보기</a>
           <div style="padding: 5px;"></div>

            <table class="table">
                <thead>
                  <tr style="text-align: center;">
                    <th scope="col">예약번호</th>
                    <th scope="col">예약자명</th>
                    <th scope="col">예약일자</th>
                    <th scope="col">예약상품</th>
                    <th scope="col">옵션</th>
                    <th scope="col">비고</th>
                    <th scope="col">상태</th>
                  </tr>
                </thead>

				<c:forEach items="${mainRvList}" var="reservation">
                <tbody>
                  <tr style="text-align: center;">
                    <th scope="row"><a href="${reservation.rvNo}?cp=${pagination.currentPage}">${reservation.rvNo}</a></th>
                    <td>${reservation.memberNick }</td>
                    <td>${fn:substring(reservation.rvDate, 5,7)}월 ${fn:substring(reservation.rvDate, 8,10)}일<br>
                            <span style="color: #ccc;">${reservation.rvTime}</span>
                    </td>
                    <td>${reservation.roomName }</td>
                    <td>
                    	<c:if test="${empty reservation.optionList }">없음</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 1 }">${reservation.optionList[0].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) == 2 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName}</c:if>
                    	<c:if test="${fn:length(reservation.optionList) >= 3 }">${reservation.optionList[0].optionName},<br> ${reservation.optionList[1].optionName} ...</c:if>
                    </td>
                    <td>
                    	<c:if test="${fn:length(reservation.rvEtc) < 10}">${reservation.rvEtc}</c:if> 
                    	<c:if test="${fn:length(reservation.rvEtc) >= 11}">${fn:substring(reservation.rvEtc, 0, 11)}...</c:if> 
                    </td>
                    <td>
                     	<c:if test="${reservation.rvStatus eq 'Y'}">
	                        <select name="selectRvStatus" class="selectY">
		                            <option value="Y" selected>대기</option>
		                            <option value="N">취소</option>
	                        </select>
                        </c:if>
                     	<c:if test="${reservation.rvStatus eq 'N'}">
	                        <select name="selectRvStatus" class="selectN">
		                            <option value="Y" >대기</option>
		                            <option value="N" selected>취소</option>
	                        </select>
                        </c:if>
                    </td>
                  </tr>
                  

                </tbody>
                </c:forEach>
              </table>
              <div style="padding: 10px;"></div>
        
        </div>
        <div class="main_content">
            <h3 style="display: inline-block;">매출 현황</h3>
           <a href="admin/sales" class="btn btn-ensemble" style="color: black;">더보기</a>
           <div style="padding: 10px;"></div>
           <div style="width:20px; display: inline-block;"></div>
           <div style="width: 300px; display: inline-block;">
                <canvas id="chart1"></canvas>
           </div>
           <div style="width:50px; display: inline-block;"></div>
           <div style="width: 500px; display: inline-block;">
                <canvas id="chart2"></canvas>
           </div>


        </div>
    </div>


    <script> 

    $(document).ready(function(){
    	
    	$.ajax({
			url : '${contextPath}/admin/sales/getSalesByDay',
			data : { "roomNo1" : "${salesList[1].roomNo}",
				"roomNo2" : "${salesList[2].roomNo}",
				"roomNo3" : "${salesList[3].roomNo}"
			},
			type : 'POST',
			dataType : 'json',
			success : function(result){

				const data2 = {
			            labels: ['8/18', '8/19', '8/20', '8/21', '8/22', '8/23'],
			            datasets: [
			                {
			                    label : '${salesList[1].roomName}',
			                    data: result.salesByDay1,
			                    borderColor: '#5863FC',
			                    backgroundColor : '#5863FC',
			                    fill: false,
			                    tension: 0.1
			                },
			                {
			                    label : '${salesList[2].roomName}',
			                    data: result.salesByDay2,
			                    borderColor: '#1FBFDC',
			                    backgroundColor : '#1FBFDC',
			                    fill: false,
			                    tension: 0.1
			                },
			                {
			                    label : '${salesList[3].roomName}',
			                    data: result.salesByDay3,
			                    borderColor: '#F52E67',
			                    backgroundColor : '#F52E67',
			                    fill: false,
			                    tension: 0.1
			                },
			            ]
			        };

			        const chart2 = document.getElementById("chart2"); 
			        const myLineChart = new Chart(chart2, {
			            type: 'line',
			            data : data2,
			            options: {
			                responsive: true,
			                plugins : {
			                    legend: {
			                        position : 'bottom'
			                    },
			                    title: {
			                        display: true,
			                        text: 'Product Sales'
			                    }
			                }
			            }
			        });
			    	
			}
		})
    	

		
    });
    
   		const data = { 
            datasets: [{ 
                backgroundColor: ['#5863FC','#1FBFDC','#F52E67'], 
                data: [parseInt('${salesList[1].roomSalesCount}'), parseInt('${salesList[2].roomSalesCount}'), parseInt('${salesList[3].roomSalesCount}')] 
            }], 
            labels: ['${salesList[1].roomName}','${salesList[2].roomName}','${salesList[3].roomName}'] 
        }; 

        const chart1 = document.getElementById("chart1"); 
        const myDoughnutChart = new Chart(chart1, {
             type: 'doughnut', 
             data: data, 
             options: {
                responsive : true,
                plugins: {
                    legend : {
                        position: 'bottom',
                    },
                    title: {
                        display: true,
                        text: 'Product Category'
                    }
                }

             } 
        }); 

    	$("select[name=selectRvStatus]").change(function(){
    		var select = $(this);
    		//console.log($(this).parent().prev().prev().prev().prev().text());
    		$.ajax({
    			url : '${contextPath}/admin/reservation/updateRvStatus',
    			data : { 
    					 "rvNo" : $(this).parent().prev().prev().prev().prev().prev().prev().text(),
    				     "rvStatus" : $(this).val()
    				    },
    			type : 'POST',
    			success : function(result){
    				if(result>0){
    					if(select.val()=='N'){
    						select.removeClass().addClass('selectN');
    					}else{
    						select.removeClass().addClass('selectY');
    					}
    				}
    			}
    		})
    		
    	})
    	
    </script>
</body>
</html>