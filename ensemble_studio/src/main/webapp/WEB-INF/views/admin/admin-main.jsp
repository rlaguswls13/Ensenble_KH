<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<body>
	
    <div class="main_bg">
        <div class="main_content">
           <h3 style="display: inline-block;">예약관리</h3>
           <a href="admin/reservation" class="btn btn-ensemble" style="color: black;">더보기</a>
           <div style="padding: 5px;"></div>

            <table class="table">
                <thead>
                  <tr>
                    <th scope="col" style="text-align: center;">예약번호</th>
                    <th scope="col" style="text-align: center;">예약자명</th>
                    <th scope="col" style="text-align: center;">예약일자</th>
                    <th scope="col" style="text-align: center;">예약상품</th>
                    <th scope="col" style="text-align: center;">옵션</th>
                    <th scope="col" style="text-align: center;">비고</th>
                    <th scope="col" style="text-align: center;">상태</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                    <th scope="row" style="text-align: center;">1</th>
                    <td  style="text-align: center;">Mark</td>
                    <td  style="text-align: center;">07/22(목)<br>
                            <span style="color: rgb(156, 156, 156);">12:00~15:00</span>
                    </td>
                    <td  style="text-align: center;">A ROOM</td>
                    <td style="text-align: center;">옵션 내용</td>
                    <td style="text-align: center;">비고 내용</td>
                    <td style="text-align: center;">
                        <select name="selectRvStatus">
                            <option value="대기">대기</option>
                            <option value="취소">취소</option>
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" style="text-align: center;">1</th>
                    <td  style="text-align: center;">Mark</td>
                    <td  style="text-align: center;">07/22(목)<br>
                            <span style="color: rgb(156, 156, 156);">12:00~15:00</span>
                    </td>
                    <td  style="text-align: center;">A ROOM</td>
                    <td style="text-align: center;">옵션 내용</td>
                    <td style="text-align: center;">비고 내용</td>
                    <td style="text-align: center;">
                        <select name="selectRvStatus">
                            <option value="대기">대기</option>
                            <option value="취소">취소</option>
                        </select>
                    </td>
                  </tr>

                </tbody>
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
    const data = { 
        datasets: [{ 
            backgroundColor: ['#5863FC','#1FBFDC','#F52E67'], data: [10, 20, 30] 
        }], 
        labels: ['A ROOM','B ROOM','C ROOM'] 
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

    const data2 = {
        labels: ['JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'],
        datasets: [
            {
                label : 'A ROOM',
                data: [10,20,15,40,30,65,67],
                borderColor: '#5863FC',
                backgroundColor : '#5863FC',
                fill: false,
                tension: 0.1
            },
            {
                label : 'B ROOM',
                data: [40, 25, 30, 20, 40, 50, 60],
                borderColor: '#1FBFDC',
                backgroundColor : '#1FBFDC',
                fill: false,
                tension: 0.1
            },
            {
                label : 'C ROOM',
                data: [8, 9, 10, 15, 17, 18, 20],
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
    </script>
    
</body>
</html>