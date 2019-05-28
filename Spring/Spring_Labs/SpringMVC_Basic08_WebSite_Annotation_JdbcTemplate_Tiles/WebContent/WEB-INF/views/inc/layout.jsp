<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>index</title>
		<link href="index.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<!-- Header 영역 -->
		<tiles:insertAttribute name="header"/> 
		
		<!-- Main 영역 -->
		<div id="main">
			<tiles:insertAttribute name="content"/> 
		</div>
		
		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer"/> 
	</body>
</html>
