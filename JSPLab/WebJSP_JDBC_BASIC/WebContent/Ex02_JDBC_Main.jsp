<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>메인화면</title>
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
			<h3>메인화면</h3>
			<hr>
			
			<%
				String id = null;
				id = (String)session.getAttribute("userid");
				if(id != null){
					out.print(id+"회원님 방가<br>");
					if(id.equals("admin")){
						out.print("<a href='Ex03_Memberlist.jsp'>[멤버보기]</a>");
					}
				} else{
					//로그인하지 않으면
					//로그인하지않은 사용자는 로그인페이지로 ..
					out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
				}
			%>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
	
</body>
</html>