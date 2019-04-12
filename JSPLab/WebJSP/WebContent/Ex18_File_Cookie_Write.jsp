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
		1. 메모리쿠키 (브라우저 쿠키)
		: client 강제로 지우지 않는 한
		: 브라우저를 강제로 닫지 않는 한
		쿠키값을 유지한다.
		
		2. 파일쿠키(소멸시간을 가지고 있다.)
		: client가 강제로 지우지 않는 한
		: 정해진 만료 시간까지
		setMaxage(60) // 60초 뒤에 소멸해라. 
		30*24*60*60 //30일*24시간*60분*60초 //30일동안 유지해라
	 -->
	 
	 <%
	 	Cookie co = new Cookie("bit", "kim");
	 	co.setMaxAge(30*24*60*60); //30일
	 	co.setMaxAge(30); //30초
	 	response.addCookie(co); //쓰는 페이지
	 	
	 	//ㅇ읽는 페이지 따로 만들거 => Ex18_File_Cookie_Read.jsp
	 %>
</body>
</html>