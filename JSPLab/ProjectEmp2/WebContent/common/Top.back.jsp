<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
</style>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<<style>
	.navli {
		font-size:30px;
		font-family: 'Hanna';
	}
</style>

<link rel="stylesheet" href="css/design.css">
<!-- Top navigation -->
	<nav class="navbar navbar-inverse" style="background-color: #f1f1f1;">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="Emplist.do" class="navli" >조회</a></li>
				
				<c:if test="${sessionScope.admindto.userid!=null}">
					<li><a href="Empadd.do" class="navli">등록</a></li>
					<li><a href="EmpModify.do" class="navli">수정</a></li>
					<li><a href="EmpDelete.do" class="navli">삭제</a></li>
				</c:if>
			    <c:choose>
				<c:when test="${sessionScope.admindto.userid!=null}">
					<li><a href='Logout.do' class='navli' >${sessionScope.admindto.userid}님 Logout</a><li>
				</c:when>
				<c:otherwise>
					<li><a href='Login.do' class='navli' >로그인</a></li>
				</c:otherwise>
			</c:choose>
			
			</ul>
		</div>
	</nav>