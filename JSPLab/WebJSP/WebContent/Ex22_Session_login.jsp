<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex22_Session_ok.jsp" method="get">
		id: <input type="text" name="uid"><br>
		pw: <input type="password" name="pwd"><br>
		<input type="submit" value="login">
		<input type="reset" value="cancel">
	</form>
	<hr>
	<h3>회원 전용 페이지</h3>
	<a href="Ex22_Session_member.jsp">회원 접속</a>
	
</body>
</html>