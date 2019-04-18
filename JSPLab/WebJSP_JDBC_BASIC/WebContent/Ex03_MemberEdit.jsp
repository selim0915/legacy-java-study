<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	Ex03_MemberEdit.jsp?id=hong
	sql > select * from koreamember where id=?
	결과를 화면에 출력: <td>rs.getString("name")</td>
				<td><input type="text" value="rs.getString("name")"></td>
				<td><input type="text" value="rs.getString("name")" readonly></td> 값은 넘긴다.
		
	Ex03_MemberEditok.jsp?
	sql > update koreamember set 
 -->
 <%
 	//권한 처리
 	if(session.getAttribute("userid")==null || !session.getAttribute("userid").equals("admin")){
 		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
 	}
 %>	
<%
	String id =request.getParameter("id");
	
	Connection conn=null;
	PreparedStatement pstmt =null;
	ResultSet rs =null;
	
	try{
 		conn = SingletonHelper.getConnection("oracle");
 		String sql ="select id, pwd, name, age, trim(gender), email from koreamember where id=?";
 		pstmt = conn.prepareStatement(sql);
 		pstmt.setString(1, id);
 		rs = pstmt.executeQuery();
 		
 		//out.print("gender: "+rs.getString("gender"));
 		
 		rs.next();
 %>
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
			<h3>회원 수정 화면</h3>
			<hr>
			
			<form action="Ex03_MemberEditok.jsp" method="post">
				<div class="col-lg-8 form-group">
					<label for="id">id</label>
					<input type="text" class="form-control" name="id" value="<%=rs.getString("id") %>" readonly>
				</div>
	
				<div class="col-lg-8 form-group" id="txtpwd">
					<label for="id">pwd</label>
					<span class="form-control"><%=rs.getString("pwd")%></span>
				</div>
	
				<div class="col-lg-8 form-group" id="txtname">
					<label for="id">name</label>
					<input type="text" class="form-control" name="name" value="<%=rs.getString("name") %>" style="background-color: yellow">
				</div>
	
				<div class="col-lg-8 form-group" id="txtage">
					<label for="id">age</label>
					<input type="text" class="form-control" name="age" value="<%=rs.getString("age") %>" style="background-color: yellow">
				</div>
				
				<div class="col-lg-8 form-group" id="txtgender">
	                <label for="id">gender</label><br>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  <label 
					  	<%if (rs.getString("trim(gender)").equals("남")) {%>class="btn btn-info active"<%} else {%>class="btn btn-info"<%}%>>
					    <input type="radio" name="gender" id="gender" value="남" autocomplete="off">남자
					  </label>
					  <label
					  	<%if (rs.getString("trim(gender)").equals("여")) {%>class="btn btn-info active"<%} else {%>class="btn btn-info"<%}%>>
					    <input type="radio" name="gender" id="gender" value="여" autocomplete="off">여자
					  </label>
					</div>
				</div>
	
				<div class="col-lg-8 form-group" id="txtemail">
					<label for="id">email</label>
					<input type="text" class="form-control" name="email" value="<%=rs.getString("email")%>" style="background-color: yellow">
				</div>
	
				<div class="col-lg-8">
            	<hr>
	            	<button type="submit" class="btn btn-primary btn-lg">수정하기</button>
	            	<button class="btn btn btn-outline-dark btn-lg">
	            		<a href='Ex03_Memberlist.jsp'>취소</a>
	            	</button>
            	</div>
			</form>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/common/Bottom.jsp"></jsp:include>

</body>
</html>
<%
	}catch(Exception e){
 		e.printStackTrace();
 	} finally{
 		SingletonHelper.close(pstmt);
 	}
%>
