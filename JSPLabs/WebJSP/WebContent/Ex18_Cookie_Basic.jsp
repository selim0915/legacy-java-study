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
	클라이언트(로컬 PC 웹 브라우저) : 서버(웹 서버:메모리, 파일, DB서버(톰켓))
	
	정보(데이터:자료) 어디에 저장하고 보관할 것이냐
	고민: 소멸(일시적:메모리, 영속적:파일,DB서버), 보안요소(정보유출 의중)
	
	Client(Local PC : 웹 브라우저)
	1. Cookie (메모리쿠키, 파일쿠키(txt)) 구분점: 소멸타임
	2. Local Storage (브라우저의 메모리 저장소) : (key:value)
	>>영속적으로 저장될 필요없고, 보안적으로 문제가 없는 데이터들에 사용한다.
	
	Server(WebServwr : Tomcat)
	1. Server memory : session 객체 (접속한 사용자 별로 한개씩 만들어서 준다) < 임시적 (사용자마다 부여하는 고유한 식별값)
	2. Server memory : application 객체(접속한 모든 사용자가 공유객체) => 서버의 메모리사용
	3. Server : log.txt 파일기반(영속)
	4. DB Server -> 영속적, 보안성 포함ㅑ
 -->
</body>
</html>