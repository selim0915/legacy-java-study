<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//권한 처리
	if (session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
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
			<h3>회원 정보 상세보기</h3>
			<hr>

			<!-- 
				회원 상세 페이지
				1. 권한검사
				2. id값 받기 (where id=hong) pk >> request.getParamemter("id");
				3. select id, pwd, name, age, gender, email from koreamember where id=?
				4. id primary key (하나의 row가 보장됨)
				5. 화면 구성 (UI) 
				 -->
			<%
				String id = request.getParameter("id");

				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {
					conn = SingletonHelper.getConnection("oracle");
					String sql = "select id, pwd, name, age, gender, email from koreamember where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();

					//여기선 회원아이디가 반드시존재, 1개만 있어서 rs.next() 해도 된다.
					while (rs.next()) {
			%>
			<table>
				<tr>
					<td style="width: 200px">id</td>
					<td style="width: 200px"><%=rs.getString("id")%></td>
				</tr>
				<tr>
					<td style="width: 200px">pwd</td>
					<td style="width: 200px"><%=rs.getString("pwd")%></td>
				</tr>
				<tr>
					<td style="width: 200px">name</td>
					<td style="width: 200px"><%=rs.getString("name")%></td>
				</tr>
				<tr>
					<td style="width: 200px">age</td>
					<td style="width: 200px"><%=rs.getString("age")%></td>
				</tr>
				<tr>
					<td style="width: 200px">gender</td>
					<td style="width: 200px"><%=rs.getString("gender")%></td>
				</tr>
				<tr>
					<td style="width: 200px">email</td>
					<td style="width: 200px"><%=rs.getString("email")%></td>
				</tr>
				<tr>
					<td colspan="2"><br><a href="Ex03_Memberlist.jsp">[전체목록보기]</a></td>
				</tr>
			</table>
			<%
				}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					SingletonHelper.close(rs);
					SingletonHelper.close(pstmt);
				}
			%>


		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/common/Bottom.jsp"></jsp:include>

</body>
</html>