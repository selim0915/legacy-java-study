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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	//jquery 로 간단하게 유효성 check 하기
	$(function() {
		$('#InsertForm').submit(function() {
			//alert("가입");
			if ($('#empno').val() == "") { // 아이디 검사
				alert('사원번호를 입력해 주세요.');
				$('#empno').focus();
				return false;
			} else if ($('#ename').val() == "") { // 비밀번호 검사
				alert('P사원이름을 입력해 주세요.');
				$('#ename').focus();
				return false;
			} else if ($('#job').val() == "") { // 이름 검사
				alert('직종을 입력해 주세요.');
				$('#job').focus();
				return false;
			} else if ($('#mgr').val() == "") { // 나이 검사
				alert('담당 매니저 번호를 입력해 주세요.');
				$('#mgr').focus();
				return false;
			} else if ($('#inputdate').val() == "") { // 우편번호
				alert('입사일을 입력해 주세요.');
				$('#inputdate').focus();
				return false;
			} else if ($('#sal').val() == "") { // 우편번호
				alert('월급을 입력해 주세요.');
				$('#sal').focus();
				return false;
			} else if ($('#comm').val() == "") { // 우편번호
				alert('추가수당를 입력해 주세요.');
				$('#comm').focus();
				return false;
			} else if ($('#deptno').val() == "") { // 우편번호
				alert('부서번호를 입력해 주세요.');
				$('#deptno').focus();
				return false;
			}
		});

		}); 
</script>
</head>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
	<!-- container -->
	<c:set var="Emplist" value="${requestScope.emplist}"></c:set>
	${Emplist.ename }
	<c:set var="empno" value="${param.empno}"></c:set>
	<c:set var="ename" value="${param.ename}"></c:set>
	<c:set var="job" value="${param.job}"></c:set>
	<c:set var="mgr" value="${param.mgr}"></c:set>
	<c:set var="hiredate" value="${param.hiredate}"></c:set>
	<c:set var="sal" value="${param.sal}"></c:set>
	<c:set var="comm" value="${param.comm}"></c:set>
	<c:set var="deptno" value="${param.deptno}"></c:set>

	<div class="container">
		<div class="account-holder" >
			<br><br>
			<form action="EmpModify.do" method="post" name="InsertForm"
				id="InsertForm">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">사원번호<sup
								style="color: red">*</sup>
							</label> 
							<input id="empno" name="empno" type="text" class="form-control"
								value="${empno}" readonly>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">사원이름<sup
								style="color: red">*</sup></label> <input id="ename" name="ename"
								type="text" class="form-control" value="${ename}">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">직종<sup style="color: red">*</sup></label> 
								<select id="job" name="job" class="form-control">
								<option>직종을 선택하세요</option>
								<c:choose>
									<c:when test="${job == 'CLERK'}">
										<option value="CLERK" selected="${job}">CLERK</option>
									</c:when>

									<c:when test="${job == 'SALESMAN'}">
										<option value="SALESMAN" selected="${job}">SALESMAN</option>
									</c:when>

									<c:when test="${job == 'MANAGER'}">
										<option value="MANAGER" selected="${job}">MANAGER</option>
									</c:when>

									<c:when test="${job == 'ANALYSY'}">
										<option value="ANALYST" selected="${job}">ANALYST</option>
									</c:when>

									<c:when test="${job == 'PRESENT'}">
										<option value="PRESENT" selected="${job}">PRESENT</option>
									</c:when>
								</c:choose>
								<option value="CLERK">CLERK</option>
								<option value="SALESMAN">SALESMAN</option>
								<option value="MANAGER">MANAGER</option>
								<option value="ANALYST">ANALYST</option>
								<option value="PRESENT">PRESENT</option>

							</select>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">담당 매니저 번호<sup
								style="color: red">*</sup></label> 
								<input id="mgr" name="mgr" type="text" class="form-control" value="${mgr}">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">입사일<sup
								style="color: red">*</sup></label>
							<div id="hiredate"></div>
							<input id="inputdate" name="hiredate" type="text" value="${hiredate}"
								class="form-control">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">월급<sup
								style="color: red">*</sup></label> <input id="sal" name="sal"
								type="text" class="form-control" value="${sal}">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">추가수당<sup
								style="color: red">*</sup></label> <input id="comm" name="comm"
								type="text" class="form-control" value="${comm}">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required" for="spinner">부서번호<sup
								style="color: red">*</sup></label> <input id="deptno" name="deptno"
								value="${deptno}" class="form-control">
						</div>
					</div>
				</div>
				
				<br>
				
				<div class="row">
					<div class="col-sm-6">
						<input type="submit" class="btn btn-primary btn-block"
							value="UPDATE">
					</div>
					<div class="col-sm-6">
						<input type="reset" class="btn btn-primary btn-block" value="취소">
					</div>
				</div>
				<br><br>
				
			</form>
		</div>
	</div>
</body>
</html>