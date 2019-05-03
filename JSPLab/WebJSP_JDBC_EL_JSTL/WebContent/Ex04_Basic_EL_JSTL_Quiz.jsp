<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String id = request.getParameter("id");
	if(id.equals("hong")){
%>
	<%=id %><img src="img/logo.png" alt="웃는얼굴" style="width:100px; height:100px;">
<%
	}
%>
<!--  
param   	요청 파라미터의  값을 String으로, request.getParameter()의 결과와 동일
paramValue	요청 파라미터의  값을 String[]으로, request.getParameterValues()의 결과와 동일
-->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL과 JSTL</h3>
	 <!-- test = 조건식을 적는데, el로 잘 표시한다. if(조건: i>100) -->
	<c:if test="${param.id == 'hong'}">
		${param.id}
		<img src="img/logo.png" alt="웃는얼굴" style="width:100px; height:100px;">
	</c:if>
	
	<!-- 문제: age는 100값을 받아서 age가 20보다 크면 값을 출력하는 것을 el, jstl 사용 -->
	<c:if test="${param.age >= 20 }" var="result">
		나이: ${param.age }
	</c:if>
	
	<br>
	if구문의 조건 결과값 저장 ${result }
	<!-- 조건이 참이면 true, 거짓이면 false를 나타내는 변수는 var를 사용 -->
	
</body>
</html>