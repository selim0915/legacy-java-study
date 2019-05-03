<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		var monthNames = [];
		for (var i = 1; i <= 12; i++) {
			monthNames.push(i + "월")
		}
		/* hiredate- datepicker */
		    $( "#hiredate" ).datepicker({
		    	dateFormat : "yy년MM월dd일",
				prevText : "이전달",
				nextText : "다음달",
				monthNames : monthNames,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				yearSuffix : '년',
				numberOfMonths : 1,
				onSelect : function(date) {
					var currentdate = $("#hiredate").datepicker('getDate');
					var date = new Date(currentdate);
					$("#inputdate").val(
							date.getFullYear() + "-"
									+ (date.getMonth() + 1) + "-"
									+ date.getDate());
				}
		    });
		/* deptno-spinner */
		    var spinner = $('#deptno').spinner({
				step : 10,
				numberFormat : "n",
				max : 30,
				min : 10
			});
	});
</script>
</head>
<body>
<jsp:include page="/common/Top.jsp"></jsp:include>
	<!-- container -->
	<div class="container">
			<form action="Empadd.do" method="post" name="InsertForm" id="InsertForm">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">
								사원번호<sup style="color: red">*</sup>
							</label> 
							<input id="empno" name="empno" type="text" class="form-control"
								placeholder="사원번호를 입력하세요.">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">사원이름<sup
								style="color: red">*</sup></label> <input id="ename" name="ename"
								type="text" class="form-control"
								placeholder="사원이름을 입력하세요.">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">
								직종<sup style="color: red">*</sup>
							</label> 
							<select id="job" name="job" class="form-control">
								<option value="">직종을 선택하세요</option>
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
							<label class="control-label required">
								담당 매니저 번호<sup style="color: red">*</sup>
							</label> 
								<input id="mgr" name="mgr" type="text" class="form-control"
								placeholder="담당 매니저 번호를 입력하세요.">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">
								입사일<sup style="color: red">*</sup>
							</label>
							<div id="hiredate"></div>
							<input id="inputdate" name="hiredate" type="text" class="form-control" 
								placeholder="2019-05-01">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">월급<sup
								style="color: red">*</sup></label> <input id="sal" name="sal"
								type="text" class="form-control"
								placeholder="월급을 입력하세요.">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">
								추가수당<sup style="color: red">*</sup>
							</label> 
							<input id="comm" name="comm" type="text" class="form-control"
								placeholder="추가수당을 입력하세요.">
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
						<div class="form-group">
							<label class="control-label required">
								부서번호<sup style="color: red">*</sup>
							</label> 
							<input id="deptno" name="deptno" type="text" class="form-control"
								placeholder="부서번호를 입력하세요.">
						</div>
					</div>
				</div>
				
				<br>
				
				<div class="row">
					<div class="col-sm-6">
						<input type="submit" class="btn btn-primary btn-block"
							value="JOIN">
					</div>
					<div class="col-sm-6">
						<input type="reset" class="btn btn-primary btn-block" value="취소">
					</div>
				</div>
				
				<br><br>
			</form>
	</div>
</body>
</html>