<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
이 페이지는 admin만 가능한 페이지입니다.
=> 권한처리 필수

뭐하는 페이지인가?
1. 회원 목록을 보여준다.
2. 관리자만 접근이 가능하다. (userid=admin)
3. 로그인한 일반 사용자가 주소값을 외워서 접근하는것도 막아야 한다. => 로그인페이지 이동
4. 고려사항 (권한처리 코드가 여러페이지에 사용된다면 (유지보수: 별도의 페이지로 뺴서 작업 include)
 -->
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
			<h3>회원 정보 보기</h3>
			<hr>

			<!-- 회원 목록 출력하기
					관리자는 회원데이터를 볼수 있다.
					목록출력 > 상세정보 별도 구성
					목록: select id, ip from koreamember;
					
					회원데이터(HTML결합) 출력
				 -->
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {
					conn = SingletonHelper.getConnection("oracle");
					String sql = "select id, ip from koreamember";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					/* while(rs.next()){
						out.print(rs.getString("id")+"<br>");
					} */
			%>
			<table style="width: 400px; height: 100px;">
				<tr>
					<th colspan="4">회원리스트</th>
				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td width="200px"><a
						href="Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("id")%>
					</a></td>
					<td width="200px"><%=rs.getString("ip")%></td>
					<td width="200px">
						<!-- 삭제구현 --> <a
						href="Ex03_MemberDelete.jsp?id=<%=rs.getString("id")%>"> [삭제]
					</a>
					</td>
					<td width="200px"><a
						href="Ex03_MemberEdit.jsp?id=<%=rs.getString("id")%>"> [수정] </a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<hr>

			<form action="Ex03_MemberSearch.jsp" method="post">
				회원명 : <input type="text" name="search"> <input type="submit"
					value="이름 검색 하기">
			</form>
			<%
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