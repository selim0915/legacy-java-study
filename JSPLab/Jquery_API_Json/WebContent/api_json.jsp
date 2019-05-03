<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script type="text/javascript">
	$(function() {
		//var temp = "서울";
		var url = "http://openapi.airkorea.or.kr/openapi/services/
		rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?
				ServiceKey=q1V1vHdTdGxc378tDtmpv%2Bnz2TpocQeeeIGlvmRVgVaiM3doem5fsf0T5t8MezA7s9m%2BoPjI49ZnM6au0XLcwg%3D%3D&_returnType=json";

		//?
		//sidoName=%EC%84%9C%EC%9A%B8&
		//searchCondition=DAILY&
		//pageNo=1&
		//numOfRows=10&
		//ServiceKey=q1V1vHdTdGxc378tDtmpv%2Bnz2TpocQeeeIGlvmRVgVaiM3doem5fsf0T5t8MezA7s9m%2BoPjI49ZnM6au0XLcwg%3D%3D&_returnType=json		
				
		jsoncallback=?
		
		$.getJSON(url, {sidoName:"서울",
						searchCondition:"DAILY",
						pageNo:"1",
						numOfRows:"10", function(data) {
							console.log(data);
						}

			//				var list = []
			//				$.each(data.items,function(i,item){
			//					list.push(item);
			//					console.log(list);
			//				});
		});
	});
</script>
</head>
<body>
	<div id="selets">
		<select name="mise">
			<option value="서울">서울</option>
		</select>
	</div>

	<div id="container"
		style="min-width: 300px; height: 400px; margin: 0 auto"></div>
</body>
<script>
	Highcharts
			.chart(
					'container',
					{
						chart : {
							type : 'column'
						},
						title : {
							text : 'Worlds largest cities per 2017'
						},
						subtitle : {
							text : 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
						},
						xAxis : {
							type : 'category',
							labels : {
								rotation : -45,
								style : {
									fontSize : '13px',
									fontFamily : 'Verdana, sans-serif'
								}
							}
						},
						yAxis : {
							min : 0,
							title : {
								text : 'Population (millions)'
							}
						},
						legend : {
							enabled : false
						},
						tooltip : {
							pointFormat : 'Population in 2017: <b>{point.y:.1f} millions</b>'
						},
						series : [ {
							name : 'Population',
							data : [ [ 'Shanghai', 24.2 ], [ 'Beijing', 20.8 ],
									[ 'Karachi', 14.9 ], [ 'Shenzhen', 13.7 ],
									[ 'Guangzhou', 13.1 ],
									[ 'Istanbul', 12.7 ], [ 'Mumbai', 12.4 ],
									[ 'Moscow', 12.2 ], [ 'São Paulo', 12.0 ],
									[ 'Delhi', 11.7 ], [ 'Kinshasa', 11.5 ],
									[ 'Tianjin', 11.2 ], [ 'Lahore', 11.1 ],
									[ 'Jakarta', 10.6 ], [ 'Dongguan', 10.6 ],
									[ 'Lagos', 10.6 ], [ 'Bengaluru', 10.3 ],
									[ 'Seoul', 9.8 ], [ 'Foshan', 9.3 ],
									[ 'Tokyo', 9.3 ] ],
							dataLabels : {
								enabled : true,
								rotation : -90,
								color : '#FFFFFF',
								align : 'right',
								format : '{point.y:.1f}', // one decimal
								y : 10, // 10 pixels down from the top
								style : {
									fontSize : '13px',
									fontFamily : 'Verdana, sans-serif'
								}
							}
						} ]
					});
</script>

</html>