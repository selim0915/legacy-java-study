<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String memberid = (String)session.getAttribute("memberid");
	boolean loginstate = (memberid == null)?false:true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex22_Session_member.jsp 회원전용 페이지</title>
</head>
<body>
<%
	if(loginstate){ //true
		out.println(memberid + "님 로그인 상태입니다.");
		out.println("당신은 이 페이지를 볼 수 있습니다.");
		out.print("<a href='Ex22_Session_logout.jsp'>로그아웃</a>");
	} else{
		out.print("<script>alert('누구야!'); location.href='Ex22_Session_login.jsp'; </script>");
	}
%>
</body>
</html>