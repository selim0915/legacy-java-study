<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Emp e = new Emp();
	e.setEmpno(2000);
	e.setEname("우세림");
	
	Map<String,String> hp = new HashMap<>();
	hp.put("data", "1004");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	기본방식: <%=e %> <br>
	기본방식: <%=e.getEmpno() %> <br>
	기본방식: <%=e.getEname() %> <br>
	
	<h3>EL출력</h3>
	${e } <br>
	${e.getEmpno() } <br>
	${e.getEname() } <br>
	<!-- 
	el은 자바객체에 대해서 출력할 때 
	el은 객체에 대한 직접적인 접근이 불가하다. (객체 속성도 출력 불가)
	-예외는 아닌데 화면에 한보임 
	-->
	
	1. JSTL(core)변수 생성, 제어문<br>
	<c:set var="m" value="<%= e %>" />
	
	2. JSTL변수m을 만들고 서버쪽 객체주소값을 설정 ${m} <br>
	
	EL 출력: JSTL 변수값을 출력하기 ${m}
	EL 출력: JSTL 변수 : ${m.getEmpno()}<br>
	EL 출력: 변수통해서 getter 함수 호출 : ${m.empno }<br><!-- 변수.멤버필드 -->
	<!-- 멤버필드가 setter, getter가 구현되어있으면 가능 -->
	EL 출력: 변수통해서 getter 함수 호출 : ${m.ename }<br>
	
	<h3>EL & JSTL 사용하기</h3>
	****EL을 통해서 객체에 직접적인 접근은 불가하다****<br>
	
	****e객체를 : request, session을 담으면 el 접근 가능하다. ****<br>
	
	JSTL 변수의 (value)값으로 EL표현식을 사용할 수 잇다.
	<c:set var="username" value="${m.ename}"/>
	변수가 담긴 값을 출력하는 것도 el "${username }" 이렇게 호출 할 수 있다.<br>
	<hr>
	
	<h3>JSTL 변수 만들고 Scope 정의 하기</h3>
	<!-- var: 변수이름, value=값, scope= 범위 -->
	<c:set var="job" value="농구선수" scope="request" />
	당신의 직업은 : ${job }<br>
	[include], [forward]된 페이지에서 JSTL 변수값을 공유할 수 있다.
	
	
	<!-- 
	필수사항은 아님
	-변수 삭제하기
	 -->
	 <hr>
	 <c:set var="job2" value="야구선수" scope="request" />
		${job2 } <br>
	<c:remove var="job2"/>
		변수 삭제: ${job2 } <br>
	
	
	<c:set var="vhp" value="<%=hp %>"/>
	hp객체: ${vhp }<br>
	hp객체: ${vhp.data } <!-- 키를 제공하면 값을 준다. -->
	
	<!-- 
	hp.put("color", "red");
	 -->
	 JSTL 사용해서 put 함수 구현 가능<br>
	 <!-- <c:set target="다중값객체?" property="키" value="값"/> -->
	 <c:set target="${vhp }" property="color" value="red"/>
	 hp객체 : ${vhp }<br>
	
</body>
</html>