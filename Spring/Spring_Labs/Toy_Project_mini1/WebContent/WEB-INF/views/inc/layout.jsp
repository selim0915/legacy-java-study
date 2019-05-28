<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- Top 영역 -->
<tiles:insertAttribute name="top"/> 

<body>
	<div class="wrapper ">
		<!-- Left 영역 -->
		<tiles:insertAttribute name="left"/> 
		
		<div class="main-panel">
			<!-- Header 영역 -->
			<tiles:insertAttribute name="header"/> 
			
			
			<div class="content">
				<div class="container-fluid">
					안녕하세요.<br>
					감사합니다.
				</div>
			</div>

			<!-- Footer 영역 -->
			<tiles:insertAttribute name="footer"/> 
		</div>
	</div>


</body>
</html>