<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="kr.or.bit.dao.Empdao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	//jquery 로 간단하게 유효성 check 하기
	$(function() {
		$('#InsertForm').submit(function() {
			//alert("가입");
			if ($('#emp	no').val() == "") { // 아이디 검사
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
	
		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() +1;
		var yyyy = today.getFullYear();
		if(dd<10) {
			dd='0'+dd
		}
		
		if(mm<10){
			mm='0'+mm
		}
		
		today = yyyy+'-'+mm+'-'+dd;
		
 		$('#InsertForm').submit(function() {
			//alert("가입");
			if ($('#empno').val() == "") { // 아이디 검사
				alert('사원번호를 입력해 주세요.');
				$('#empno').focus();
				return false;
			} else if ($('#ename').val() == "") { // 비밀번호 검사
				alert('사원이름을 입력해 주세요.');
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

		var monthNames = [];
		for (var i = 1; i <= 12; i++) {
			monthNames.push(i + "월")
		}
		/* hiredate- datepicker */
		    $( "#hiredate" ).datepicker({
		    	dateFormat: "dd-mm-yy", //YYYY-MM-DD
				prevText : "이전달",
				nextText : "다음달",
				monthNames : monthNames,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				yearSuffix : '년',
				numberOfMonths : 1,
				
				altField: "#hiredate",
				altFormat: "yyyy-mm-dd",
				appendText: "(yyyy-mm-dd)",
				
				onSelect : function(date) {
					var currentdate = $("#hiredate").datepicker('getDate');
					var date = new Date(currentdate);
					var dd2 = date.getDate();
					var mm2 = date.getMonth() +1;
					var yyyy2 = date.getFullYear();
					
					if(dd2<10) {
						dd2='0'+dd2
					}
					
					if(mm2<10){
						mm2='0'+mm2
					}
					
					$("#inputdate").val(yyyy2 + "-"+ mm2 + "-"+ dd2);
				}
		    
		    });
		    $('#datepicker').datepicker('setDate', 'today');
		    $('#inputdate').val(today);
		
		
		

	});
	
	 function moneyformat(obj){
		 var x = obj.value.replace(/[^0-9]/g, '');
		 obj.value = x.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
	 }	
</script>

</head>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
	<!-- container -->
	<c:set var="empno" value="${emp.empno}"/>
	<c:set var="ename" value="${emp.ename}"/>
	<c:set var="job" value="${emp.job}"/>
	<c:set var="mgr" value="${emp.mgr}"/>
	<c:set var="hiredate" value="${emp.hiredate}"/>
	<c:set var="sal" value="${emp.sal}"/>
	<c:set var="comm" value="${emp.comm}"/>
	<c:set var="deptno" value="${emp.deptno}"/>
	<c:set var="joblist" value="${requestScope.joblist}"/>
	<c:set var="deptlist" value="${requestScope.deptList}"/>

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
								type="text" class="form-control" value="${ename }">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">직종<sup style="color: red">*</sup></label> 
								<select id="job" name="job" class="form-control">
								<option>직종을 선택하세요</option>
								
<%-- 								<c:choose>
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
								 --%>
								
								
								<c:forEach var="i" begin="0" end="${joblist.size()-1}">
									<c:choose>
										<c:when test="${joblist[i] == job}">
											<option value="${ joblist[i]}" selected>${ joblist[i]}</option>
										</c:when>
										<c:otherwise>
											<option value="${ joblist[i]}" >${ joblist[i]}</option>
										</c:otherwise> 
									</c:choose>
								</c:forEach>
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
							<label class="control-label required">
								입사일<sup style="color: red">*</sup>
							</label>
							<div id="hiredate">
								<input id="inputdate" name="hiredate" type="text" class="form-control" 
									readonly>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">월급<sup
								style="color: red">*</sup></label>
								<fmt:formatNumber value="${sal}" type="number" var="sal"/>
								 <input id="sal" name="sal"
								type="" class="form-control" value="${sal}" onKeyUp="moneyformat(this);"/>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">추가수당<sup
								style="color: red">*</sup></label>
								<fmt:formatNumber value="${comm}" type="number" var="comm"/>
								<input id="comm" name="comm"
								type="text" class="form-control" value="${comm}" onKeyUp="moneyformat(this);"/>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">

							<label class="control-label required">부서번호<sup style="color: red">*</sup></label> 
								<select id="deptno" name="deptno" class="form-control">
								<option>부서번호를 선택하세요</option>								
								
								<c:forEach var="i" begin="0" end="${deptlist.size()-1}">
									<c:choose>
										<c:when test="${deptlist[i] == deptno}">
											<option value="${ deptlist[i]}" selected>${ deptlist[i]}</option>
										</c:when>
										<c:otherwise>
											<option value="${ deptlist[i]}" >${ deptlist[i]}</option>
										</c:otherwise> 
									</c:choose>
								</c:forEach>

								</select>
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