<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bitcamp Group 3</title>
  <meta charset="utf-8">
  <!-- 모바일 반응형을 위한 viewport 설정 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS 링크 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- CSS 세부설정 변경을 위한 external CSS 링크 -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/main.css">
  <%-- <link rel="stylesheet" type="text/css" href='<c:url value="/css/main.css" />'> --%>

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Bootstrap JavaScript 파일 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- External JavaScript 파일: index.js -->
  <script src="${pageContext.request.contextPath}/js/index.js"></script>
  <%-- <script src='<c:url value="/js/index.js" />'></script> --%>
</head>
<body>
	<!-- Header 영역 -->
	<tiles:insertAttribute name="header" />
	
	<!-- Main 영역 -->
	<div class="container">
		<!-- Content 영역 -->
		<tiles:insertAttribute name="content" />
	</div>
	
	<!-- Footer 영역 -->
	<tiles:insertAttribute name="footer" />
</body>
</html>