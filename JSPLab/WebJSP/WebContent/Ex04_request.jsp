<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	/* 
	request객체
	Tomcat이 가지고 있는 내장 객체
	
	Tomcat이 가지고 있는 내장객체(웹 프로젝트가 톰켓서버 설정을 가지고 있어야 한다.)
	1. 요청 페이지당 한개의 request가 생성
	2. 클라이언트의 정보를 read 할수 있다.
	3. 클라이언트 정보를 알 수 있다. (입력값, 기본정보(브라우저버전, ip))
	request 내장 객체는 클라이언트에서 서버로 요청할때 생성되는
	HttpServletRequest 타입의 객체가 생성되고 그 주소를 request 변수가 참조
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세림</h3>
	id <%=id %> <br>
	<hr>
	접속한 클라이언트 IP  <%=request.getRemoteAddr() %> <!-- user의 ip뽑음 --> <br>
	서버가 요청한 방식 <%=request.getCharacterEncoding() %> <!-- utf-8 --> <br>
	전송방식 <%= request.getMethod() %> <br>
	포트 <%=request.getServerPort() %> <br>
	context root(가상디렉토리, 홈 디렉토리) <%=request.getContextPath() %> <!-- 파일 다운로드, 업로드 시 실경로때 필요함 --> <br>
	<hr>
	<%= request.getRequestURI() %>
	<!-- 
	가상웹경로 :/WebJSP/Ex04_request.jsp (웹에서 보는 경로/ 이걸로 출력됨)
	실경로 : C:\FrontEndBackEnd\WebJSP\JSPLab\WebJSP\WebContent
	 -->
</body>
</html>