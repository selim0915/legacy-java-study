<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- 
 1. 권한검사
 2. id값 parameter받기
 3. 삭제: delete from koreamember where id =?
 4. 정상삭제되면 회원 목록 이동 
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
	
	try{
 		conn = SingletonHelper.getConnection("oracle");
 		String sql ="delete from koreamember where id =?";
 		pstmt = conn.prepareStatement(sql);
 		pstmt.setString(1, id);
 		
 		int row = pstmt.executeUpdate();
 		if(row >0){
 			out.print("<script>location.href='Ex03_Memberlist.jsp'</script>");
 		}
 		
	}catch(Exception e){
 		e.printStackTrace();
 	} finally{
 		SingletonHelper.close(pstmt);
 	}
 %>
 
 
 
 