<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("UID");
	String pwd = request.getParameter("PWD");
	String chk = request.getParameter("chk"); //value =null, on
	out.println("uid: "+uid+" pwd: "+pwd+" chk: "+chk);
	
	if(chk==null){
		chk = "on2";
	}
	
	if(uid.equals("serim") && pwd.equals("1234")){
		
		out.println("<script>alert('로그인 성공');</script>");
			
		if(chk.equals("on")){
			Cookie cookie = new Cookie("id", uid);
			cookie.setMaxAge(1*24);
			response.addCookie(cookie);
		}else if(chk.equals("on2")) {
			Cookie cookie2 = new Cookie("id", "");
			cookie2.setMaxAge(0);
			response.addCookie(cookie2);
		}
	} else {
		out.println("<script>alert('로그인 실패');</script>");
		response.sendRedirect("Ex19_login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	UID, PWD, chk 여부
	1. id, pwd가 같다면 로그인성공으로 봐라 (id.equals())
	  로그인 성공일 때 chk가 체크되어있다면 > 2-1쿠키생성 2-2 쿠키에ID담기 2-3유효기간(24시간)
	  쿠티 쓰기 완료
	  
	2. 로그인 성공일 때 chk가 체크되어있지 않으면 > 만들었던 쿠키를 삭제 (삭제하는 메서드가 없다) 
	setMaxAge(0) : 유효기간을 0으로해서 메모리 쿠키로 만들어 버리기
	- 쿠키삭제? 
	Cookie delco = new Cookie("UID", "");
	delco.setMaxAge(0);
	response.addCookie(delco);
	
	3. id, pwd가 같지 않으면 
	response.sendRedirect() -> Ex19_login.jsp
 -->
</body>
</html>