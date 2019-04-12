<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
/* 
	쿠키값이(사용자ID가) 존재하면 UID이름을 가진 input태그에 value속성에 그 값을 출력하게 만들어라..!
	쿠키값을 read해서 쿠키변수명이 UID라면 .. 그 값을
*/
	String userid="";
	Cookie[] cookie = request.getCookies();
	if(cookie != null){
		for(Cookie c : cookie){
			if(c.getName().equalsIgnoreCase("id")){
				userid = c.getValue();
			}
		}
	}
%>
<script type="text/javascript">
window.onload = function(){
	var data = '<%=userid%>';
	console.log(data+"님");
	document.getElementById("UID").value =data;
}
</script>
</head>
<body>
	<!-- Ex19_loginok.jsp에 쿠키값을 저장하는 페이지를 만든다. -->
	<form action="Ex19_loginok.jsp" method="get">
		<%-- id: <input type="text" name="UID" value="<%= userid%>"><br> --%>
		id: <input type="text" name="UID" id="UID"><br>
		PWD: <input type="password" name="PWD"><br>
		<hr>
		ID값 유지하기 <input type="checkbox" name="chk">
		<hr>
		<input type="submit" value="login">
		<input type="reset" value="cancel">
	</form>
	
	
</body>
</html>