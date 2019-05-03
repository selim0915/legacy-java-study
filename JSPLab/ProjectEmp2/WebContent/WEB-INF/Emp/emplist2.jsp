<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(function() {
		$('#deptno').change(function() {
			if($('#deptno option:selected').text() == "전체"){
				$.ajax(
						 {
							url:"Emplist.do",
							data:{deptno:$('#deptno option:selected').text()},
							dataType:"html",
							success:function(responsedata){
								var temp = $('#deptno option:selected').text();
								$('body').html(responsedata);
								$("#deptno").val(temp).attr("selected", "selected");
							}
						 }	  
					  );	
			}else{
			$.ajax(
					 {
						url:"SelectDeptno.do",
						data:{deptno:$('#deptno option:selected').text()},
						dataType:"html",
						success:function(responsedata){
							var temp = $('#deptno option:selected').text();
							$('body').html(responsedata);
							$("#deptno").val(temp).attr("selected", "selected");
						}
					 }	  
				  );
			}
		});
		
		$('#trans').click(function(){
			if($('#empno').val() == ""){
				alert("ID 입 력");
				$('#empno').focus();
			}else{
				
			  //비동기 (controller -> service -> view -> 전달)
			  $.ajax(
				 {
					url:"EmpnoSearch.do",
					data:{empno:$('#empno').val()},
					dataType:"html",
					success:function(responsedata){
						$('body').html(responsedata);
					}
				 }	  
			  );	
			}
		});
		
		
		
		
	});
    
    </script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
	
		    font-family: arial, sans-serif;
		    border-collapse: collapse; /* 붕괴하다 , 무너지다 */
		    width: 100%;
		}
		
		th {
		    border: 1px solid #dddddd;
		    text-align: center;
		    padding: 8px;
		}
		td{
		    border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}
		tr:nth-child(even) {  /* even 짝수     odd 홀수 */
		    background-color: #dddddd;
		}
	</style>
	
</head>
<body>
<select id="deptno">
	<option>전체</option>
	<option>10</option>
	<option>20</option>
	<option>30</option>
</select>
<br>
사원번호 검색 : <input type="text" name="empno" id="empno" value="7369">
<input type="submit" id="trans" value="전송하기">

<div align=center>
<hr color=green width=400><h2> Line Memo List </h2><hr color=green width=400>
<table> 
	 <tr>
	 	<th>empno</th> 
	 	<th>ename</th>
	 	<th>job</th>
	 	<th>mgr</th>
	 	<th>hiredate</th>
	 	<th>sal</th>
	 	<th>comm</th>
	 	<th>deptno</th>
	 </tr>
	 <c:set var="emplist" value="${requestScope.emplist}" />
	 	<tr>
	 		<td>${emplist.empno}</td>
	 		<td>${emplist.ename}</td>
	 		<td>${emplist.job}</td>
	 		<td>${emplist.mgr}</td>
	 		<td>${emplist.hiredate}</td>
	 		<td>${emplist.sal}</td>
	 		<td>${emplist.comm}</td>
	 		<td>${emplist.deptno}</td>
	 	</tr>
</table>
</div>

</body>
</html>