<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="kr.or.bit.dao.Empdao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	<c:set var="Emplist" value="${requestScope.emplist}"></c:set>
	
<%-- 	<div class="container">
		<div>
			<label class="control-label required" style="margin-bottom: 10px;">사원번호로
				검색</label><sup style="color: red">*</sup> <input type="text" name="empno"
				id="empno" placeholder="사원번호를 입력해주세요">
			<button id="btn">검색</button>
		</div>
		<div>
			<label class="control-label required">부서번호로 검색</label><sup
				style="color: red">*</sup> <select id="deptnoselect"
				name="deptnoselect"
				style="width: 50px; height: 24px; margin-bottom: 10px;">
				<option value="10or20or30" selected>전체</option>
				<c:forEach var="deptno" items="${DeptnoList}">
					<option value="${deptno }">${deptno}</option>
				</c:forEach>
			</select>
		</div>
	</div> --%>
	<div class="container">
		<div id="Dlist">
			<table class="table table-striped"
				style="border: 1px solid black; text-align: center;">
				<tr>
					<th style="text-align: center;">사원번호</th>
					<th style="text-align: center;">사원이름</th>
					<th style="text-align: center;">직종</th>
					<th style="text-align: center;">담당 매니저 번호</th>
					<th style="text-align: center;">입사일</th>
					<th style="text-align: center;">월급</th>
					<th style="text-align: center;">추가수당</th>
					<th style="text-align: center;">부서번호</th>
				</tr>
				<c:forEach var="i" begin="0" end="${Emplist.size() }">
					<tr>
						<td>${Emplist[i].empno }</td>
						<td>${Emplist[i].ename }</td>
						<td>${Emplist[i].job }</td>
						<td>${Emplist[i].mgr }</td>
						<td>${Emplist[i].hiredate }</td>
						<td>${Emplist[i].sal }</td>
						<td>${Emplist[i].comm }</td>
						<td>${Emplist[i].deptno }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
<%-- 		<div style="margin-bottom: 15px; text-align: center">
			<span style="padding: 0;" class="btn" id="first">처음</span>
			<c:forEach var="i" begin="1" end="<%=count%>">
				<span style="padding: 0;" class="btn" id="paging">${i}</span>
			</c:forEach>
			<span style="padding: 0;" class="btn" id="end">마지막</span>
		</div> --%>
	</div>
</body>
</html>