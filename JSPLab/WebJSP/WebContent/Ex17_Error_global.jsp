<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	404 : file not found
	500 : 서버 쪽 코드 에러 (0으로 나눈다, null에 잘못된 처리)
	
	500에러가 발생하면 전역설정에 영향을 주겠다.
 -->
<%
	String data = request.getParameter("name").toLowerCase();
%>
전달받은 내용: <%=data %>
</body>
</html>