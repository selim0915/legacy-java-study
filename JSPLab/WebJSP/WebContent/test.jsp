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
	String s1 = "Sachin";
	String s2 = "SACHIN";
	
	System.out.println(s1.equals(s2));
	System.out.println(s1.equalsIgnoreCase(s2));
%>
</body>
</html>