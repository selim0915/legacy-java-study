<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
%>

	<h3>세림: 당신이 입력한 데이터는</h3>
	ID : <%= userid  %> <br>
	PW : <%= userpwd%> <br>
</body>
</html>