<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="empbean" class="kr.or.bit.Emp" scope="request"></jsp:useBean>
<!-- 
Emp empbean = new Emp(); 이거랑 같은 말 
request.setAttribute("empbean", empbean);		
-->
<%
	empbean.setEmpno(2000);
	empbean.setEname("kim");
	
	/* 
		Emp empbean = new Emp();
		empbean.setEmpno(2000);
		empbean.setEname("kim");
		request.setAttribute("empbean", empbean);	
		
		[scope]
		scope = "page"
		default (page)
		=> 현재 페이지 참조
		
		scope="request"
		request.setAttribute("empbean", empbean);
		=> 현재페이지, include, forward된 페이지 공유 참조
				
		scope="session"
		session.setAttribute("empbean", empbean);
		=> 같은 session이 가지는 페이지에서 참조
				
		scope="application"
		application.setAttribute("empbean", empbean);
		web app 안에 모든페이지 참조
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="Ex25_UserBean_Forward.jsp"></jsp:forward>
</body>
</html>