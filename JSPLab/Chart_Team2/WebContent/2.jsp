<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head> 
  <!--css  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  
  <!--css end  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	
    var chart = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e";
    
      $(function(){
    	  
    	  $( "#datepicker" ).datepicker(
                  {
                      dateFormat : "yy-mm-dd",
                      maxDate: -1,
                      gotoCurrent: true
                  });
  	  
  	  $('#btn').click(function(){
  		  if($('#datepicker').val() == null || $('#datepicker').val() === ""){
  			  alert('날짜를 입력해주세요.')
  			  return;
  		  }
  		  
      	  var movieNm = [];
      	  var moviecount = [];
          var moviesalesAmt = [];

            
            var targetDt1 = $('#datepicker').val().replace(/-/gi,"");
            $.ajax(
				    { url : chart,
				      data : {targetDt : targetDt1},
				      type : "get",
				      dataType : "json",
				      success : function(data){
				          var moviename = data.boxOfficeResult.dailyBoxOfficeList
				          
				          $.each(moviename, function(index, obj) {
				                movieNm.push(obj.movieNm);
				                moviesalesAmt.push(obj.salesAmt);
				                moviecount.push(obj.audiCnt);
				          });
				          google.charts.load('current', {'packages':['corechart', 'bar']});
				           google.charts.setOnLoadCallback(drawChart1);
				           
				           google.charts.load("current", {packages:["corechart"]});
    			    	   google.charts.setOnLoadCallback(drawChart);
    			    	   
				          function drawChart1() {
				                var data = google.visualization.arrayToDataTable([
				                  ['영화제목',  '당일매출액 단위\n[0.0001*원]'],
				                  [movieNm[2],  moviesalesAmt[2]/1000],
				                  [movieNm[4],  moviesalesAmt[4]/1000],
				                  [movieNm[0],  moviesalesAmt[0]/1000],
				                  [movieNm[3],  moviesalesAmt[3]/1000],
				                  [movieNm[1],  moviesalesAmt[1]/1000]
				                ]);
				          
				                  var options = {
				                          chart: {
				                            title: '일간 박스오피스 top5',
				                            subtitle: '당일 매출액  ',
				                          },
				                          vAxis: {format: 'short'},
				                         series: {
				                            0: { axis: '당일매출액 단위[원]' } // Bind series 1 to an axis named 'brightness'.
				                          },
				                          axes: {
				                            y: {
				                             distance: {label: '매출액'}, // Left y-axis.
				                            }
				                          }
				                        
				                        };
				                  
				               var chart = new google.charts.Bar(document.getElementById('columnchart_material2'));
				               chart.draw(data, google.charts.Bar.convertOptions(options));
				          }
				          
				            function drawChart() {
	    			    		   var data = google.visualization.arrayToDataTable([
	    			    		          ['Task', 'Hours per Day'],
	    			    		          [movieNm[0],     (moviecount[0]*0.01)],
	    			    		          [movieNm[1],      (moviecount[1]*0.01)],
	    			    		          [movieNm[2],  (moviecount[2]*0.01)],
	    			    		          [movieNm[3], (moviecount[3]*0.01)],
	    			    		          [movieNm[4],    (moviecount[4]*0.01)]
	    			    		        ]);
	    			    	        var options = {
	    			    	          title: '박스오피스 TOP5 누적 관람객 수\n[단위0.01%]',
	    			    	          is3D: true,
	    			    	        };

	    			    	        var chart1 = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	    			    	        chart1.draw(data, options);
	    			    	      }
	    			    	   
	    			    	
				              },
						      error : function(xhr){
						          console.log("에러코드 : " + xhr.status);
						      }
				            }
						);  
    	 			 });
       			});
    </script>
    
    <style type="text/css">
    #columnchart_material2 {
    width:600px;
    height: 300px;
    background-color: #E9ECEF;
    margin: 10px
    }
    
    #piechart_3d {
    width:500px;
    height: 300px;
    background-color: #E9ECEF;
    margin: 10px
    }
    #datepicker {
    width : 200px
    }
    rect {
    fill : #E9ECEF;
    }
    path {
    color : black;
    font-family: bold;
    fill :
    
    }
    #chart {
    width : auto;
    border: 1px solid 	#6495ED
    } 
    </style>
  </head>
  <body>
 	


<div class="jumbotron" id = "chart">
<center><table>
 	<tr>
    	<td><div id = "columnchart_material2"></div></td>
    	
     	<td><div id="piechart_3d"></div></td>
    </tr>
    </table></center>
    <hr>
 <center><input type="text" class="form-control" id="datepicker" placeholder="날짜를 선택해주세요."><br><input type="button" class="btn btn-outline-secondary" id = "btn" name ="btn" value = "검색"></center>
  
</div>
  </body>
</html>