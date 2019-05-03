<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript">
	$(function(){
		var test = 1;
		var temp = new Array();
		$.getJSON("EmplistAsync.do", function (data) {
		 	var deptno = data.emplist;
		 	console.log(deptno);
		 	console.log(deptno[0].hiredate.substring(5,7));
 			$.each(deptno, function(key, val){
 				temp[key] = [val.ename, val.sal];
 			});
				console.log(temp);
				

				Highcharts.chart('container', {
				    chart: {
				        type: 'column'
				    },
				    title: {
				        text: '급여 통계'
				    },
				    subtitle: {
				        text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
				    },
				    xAxis: {
				        type: 'category',
				        labels: {
				            rotation: -45,
				            style: {
				                fontSize: '13px',
				                fontFamily: 'Verdana, sans-serif'
				            }
				        }
				    },
				    yAxis: {
				        min: 0,
				        title: {
				            text: '급여 (달러)'
				        }
				    },
				    legend: {
				        enabled: false
				    },
				    tooltip: {
				        pointFormat: '급여 : <b>{point.y:.1f} 달러</b>'
				    },
				    series: [{
				        name: 'Population',
				        data: temp,
				        dataLabels: {
				            enabled: true,
				            rotation: -90,
				            color: '#FFFFFF',
				            align: 'right',
				            format: '{point.y:.1f}', // one decimal
				            y: 10, // 10 pixels down from the top
				            style: {
				                fontSize: '13px',
				                fontFamily: 'Verdana, sans-serif'
				            }
				        }
				    }]
				});
		 });	
		
	});
</script>
</head>
<body>
	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
	</div>
</body>
</html>