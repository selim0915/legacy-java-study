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
	TODAY POINT
	
	오늘 배우는거 : 서버자원
	서버자원(WAS가 제공하는 메모리=웹서버의 메모리쓴다)
	--웹 애플리케이션 서버(Web Application Server)
	
	Application
	- [전역객체]의 변수
	- 접속하는 모든 사용자에게 공유
	
	session
	- 접속하는 브라우저마다 생성되는 객체 => 접속한 사용자마다 고유하게 생성되는 변수
	- [개인변수] : 접속한 브라우저에 한해 고유되는 고유 값 
	
	사이트 접속 : 전체 접속자 수 application >> count +1
	1.application.setAttribute("count",0)
	사이트에 접속하는 모든 사용자는 count변수에 접근이 가능하다.
	
	2. session.setAttribute("userid", "hong");
	접속한 사용자 (브라우저) 마다 고유하게 부여되는 변수
	A라는 사용자 웹서버에 접속> 서버는 session객체 생성> 식별값(AAA)을매칭 > 접속브라우저와 확인 (같구나)
	session.setAttribute("userid", "kglim");
	
	B라는 사용자 웹서버에 접속> 서버는 session객체 생성> 식별값(BBB)을매칭 > 접속브라우저와 확인 (같구나)
	session.setAttribute("userid", "hong");
	
	Application 변수는 사용자 마다 같은값,
	session은 사용자마다 각자 다른 값 을 가진다.
	
	session(사용자 아이디 주로 담는다.)
 -->
 
 <h3>세션정보</h3>
 웹서버가 부여한 고유한 ID값 : <%=session.getId() %>
 <hr>
 <%
 	String userid = request.getParameter("userid");
 	session.setAttribute("id", userid);
 	//session변수의 범위: 모든 페이지가 공유할 수 있다. (나중에 정리 다시 함)
 %>
 
 <h3>세션 변수값 사용하기</h3>
 <%
 	String id = (String)session.getAttribute("id"); //객체, 숫자, 문자 다 다음 (다운캐스팅해햐한다)
 	out.print("당신의 ID는 <b>" + id + "</b>");
 %>
 
 
 
</body>
</html>