<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
/*
JSTL 사용

<c:set  		변수생성, 값을 저장
<c:remove 		변수삭제
<c:if 			조건문 (test="조건식")
<c:choose 		여러가지 조건에 따른 처리 가능 (else를 사용하는 조건문, if보다 활용도가 높다)
<c:forEach		반복문(개선된 for문 형식)
<c:forTokens	나열된 배열에서 필요한 값만 잘라내는 거 (split, for결합이라고 생각)
<c:out 			jstl 출력구문(out보단 ${} el이 사용 빈도가 높다.
<c:catch		예외처리
		
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL parameter 받기</h3>
	<!-- jsp?id=hong&pwd=1004 -->
	${param.id } - ${param.pwd }
	
	<!-- 변수에 넣는 건 JSTL밖에 안된다. 도움 받아야한다 -->
	<!-- scope안쓰면 default  -->
	<h3>EL & JSTL혼합(의도 : scope강제)</h3>
	<c:set var="userid" value="${param.id }" scope="request" /> <!-- value="param값" -->
	<c:set var="userpwd" value="${param.pwd }" scope="request" />
	
	<h3>변수 사용</h3>
	id: ${userid } <br>
	pwd: ${userpwd } <br>
	
	<!-- JSTL IF문 -->
	<c:if test="${!empty userpwd }"> <!-- empty: 변수가 비어있니? -->
		<h3>not empty userpwd</h3>
		<c:if test="${userpwd =='1004' }">
			<h3>welcome Admin page</h3>
		</c:if>
	</c:if>
	
	
</body>
</html>