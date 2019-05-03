<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- El, JSTL도 예외처리를 가지고 있다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:out value="<p>태그는 문단 태그 입니다.</p>"/>
	<br>
	일반 html에서는 특수문자 :&lt; p &gt; 문단태그
	
	<hr>
	
	<h3>예외처리</h3>
	<!-- catch구문에서 예외가 발생하면 발생객체 주소를 msg변수에 할당.  -->
	<c:catch var="msg">
		name: <%= request.getParameter("name") %>
		<%
			if(request.getParameter("name").equals("hong")){
				out.print("당신의 이름은: " + request.getParameter("name"));
				
			}
		%>
	</c:catch>
	
	<c:if test="${msg != null }">
		<h3>예외 발생</h3>
		오류메세지 ${msg }
	</c:if>
	
</body>
</html>