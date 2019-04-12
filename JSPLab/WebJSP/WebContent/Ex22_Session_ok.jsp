<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");

	//데이터 받기
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	
	System.out.println(uid +"/" + pwd);
	
	//로직처리
	//DB연결 >> select >> 회원테이블 >> Id, pwd 존재
	//아이디와 비밀번호가 같으면 회원
	boolean success = false;
	if(uid.equals(pwd)){
		//로그인 성공
		//session에 id값을 담기
		//session변수는 모든 jsp페이지에서 공유가능
		session.setAttribute("memberid", uid);
		success = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(success == true){
		out.println("로그인 성공");
		String user = (String)session.getAttribute("memberid");
		out.println(user+"님 로그인 되었다.");
		out.print("<a href='Ex22_Session_member.jsp'>회원전용</a>");
	}else{
		%>
		<script type="text/javascript">
			alert('다시 로그인해 주세요.');
			window.history.go(-1);
		</script>
		<%
	}
%>
</body>
</html>