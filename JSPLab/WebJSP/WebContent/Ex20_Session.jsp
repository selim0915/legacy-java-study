<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	session 웹 브라우저마다(접속한 사용자)마다 부여되는 고유한 객체
	
	session 값: 웹 서버가 접속한 클라이언트에 부여하는 고유한 식별값
	A라는 사용자가 웹서버에 접속합니다(session객체를 생성합니다) > id값을 생성 > 서버도 하나가지고, 클라이언트도 하나가짐
	> 클라이언트와 서버는 동기화된다(고유한 식별값으로)
	
	서버에서 생성한 세션아이디값: 04D9BAC35A59F14580958C069D578E1B (지금파일 실행)
	client가 가지고 있는 session값 확인: 04D9BAC35A59F14580958C069D578E1B (개발자모드 확인)
	
	session 객체에서 볼수 있는거
	: 처음 접속한 시간
	: 마지막 접속한 시간
 -->
 <%
 	Date time = new Date();
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 	
 %>
 
 <h3>세션 정보</h3>
 세션아이디: <%= session.getId() %> <br>
 
 <%
 	time.setTime(session.getCreationTime()); //세션 생성시간 알려주는 애
 %>
 세션이 생성된 시간: <%= sdf.format(time) %> <br>
 
 <%
 	time.setTime(session.getLastAccessedTime());
 %>
 세션 마지막 접속 시간: <%= sdf.format(time) %> <br>
 
 
</body>
</html>