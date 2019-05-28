<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>
		<!-- title 영역 -->
		<tiles:getAsString name="title" />
	
	</title>
	<link href="${pageContext.request.contextPath}/customer/notice.css" type="text/css" rel="stylesheet">
</head>
<body>
		<!-- Header  영역 -->
		<tiles:insertAttribute name="header" />
		
		<div id="main">
				 <tiles:insertAttribute name="content" />
		</div>
		
		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />
</body>
</html>