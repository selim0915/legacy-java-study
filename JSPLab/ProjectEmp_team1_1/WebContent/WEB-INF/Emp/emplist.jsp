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
	    	var output;
	    	var top;
			if($('#deptno option:selected').text() == "전체"){
				$.getJSON("EmplistAsync.do", function (data) {
				 	var deptno = data.emplist;
				 	
				 	$('#result > tr').remove();
				 	
		 			$.each(deptno, function(key, val){
		 			output += "<tr>";
	 				output += "<td>"+val.empno+"</td>";
	 				output += "<td>"+val.ename+"</td>";
	 				output += "<td>"+val.job+"</td>";
	 				output += "<td>"+val.mgr+"</td>";
	 				output += "<td>"+val.hiredate+"</td>";
	 				output += "<td>"+val.sal+"</td>";
	 				output += "<td>"+val.comm+"</td>";
	 				output += "<td>"+val.deptno+"</td>";
		 			output += "</tr>";
	 				$('#result').html(output);
		 			});


				 });	
			}else{
				$.getJSON("EmpDeptnoSearch.do?",{deptno:$('#deptno option:selected').text()}, function (data) {
					 	var deptno = data.emplist;
					 	
					 	$('#result > tr').remove();
					 	
			 			$.each(deptno, function(key, val){
			 			output += "<tr>";
		 				output += "<td>"+val.empno+"</td>";
		 				output += "<td>"+val.ename+"</td>";
		 				output += "<td>"+val.job+"</td>";
		 				output += "<td>"+val.mgr+"</td>";
		 				output += "<td>"+val.hiredate+"</td>";
		 				output += "<td>"+val.sal+"</td>";
		 				output += "<td>"+val.comm+"</td>";
		 				output += "<td>"+val.deptno+"</td>";
			 			output += "</tr>";
		 				$('#result').html(output);
			 			});


					 });
			}
		});
		
		$('#trans').click(function(){
			if($('#empno').val() == ""){
				alert("입 력");
				$('#empno').focus();
			}else{
				var output;
			  //비동기 (controller -> service -> view -> 전달)
			 $.getJSON("EmpnoSearch.do?",{empno: $('#empno').val()}, function (data) {
				 $('#result > tr').remove();
				 	output += "<tr>";
	 				output += "<td>"+data.empno+"</td>";
	 				output += "<td>"+data.ename+"</td>";
	 				output += "<td>"+data.job+"</td>";
	 				output += "<td>"+data.mgr+"</td>";
	 				output += "<td>"+data.hiredate+"</td>";
	 				output += "<td>"+data.sal+"</td>";
	 				output += "<td>"+data.comm+"</td>";
	 				output += "<td>"+data.deptno+"</td>";
		 			output += "</tr>";
	 				$('#result').html(output);
			 });
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

	<!-- nav -->
	<jsp:include page="/common/Top.jsp"></jsp:include>



<c:set var="emplist" value="${requestScope.emplist}" />

<br>
사원번호 검색 : <input type="text" name="empno" id="empno" value="7369">
<input type="submit" id="trans" value="전송하기"><br>
<br>

부서번호 선택
<select id="deptno">
	<option>전체</option>
	<option>10</option>
	<option>20</option>
	<option>30</option>
</select>

<div align=center>
<hr color=green width=400><h2> Employees List </h2><hr color=green width=400>
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
	 <tbody id="result">
	 <c:forEach var="emplist" items="${emplist}">
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
  	</c:forEach>
  	</tbody>
</table>
</div>

</body>
</html>