<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
 //jquery 로 간단하게 유효성 check 하기
 $(function() {
  	$('#joinForm').submit(function() {
		if ($('#id').val() == "") { // 아이디 검사
	    	alert('ID를 입력해 주세요.');
	    	$('#id').focus();
	    return false;
	   } else if ($('#pwd').val() == "") { // 비밀번호 검사
	    alert('PWD를 입력해 주세요.');
	    $('#pwd').focus();
	    return false;
   }
   
  });
 });
</script>
</head>

<body>
	<!-- nav -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
	
	<div class="container">
		<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm" id="joinForm">
			<h3 style="text-align: center;">회원가입</h3>
			  <div id="login" class="form-group">
		      	<label for="usr">ID</label>
	      		<input type="text" class="form-control" name="id" id="id">
	      		<label for="usr">Password</label>
	      		<input type="password"  class="form-control" name="pwd" id="pwd">
				<hr>
				<input type="submit" class="form-control" id="joinsubmit" value="회원가입">		
	    	  </div>
						
						
		</form>
	</div>
	

</body>
</html>