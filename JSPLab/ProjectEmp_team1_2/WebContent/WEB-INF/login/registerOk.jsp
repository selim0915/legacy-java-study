<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

/* 
	Ex02_JDBC_JoinForm.jsp에서 --> action="Ex02_JDBC_JoinOK.jsp"
	
	1. 한글처리
	2. parameter 받기 (확인하기)
	3. 로직처리(업무): 회원가입 처리 >> 데이터받고 >> DB연결 >> Insert >> 성공유무 >> client에 전달
	4. 회원가입 성공 > 페이지 이동 > 로그인 페이지로 이동(Ex02_JDBC_Login.jsp)
	          이동 : response.sendRedirect() or javascript(location.href="")
	   회원가입실패시 >> 경고창(가입실패) >> 회원가입 페이지 이동 (Ex02_JDBC_JoinForm.jsp)
	 
	5. 클라이언트 정보(request) 객체
	   id, pwd, name, age, gender, email, ip (request.getRemoteAddr())
	   
 */
 
//	1. 한글처리

 	request.setCharacterEncoding("UTF-8");

//	2. parameter 받기 (확인하기)

 	String id = request.getParameter("id");
 	String pass = request.getParameter("pwd");
 	String name = request.getParameter("mname");
 	String age = request.getParameter("age");
 	String gender = request.getParameter("gender");
 	String email = request.getParameter("email");
 	String ip = request.getRemoteAddr();

 	out.println(id + "/" + pass + "/" + name + "/"+ age+"/" + gender +"/" + email + "/" + ip);
 	
//	3. 로직처리(업무): 회원가입 처리 >> 데이터받고 >> DB연결 >> Insert >> 성공유무 >> client에 전달
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt=null;

	try {
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "bituser", "1234");
		String sql = "INSERT INTO KOREAMEMBER(ID, PWD, NAME, AGE, GENDER, EMAIL, IP) VALUES(?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);

		out.print(conn.isClosed());

		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setString(7, ip);
		
		int result = pstmt.executeUpdate();
		if(result != 0) {
			out.print("정상실행");
			out.print("<script>location.href='Ex02_JDBC_Login.jsp';</script>");
		} else { // 정상실행됨
			
		}
	} catch(Exception e){
		// pstmt.executeUpdate(); 실행도중 발생하는 문제는 이곳에서 발생
		System.out.println(e.getMessage());
		out.print("<script>alert('가입실패');</script>");
		out.print("<script>location.href='Ex02_JDBC_JoinForm.jsp'</script>");
	} finally {
		if(pstmt!=null) try{pstmt.close();}catch(Exception e){}
		if(conn!=null) try{conn.close();}catch(Exception e){}		
	}
%>