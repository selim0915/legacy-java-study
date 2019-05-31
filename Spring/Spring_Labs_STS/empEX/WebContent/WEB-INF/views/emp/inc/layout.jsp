<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- Top 역역 -->
<tiles:insertAttribute name="header" />

<body>
	<div class="wrapper ">
		<!-- left 역역 -->
		<tiles:insertAttribute name="left" />
		
		<div class="main-panel">
			<!-- header 역역 -->
			<tiles:insertAttribute name="header" />
			
			<div class="content">
				<div class="container-fluid">
					<tiles:insertAttribute name="content" />
				</div>
			</div>

			<!-- footer 역역 -->
			<tiles:insertAttribute name="footer" />
			
		</div>
	</div>
</body>
</html>