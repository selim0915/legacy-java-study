<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="kr.or.bit.dao.Empdao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<%
	Empdao dao = new Empdao();
	List<Emp> emplist = dao.getEmpAllList();
	
	//요청 결과 저장
	request.setAttribute("Emplist", emplist);
%>
</head>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	<div align=center>
		<hr color=pink width=400>
		<h2>사원정보 수정</h2>
		<hr color=pink width=400>
		<div class="container">
		<table class="table table-hover">
			<thead>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>직종</th>
				<th>담당 매니저 번호</th>
				<th>입사일</th>
				<th>월급</th>
				<th>추가수당</th>
				<th>부서번호</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="emp" items="${Emplist}">
					<tr>
						<td>${emp.empno}</td>
						<td>${emp.ename}</td>
						<td>${emp.job}</td>
						<td>${emp.mgr}</td>
						<td>${emp.hiredate}</td>
						<td>${emp.sal}</td>
						<td>${emp.comm}</td>
						<td>${emp.deptno}</td>
						<td><a href="EmpDelete.do?empno=${emp.empno}">[삭제]</a>
						<td><a href="EmpModifyForm.do?empno=${emp.empno}">[수정]</a>
						<td><a href="ImageForm.do?empno=${emp.empno}">[pic업로드]</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
</body>
</html>