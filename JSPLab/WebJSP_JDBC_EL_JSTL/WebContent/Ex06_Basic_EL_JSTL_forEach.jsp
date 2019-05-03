<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 연습하기(제어문)</title>
</head>
<body>
	<h3>JSTL for문</h3>
	<!-- 
	int sum=0;
	for(int i=1; i<=10; i++){
		sum+=i;
	}
	 -->
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${sum+i }"/>
	</c:forEach>
	
	sum누적값 : ${sum }<br>
	
	<h3>5단 출력하기</h3>
	<c:forEach var="i" begin="1" end="9">
		<li>5* ${i} = ${5*i}</li>
	</c:forEach>
	
	<h3>EL & JSTL 사용해서 (디자인 마음대로) 2~9단</h3>
	<table border='1'>
		<c:forEach var="i" begin="1" end="9">
			<tr>
			<c:forEach var="j" begin="${i+3}" end="9">
				<td>${j } * ${i } = ${i*j } </td>
			</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<h3>EL & JSTL 사용해서 (디자인 마음대로) 2~9단</h3>
	<table border='1'>
		<c:forEach var="i" begin="2" end="9">
			<c:forEach var="j" begin="0" end="9">
				<c:choose>
					<c:when test="${j==0 }">
						<tr bgcolor="yellow"><td>${i }단</td></tr>
					</c:when>
					<c:otherwise>
						<tr><td>${j } * ${i } = ${i*j } </td></tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</table>
	
	
	
	
	
	
	<h3>JSTL forEach 객체 출력하기</h3>
	<!-- 객체를 만들거나 생성.. 주소전달은 자바코드로 한다. el은 객체를 출력하기만 한다. -->
<% 
	int[] arr = new int[]{10, 20, 30, 40, 50};
	for(int i : arr){
		out.print("출력값 : "+ i + "<br>");
	}
%>





	<h3>***EL은 JAVA객체에 직접 접근 불가 >> .</h3>
	  arr 배열 객체에 직접 접근 못한다. 확인 > ${arr } <br>
	 
	 <!-- 
	 1. request, session, application 담거나
	 2. JSTL set으로 변수를 만들어 접근
	  -->
	 
	 <h3>value 에 스크립트 출력문을 사용할수 있다 ( 배열의 주소값을 받는다.)</h3>
	 <c:set var="intarr" value="<%=arr %>"/>
	 c:set으로 변수를 만들면 EL로 접근 가능 ${intarr} <br>
	 
	 <hr>
	 
	 <h3>forEach 개선된 for문 형태로 사용가능 **</h3>
	 <c:forEach var="i" items="${intarr }">
	 	배열값 : ${i } <br>
	 </c:forEach>
	 
	 <hr>
	 
	 <h3>위에 두줄을 아래 한 줄로 바꾼거</h3>
	 <h3>forEach도 개선된 for문처럼 변수, 다중객체만 가지고 사용할수 있다.</h3>
	 <c:forEach var="i" items="<%=arr %>"> <!-- value에 :저렇게 쓰면 주소값 나옴 -->
		c:set 변수 el 접근 가능 ${intarr } <br> 
	 </c:forEach>
	 
	 <hr>
	
	<h3></h3>
	<c:forEach var="i" items="<%= new int[]{1,2,3,4,5} %>">
		배열값_3 : ${i } <br>
	</c:forEach>
	
	
	<hr>
	
	<h3>forEach활용하기 2탄</h3>
	<c:forEach var="i" items="${intarr }" varStatus="status">
		index: ${status.index } &nbsp;
		count: ${status.count } &nbsp;
		value: ${i } <br>
	</c:forEach>
	
	<h3>TODAY POINT</h3>
<%
	List<Emp> emplist = new ArrayList<>();
	emplist.add(new Emp(1000,"A"));
	emplist.add(new Emp(2000,"B"));
	emplist.add(new Emp(3000,"C"));
	emplist.add(new Emp(4000,"D"));
	
	//EL&JSTL 사용하지 않았을 때
	for(Emp e : emplist){
		out.print(e.getEmpno() + "/" + e.getEname() + "<br>");
	}
	
%>
	<h3>JSTL</h3>
	<c:set var="list" value="<%=emplist %>"/>
	<table border="2">
		<tr>
			<td>사번</td>
			<td>이름</td>
		</tr>
		<c:forEach var ="emp" items="<%=emplist %>">
			<tr>
				<td>${ emp.empno }</td>
				<td>${ emp.ename }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h3>JSTL 사용 MAP 다루기</h3>
	<%
		Map<String,Object> hm = new HashMap<>();
		hm.put("name", "hong");
		hm.put("pwd", "1004");
		hm.put("date", new Date());
	%>
	
	<c:set var="hm" value="<%=hm %>"/>
	<c:forEach var="obj" items="${hm} ">
		${obj.key } => ${obj.value } <br>
	</c:forEach>
	
	key 값을 통해 value값을 얻는다.
	name: ${hm.name } <br>
	
	<h3>JSTL 단일 구분자</h3>
	<c:forTokens var="token" items="A.B.C.D" delims=".">
		${token } <br>
	</c:forTokens>
	
	<br>
	
	<h3>JSTL 복합 구분자</h3>
	<c:forTokens items="token" delims="A.B/C-D" delims="./-">
		${token } <br>
	</c:forTokens>
	
	
</body>
</html>