<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="jumbotron" style="margin:0px; 
background-image: url('http://www.matcl.com/files/attach/images/2791205/776/798/002/d416ef2425446caa4183214ccca6393f.jpg');">
  <div class="container text-center" style="color: white;">
    <h1>BITLEY</h1>      
    <p>for prestige class BITLEY</p>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/index.htm">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/board/boardlist.htm">Board</a></li>

      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${pageContext.request.contextPath}/joinus/login.htm""><span class="glyphicon glyphicon-user"></span>Login</a></li>
        <li><a href="${pageContext.request.contextPath}/joinus/join.htm"><span class="glyphicons glyphicons-user-add"></span>Sign-up</a></li>
      </ul>
    </div>
  </div>
</nav>