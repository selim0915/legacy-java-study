<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Ex14_include_param_main.jsp : request 객체 공유</h3>
	<fieldset>
		<legend>include</legend>
		request : <%= request.getParameter("type") %> <br>
		request : <%= request.getParameter("userid") %>
	</fieldset>
	
	<h3>main 페이지에 있는 param 액션 태그값 읽기</h3>
	<fieldset>
		<legend>include (param 액션태그)</legend>
		<%
			String aa = request.getParameter("aaaa"); //type2
			String pp = request.getParameter("pwd"); //1004
			out.println("param 설정값: "+pp +"<br>");
			//String type2 = request.getParameter("type2");
			
			if(aa.equals("ccc")){
				out.println("<i>당신이 요청한 제품은 : "+aa +"</i>");
			}else{
				out.println("<i>당신이 요청한 제품은 품절입니다.</i>");
			}
		%>
	</fieldset>
</body>
</html>