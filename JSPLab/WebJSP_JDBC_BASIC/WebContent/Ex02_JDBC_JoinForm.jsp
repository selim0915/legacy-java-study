<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link href="common/css/css.css" rel="stylesheet" />
	
	<script type="text/javascript">
	//jquery 로 간단하게 유효성 check 하기
	$(function() {
		$('#joinForm').submit(function() {
			//alert("가입");
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('PWD를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			} else if ($('#mname').val() == "") { // 이름 검사
				alert('mname를 입력해 주세요.');
				$('#mname').focus();
				return false;
			} else if ($('#age').val() == "") { // 나이 검사
				alert('age를 입력해 주세요.');
				$('#age').focus();
				return false;
			} else if ($('#email').val() == "") { // 우편번호
				alert('email를 입력해 주세요.');
				$('#email').focus();
				return false;
			}

		});
	});
	</script>
<!--  
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
-->

</head>
<body>
	<!-- header -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
	<!-- contents -->
	<div class="row">
		<div class="col-lg-2">
			<jsp:include page="/common/Left.jsp"></jsp:include>
		</div>
		
		<div class="col-lg-10 container">
			<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm" id="joinForm">
				<div class="col-lg-8">
					<h3>회원가입</h3>
					<hr>
				</div>
				
				<div class="col-lg-8 form-group" id="txtid">
	                <label for="id">id</label>
	                <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요." maxlength="10">
            	</div>
            	
            	<div class="col-lg-8 form-group" id="txtpwd">
	                <label for="id">pwd</label>
	                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요.">
            	</div>
            	
            	<div class="col-lg-8 form-group" id="txtname">
	                <label for="id">name</label>
	                <input type="text" class="form-control" name="mname" id="mname" placeholder="이름을 입력하세요.">
            	</div>
            	
            	<div class="col-lg-8 form-group" id="txtage">
	                <label for="id">age</label>
	                <input type="text" class="form-control" name="age" id="age" placeholder="나이를 입력하세요.">
            	</div>
            	
            	<div class="col-lg-8 form-group" id="txtgender">
	                <label for="id">gender</label><br>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  <label class="btn btn-secondary">
					    <input type="radio" name="gender" id="gender" value="남" autocomplete="off" checked> 남자
					  </label>
					  <label class="btn btn-secondary">
					    <input type="radio" name="gender" id="gender" value="여" autocomplete="off"> 여자
					  </label>
					</div>
				</div>

            	<div class="col-lg-8 form-group" id="txtemail">
	                <label for="id">email</label>
	                <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요.">
            	</div>
            	
            	<div class="col-lg-8">
            	<hr>
	            	<button type="submit" class="btn btn-primary btn-lg">회원가입</button>
	            	<button type="reset" class="btn btn btn-outline-dark btn-lg">취소</button>
            	</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
	
</body>
</html>