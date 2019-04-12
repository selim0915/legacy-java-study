<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	/* 
	1단계
	int empno = Integer.parseInt(request.getParameter("txtempno"));
	String ename = request.getParameter("txtename");
	
	Emp emp = new Emp();
	emp.setEmpno(empno);
	emp.setEname(ename);
	
	session.setAttribute(emp);
	//a.jsp , b.jsp에서도 서로 참조할수 있다. 
	*/
%>
<%-- 
2단계
<jsp:useBean id="emp" class="kr.or.bit.Emp" scope="session">
	<jsp:setProperty property="empno" name="emp" param="txtempno" />
	<jsp:setProperty property="ename" name="emp" param="txtename" />
</jsp:useBean> 
--%>
<jsp:useBean id="emp" class="kr.or.bit.Emp" scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="emp" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	사번: <jsp:getProperty property="empno" name="emp"/>
	이름: <jsp:getProperty property="ename" name="emp"/>
</body>
</html>