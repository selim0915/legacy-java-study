<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<h3>Register</h3>
	
	<form action="<%= request.getContextPath() %>/ok.do" method="post">
		id <input type="text" name="id" placeholder="id입력"> <br>
		pwd <input type="text" name="pwd" placeholder="pwd입력"> <br>
		email <input type="text" name="email" placeholder="email입력"> <br>
		<input type="submit" value="ok"> <br>
	</form>
</body>
</html>