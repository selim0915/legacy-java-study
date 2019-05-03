<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	
</head>
<body>

	<!-- nav -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
	
	<div class="container">
	    <form action="LoginOk.do" method="post" name="loginForm" id="joinForm">
			<h3 style="text-align: center;">Login</h3>
			  <div id="login" class="form-group">
		      	<label for="usr">ID</label>
	      		<input type="text" class="form-control" name="id" id="id">
	      		<label for="usr">Password</label>
	      		<input type="password"  class="form-control" name="pwd" id="pwd">
				<hr>
				<input type="submit" class="form-control" id="joinsubmit" value="로그인">		
	    	  </div>
						
						
		</form>
	</div>
	

</body>
</html>