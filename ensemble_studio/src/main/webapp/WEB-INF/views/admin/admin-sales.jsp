<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지 매출현황</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<jsp:include page="admin-header.jsp"></jsp:include>
<style>
    .sales-div{
        box-sizing: border-box;
        width: 24.4%;
        height: 100px;
        padding: 20px;
        display: inline-block;
    }
</style>
<body>

    <div class="main_bg">
        <div class="main_content">
        
        <c:if test="${!empty salesList[0] }">
        	<div class="sales-div" style="color : black; border-right: 1px solid #888;">
                <div>${salesList[0].roomName }</div>
                <div style="font-size: 30px; font-weight: 300; text-align: right;">${salesList[0].roomSalesCount }건</div>
            </div>
        </c:if>
        
        <c:if test="${!empty salesList[1] }">
        	<div class="sales-div" style="color : #5863FC; border-right: 1px solid #888;">
                <div>${salesList[1].roomName }</div>
                <div style="font-size: 30px; font-weight: 300; text-align: right;">${salesList[1].roomSalesCount }건</div>
            </div>
        </c:if>   
        <c:if test="${!empty salesList[2] }">
        	<div class="sales-div" style="color : #1FBFDC; border-right: 1px solid #888;">
                <div>${salesList[2].roomName }</div>
                <div style="font-size: 30px; font-weight: 300; text-align: right;">${salesList[2].roomSalesCount }건</div>
            </div>
        </c:if>
        <c:if test="${!empty salesList[3] }">
        	<div class="sales-div" style="color : #F52E67;">
                <div>${salesList[3].roomName }</div>
                <div style="font-size: 30px; font-weight: 300; text-align: right;">${salesList[3].roomSalesCount }건</div>
            </div>
        
        </c:if>
            
        </div>
        <div class="main_content">
            <h2 style="display: inline-block;">매출 현황</h2>
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
				//console.log(result);
				//console.log(result.salesByDay1);
				//console.log(result.salesByDay2);
				//console.log(result.salesByDay3);

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

        
    
   
    </script>
    
</body>
</html>