<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <meta charset="utf-8">


	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
	<!--
			CSS
			============================================= -->
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.11/css/lightgallery.min.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	
		<!--################ Start Header Area ########-->
	<button type="button" id="mobile-nav-toggle">
		<i class="lnr lnr-menu">
		</i>
	</button>	
	<header id="header" id="home">
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.jsp"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
					
						<li><a href="Emplist.do">사원조회</a></li>
						
						<c:if test="${sessionScope.admindto.userid!=null}">
							<li><a href="insertForm.do">사원등록</a></li>
							<li><a href="updateForm.do">사원수정/삭제</a></li>
							<li><a href="EmpChartService.do">차트보기</a></li>
						</c:if>
					    <c:choose>
							<c:when test="${sessionScope.admindto.userid!=null}">
								<li><a href='Logout.do'>${sessionScope.admindto.userid}님 Logout</a><li>
							</c:when>
							<c:otherwise>
								<li><a href='Login.do' >로그인</a></li>
							</c:otherwise>
						</c:choose>
					
					</ul>
				</nav>
				<!--######## #nav-menu-container -->
			</div>
		</div>
	</header>
	<!--######## End Header Area ########-->
	
  	<!--######## start banner Area ########-->
 <!--  	
	<section class="home-banner-area relative" id="home">
		<div class="container">
			<div class="row fullscreen d-flex align-items-center">
				<div class="banner-content col-lg-9 col-md-12">
					<h1>
						Creativity <br> Beyond <br> Life
					</h1>
					<a href="#" class="primary-btn header-btn text-capitalize mt-10">hire us now!</a>
				</div>
			</div>
		</div>
	</section>
 -->
	<!--######## End banner Area ########-->
