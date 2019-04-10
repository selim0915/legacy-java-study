<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/commonError.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
1. 특정페이지만 지정하는 방법 (상단부에 선언하기)
 -->
<%
	String data = request.getParameter("name").toLowerCase();
%>
전달받은 내용: <%=data %>
</body>
</html>