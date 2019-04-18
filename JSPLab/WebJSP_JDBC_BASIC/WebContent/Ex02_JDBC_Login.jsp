<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	
	<!-- container -->
	<div class="row sr_container">
	
		<!-- nav -->
		<jsp:include page="/common/Left.jsp"></jsp:include>
		
		<!-- contents -->
		<div class="col-lg-10 col-md-12 col-sm-12 sr_contents">
			<form action="Ex02_JDBC_loginok.jsp" method="post" name="loginForm" id="loginForm">
				<h3>로그인</h3>
				<hr>
				
				<div class="col-lg-8 form-group" id="txtid">
	                <label for="id">id</label>
	                <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요.">
            	</div>
            	
            	<div class="col-lg-8 form-group" id="txtpwd">
	                <label for="id">pwd</label>
	                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요.">
	            </div>
            	
            	<div class="col-lg-8">
            	<hr>
	            	<button type="submit" class="btn btn-primary btn-lg">로그인</button>
	            	<button type="reset" class="btn btn btn-outline-dark btn-lg">취소</button>
            	</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
	
</body>
</html>