<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	1. 한글처리
	2. 데이터 받기(id, pwd)
	3. db연동(sql)
	4. 업무(로직)처리
	
	id, pwd를 parameter로 받아서 회원인지 아닌지 판단하는 것
	
	판단조건 
	1. id존재, pwd일치 > 회원이다 > session.setAttribute("userid", id값)> main페이지로 이동  
	2. id존재, pwd불일치 > 다시한번 로그인 처리 >로그인페이지
	3. id존재x > 회원가입 페이지
	
	>sql : select id, pwd from koreamember where id=?
	>>Select ..
	1. 결과없는 경우
	
	2. single row
	
	3. multi row (회원 조회때 쓰이지 로그인에서는 거의없다)
	
	if(rs.next()){
		do{
			rs.getString(1, id);
			rs.getString(2, pwd);
		}while(rs.next());
	}else{
		out.print('회원이 아닙니다.');
	}
	
	요구사항
	https://cafe.naver.com/kangnamfullstack/665
	1. 기능적 요구사항
	- 로그인 기능
	2. 비기능적 요구사항
	- single톤 사용해서 코드 중복성 줄인다.
	*/
	
	request.setCharacterEncoding("utf-8");
	
	String id =request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//out.print(id+"/"+pwd);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	try {
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "1004");
		conn =SingletonHelper.getConnection("oracle");
		String sql = "select id, pwd from koreaMember where id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			if(pwd.equals(rs.getString("pwd"))){
				session.setAttribute("userid", rs.getString("id"));
				
				out.print("<script>");
				out.print("location.href='Ex02_JDBC_Main.jsp'");
				out.print("</script>");
			} else{
				out.print("<script>");
				out.print("location.href='Ex02_JDBC_Login.jsp'");
				out.print("</script>");
			}
		}
		
		out.print("<script>");
		out.print("location.href='Ex02_JDBC_JoinForm.jsp'");
		out.print("</script>");
		
	} catch(Exception e){
		out.print(e.getMessage());
	} finally{
		SingletonHelper.close(rs);
		SingletonHelper.close(pstmt);
	}
%>
