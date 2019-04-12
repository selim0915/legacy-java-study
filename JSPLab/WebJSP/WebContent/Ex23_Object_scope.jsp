<%@page import="kr.or.bit.Emp"%>
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
	Tomcat(WAS) 제공하는 기본적인 객체
	1. request(요청: 클라이언트 정보)
	2. response(응답: 특정 페이지 이동, 정보출력(쿠키))
	3. application(전역객체)
	4. session(사용자마다 고유하게 부여되는 객체 .. 안에 변수를 만들어서 사용할수 있다)
	5. out
	6. page
	
	session객체
	1. session 변수 활용
		session.setAttribute(변수명, 값)
		scope : 모든 페이지 사용가능
		ex) a.jsp (session.setAttribute..user) -> b.jsp(session.getAttribute..user)
		 
		Life-cycle : sessionId 와 객체
		
	2. application 객체 활용
		application 변수 : 전역변수
		내 사이트에 접속한 모든 session이 제어할 수 있는 변수
		scope : 모든 사용자(session) + 모든 페이지 (java: static)
		Lift-cycle : web server 죽으면(재부팅)
		
	3. request 객체
		변수를 만들 수 있다. request.setAttribute("변수", "값")
		scope: 요청 페이지 (client > login.jsp) >> 요청당 request객체 생성
		POINT: login.jsp (include, forward)가 된 페이지에서도 reqesut 객체를 포함할 수 있다.		
 -->
 
 <%
 	Emp emp = new Emp();
 	emp.setEmpno(2000);
 	emp.setEname("홍길동");
 	
 	session.setAttribute("empobj", emp);
 	
 	Emp e = (Emp)session.getAttribute("empobj");
 	
 	out.print(e.getEmpno()+"<br>");
 	out.print(e.getEname()+"<br>");
 	
 	request.setAttribute("who", "king");
 	String who = (String)request.getAttribute("who");
 	
 	/* 다른 페이지에서 
 	request.getAttribute("who"); setAttribute한거 get할 수 없지만
 	include, forward하면 할 수 있다.
 	
 	b.jsp
 	request.getAttribute("who");
 	*/
 	out.println("request: " + who);
 	
 %>
 
</body>
</html>




