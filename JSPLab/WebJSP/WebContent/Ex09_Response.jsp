<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response 객체(응답객체)</title>
</head>
<body>
<!-- 
	Client(웹 브라우져) -> server
					request: 요청
					
	Client(웹 브라우져) <- server
					response: 응답
					
	javax (Tomcat) 제공
	: request, response 객체제공
	
	1. 표현식
	2. 페이지의 이동처리 (sendRedirect)
	
	//페이지를 서버에 요청하기
	서버쪽코드: response.sendRedirect()
	javascript: location.href ="Ex01_Basic.jsp"
	
 -->
 
 1. 일반적인 사용(출력): <%=100+200+300 %> <br>
 2. sendRedirect: response객체 함수 (클라이언트 서버에게 페이지를 재요청)<br>
 <%
 	response.sendRedirect("Ex01_Basic.jsp");
 %>
 <!-- 
 response.sendRedirect => 코드가 클라이언트 브라우저에서 해석할 수 형태로 변환된다.
 <script type="text/javascript">
 	location.href="Ex01_Basic.jsp";
 </script>
  -->
</body>
</html>