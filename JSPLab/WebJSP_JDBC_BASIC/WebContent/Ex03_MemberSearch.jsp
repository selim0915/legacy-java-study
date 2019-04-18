<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//권한 처리
	if(session.getAttribute("userid")==null || !session.getAttribute("userid").equals("admin")){
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
 %>	
<!DOCTYPE html>
<html>
<head>
<title>회원조회</title>
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
			<h3>검색 결과</h3>
			<hr>
			
			<!-- 조회된 내용 UI 구성 -->
			<%
				request.setCharacterEncoding("utf-8");	
			
				String name = request.getParameter("search");
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				//where name='' //정확한 이름
				//where name like=? //pstmt.setString(1, '%'+name+'%');
				//where name like "'%" +name +"%'"
				conn = SingletonHelper.getConnection("oracle");
				String sql = "select count(*) from koreamember where name like ?";
				String sql2 = "select id, name, email from koreamember where name like '%" +name +"%'";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + name + '%');
				rs = pstmt.executeQuery();
				rs.next();
				
				int count = rs.getInt(1);
			%>
			
			<table style="width:400px; height:100px;">
				<tr>
					<th colspan="3">검색결과</th>
				</tr>
				<%
					if(count >0){
						pstmt = conn.prepareStatement(sql2);
						rs = pstmt.executeQuery();
						while(rs.next()){
							String id = rs.getString(1);
							String mname = rs.getString(2);
							String email = rs.getString(3);
				%>
				<tr>
					<td><%=id %></td>
					<td><%=mname %></td>
					<td><%=email %></td>
				</tr>
				<%
						} //end while
						out.print("<tr><td colspan='3'><b>["+name+"]</b>조회결과 "+ count+"명입니다.</td></tr>");
					} else{
						//조회된 데이터가 없으면
						out.print("<tr><td colspan='3'><b>["+name+"]</b>조회결과가 없습니다.</td></tr>");
					} //end if else
				%>
			</table>
			
			<hr>
			<a href="Ex03_Memberlist.jsp">[회원리스트]가기</a>
			
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
	
</body>
</html>