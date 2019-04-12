<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		요청에대한 흐름제어를 하는 것 (forward)
		
		include
		forward 같이 비교
		
		공통점: request 객체를 공유할 수 있다. (다음 페이지에서도 값을 이용할 수 있다.)
		차이점: include는 제어권을 돌려 받는다.
				forward 제어권을 넘겨 준다.
				(요청 주소는 동일한데 : 각각 다른page에 서비스를 받을 수 있다.)
				why: 처음 요청했던 페이지에 버퍼를 그대로 사용하여 주소는 바뀌지 않는다.
				localhost:8090/WebJSP/login.jsp
				받는 페이지 내용은: A.jsp, B.jsp, C.jsp을 받을 수 잇다.
	*/
	String code = request.getParameter("code");
	String viewURI = null;
	
	if(code.equals("a")){
		viewURI = "/forward/a.jsp";
	} else if (code.equals("b")){
		viewURI = "/forward/b.jsp";
	} else if (code.equals("c")){
		viewURI = "/forward/c.jsp";
	}
%>

<jsp:forward page="<%=viewURI %>"></jsp:forward>