<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- link -->
<jsp:include page="/common/link.jsp"></jsp:include>

<header id="header">
		<div class="container main-menu">
			<div class="row">
				<div>
<%
	if(session.getAttribute("userid") != null){
		out.print("<b>["+ session.getAttribute("userid")+"]</b>님 로그인 함. ");
		out.print("<a href='Ex02_JDBC_logout.jsp'>[로그아웃]</a>");
	}else{
		out.print("<b>로그인 아직 안함 </b>");
		out.print("<a href='Ex02_JDBC_Login.jsp'>[로그인]</a>");
	}
%>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a class="active" href="Ex02_JDBC_Main.jsp">Home</a></li>
						<li><a href="">menu</a></li>
						<li><a href="">menu</a></li>
						<li><a href="Ex02_JDBC_Login.jsp">sign in</a></li>
						<li><a href="Ex02_JDBC_JoinForm.jsp">sign up</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

