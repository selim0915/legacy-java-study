<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//1. request 클라이언트가 입력한 값을 얻어올 수 있다.
	//2. input > text, password, radio, textarea, selete ..
	//3. 넘어오는 값이 [단일값, 다중값]일 경우가 있다.
	// input type="text" name="userid" >> ?userid=lim
	
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	//2. 다중값
	//input > check(name동일), select(multiple)
	String[] hobbys = request.getParameterValues("hobby");
	
	Enumeration<String> e = request.getParameterNames(); //getParameterNames(): name 집합나열 
	String name="";
	while(e.hasMoreElements()){
		name += "/"+e.nextElement();
	}
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	출력1 > <%=userid %> <br>
	출력2 > <%=pwd %> <br>
	<%
	for(String str : hobbys){
	%>
	출력 3 > <%=str %> 
	<%
	}
	%> <br>
	[request.getParameterNames();] : <%=name %> <br> <!-- 변수명을 뽑아내는 친구 -->
</body>
</html>