<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//스크립트릿 (java코드 작성하는 곳)
	Date day =new Date();
	/*
	JSP페이지 (ui > html, css,script + code(server) > java)
	JSP페이지 (tomcat(WAS) + => JSP(java) => compile(class)) => 결과(java토드 해석(동적)+정적) => client 전달
	
	JSP 구성요소
	1. 선언부 (JSP 페이지에 대한 기본 설정 세팅) <%@ 
	ex) page(지시자) >> 사용언어, 인코딩, import 자원
	
	
	
	2. 스크립트 요소
	2.1 스트립트릿 : <% .. 자바코드 영역
	2.2 표현식 : 값을 출력 , 출력대상 > client web browser : <%=
	2.3 함수선언부 (page에 공통적으로 사용하는 함수) <%!
	
	
	*/	
%>
<%!
	/* 공통함수영역, 변수선언 */
	public int add(int a, int b){
		return a+b;
}
%>
<!DOCTYPE html> <!-- !DOCTYPE: html5 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	오늘 날짜 : <b><%= day %></b> <!-- 출력의 대상은 브라우저, -->
	<%
		int result = add(100,200);
	%>
	<hr>
	당신이 호출한 함수의 결과는 <%=result %>
	
	<% out.println(result); %>
</body>
</html>