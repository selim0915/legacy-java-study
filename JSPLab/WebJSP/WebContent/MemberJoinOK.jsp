<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userId");
	String name = request.getParameter("userName");
	String pwd = request.getParameter("userPass");
	String pwd2 = request.getParameter("userPassCheck");
	String gender = request.getParameter("gender");
	String email = request.getParameter("userEmail");
	String ssn1 = request.getParameter("userSsn1");
	String ssn2 = request.getParameter("userSsn2");
	String zipCode = request.getParameter("userZipCode");
	String addr1 = request.getParameter("userAddr1");
	String addr2 = request.getParameter("userAddr2");
	String phone = request.getParameter("userPhone");
	String[] hobbys = request.getParameterValues("hobby");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberJoinOK.jsp</title>
</head>
<body>
	<h2>MemberJoinOK.jsp</h2>
	
	아이디: <%=id%> <br>
	이름: <%=name%> <br>
	비밀번호: <%=pwd%> <br>
	비밀번호확인: <%=pwd2%> <br>
	성별: <%
	if(gender.equals("male")){
		out.print("남");
	} else {
		out.print("여");
	}
	%> <br>
	이메일: <%=email%> <br>
	주민번호 앞자리: <%=ssn1%> <br>
	주민번호 뒷자리: <%=ssn2%> <br>
	우편번호: <%=zipCode%> <br>
	주소 앞번호: <%=addr1%> <br>
	주소 뒷번호: <%=addr2%> <br>
	연락처: <%=phone%> <br>
	취미: <% for(String str : hobbys){
	%>
	<%=str%>
	<%
	}%> <br>
	출생년도: <%=year%> <br>
	출생월: <%=month%> <br>
	출생일: <%=day%> <br>
</body>
</html>