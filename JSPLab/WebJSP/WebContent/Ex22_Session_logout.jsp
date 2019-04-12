<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그아웃 : 만들엇던 세션객체 날려보리기 -->
	<%
		session.invalidate();
		out.println("<script>location.href='Ex22_Session_login.jsp'</script>");
	%>
</body>
</html>