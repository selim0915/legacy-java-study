<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	EL의 목적
	- 서버자원을 스크립트릿 없이 사용할수 있게 하는 것이 (출력) 목적
	
	//EL이 사용된다고 해서 모든 java코드를 표현하는 스크립트릿을 대신할 수 없다 (스크립트릿 없다)
	*/
	
	//예를 들면
	Date today = new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2", today);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 목적(출력)</h3>
	<%= request.getAttribute("day") %> <br>
	EL : ${day}<br>
	<!-- 좋은 방식은 아니다: day 습관적으로 출처 -->
	
	습관적으로 써야하는 표현식 ${requestScope.day}; <br> 이게 좋음<br>
	request객체 받아서 사용할 땐, requestScope를 이용하자 <br>
	
	session EL : ${sessionScope.day2}
	
</body>
</html>