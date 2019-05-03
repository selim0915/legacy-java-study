<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat connection pool</title>
</head>
<body>
<%
	Connection conn =null;
	Statement stmt = null;
	ResultSet rs = null;
	
	Context context = new InitialContext(); //이름기반 검색을 할 준비
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //이런이름을 가진 데이터를 찾는다.
	
	conn = ds.getConnection(); //풀 안에있는 커넥션객체 중에 하나를 가지고 오는거
	
	out.print("db 연결여부: "+ conn.isClosed() + "<br>"); //false
	
	//**자원반환
	conn.close(); //객체 다시 pool반환
	out.print("db 연결여부: "+ conn.isClosed() + "<br>");
	
%>
</body>
</html>