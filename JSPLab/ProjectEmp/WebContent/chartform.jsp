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
<% String url = (String)request.getAttribute("jsonObject"); %>
out.print("url: "+url);
out.print("jsonObject: "+jsonObject);

$.getJSON(url, function (data) {
		Highcharts.chart('container', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '사원 입사월별 통계 그래프'
		    },
		    subtitle: {
		        text: '1980.01~2019.04'
		    },
		    xAxis: {
		        categories: [
		            'Jan',
		            'Feb',
		            'Mar',
		            'Apr',
		            'May',
		            'Jun',
		            'Jul',
		            'Aug',
		            'Sep',
		            'Oct',
		            'Nov',
		            'Dec'
		        ],
		        crosshair: true
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: '사원 (명)'
		        }
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
		        footerFormat: '</table>',
		        shared: true,
		        useHTML: true
		    },
		    plotOptions: {
		        column: {
		            pointPadding: 0.2,
		            borderWidth: 0
		        }
		    },
		    series: [{
		    	data: data
		    	}]
		});
	});
</script>
</head>
<body>
	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
	</div>
</body>
</html>