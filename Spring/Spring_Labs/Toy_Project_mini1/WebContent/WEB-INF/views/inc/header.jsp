<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav
	class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
	<div class="container-fluid">
		<div class="navbar-wrapper">

			<a class="navbar-brand" href="#pablo">Team3</a>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			aria-controls="navigation-index" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="sr-only">Toggle navigation</span> <span
				class="navbar-toggler-icon icon-bar"></span> <span
				class="navbar-toggler-icon icon-bar"></span> <span
				class="navbar-toggler-icon icon-bar"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end">
			<ul class="navbar-nav">
				<!--             <li class="nav-item">
              <a class="nav-link" href="./index.jsp">
                <i class="tim-icons icon-bell-55"></i> Home
              </a>
            </li> -->
				<!--  <li class="nav-item">
              <a class="nav-link" href="./Ex02_JDBC_JoinForm.jsp">
                <i class="tim-icons icon-bell-55"></i>  Sign up
              </a>
            </li>
             your navbar here
            <li class="nav-item">
              <a class="nav-link" href="./Ex02_JDBC_Login.jsp">
                <i class="tim-icons icon-bell-55"></i>  Sign in
              </a>
            </li> -->



				<%
					if (session.getAttribute("userid") != null) {
						/* 		out.print("<b>[" + session.getAttribute("userid") + "]</b> 로그인 상태");
								out.print("<a href='Ex02_JDBC_Logout.jsp'>[ 로그아웃 ]</a>"); */
				%>
				<li class="nav-item"><a class="nav-link"
					href="Ex02_JDBC_Main.jsp"> <i class="tim-icons icon-bell-55"></i>
						Hello,&nbsp; <%
 	out.print(session.getAttribute("userid"));
 %>&nbsp;!
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./Ex02_JDBC_Logout.jsp"> <i
						class="tim-icons icon-bell-55"></i> Log out
				</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link"
					href="./Ex02_JDBC_JoinForm.jsp"> <i
						class="tim-icons icon-bell-55"></i> Sign up
				</a></li>
				<!-- your navbar here -->
				<li class="nav-item"><a class="nav-link"
					href="./Ex02_JDBC_Login.jsp"> <i class="tim-icons icon-bell-55"></i>
						Sign in
				</a></li>
				<%
					}
				%>

				<!-- nav end -->
			</ul>
		</div>
	</div>
</nav>