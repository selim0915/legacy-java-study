<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 상위 스크린 -->
<div class="container jumbotron jumbotron-imgs">
  <!-- 계절 테마 버튼 -->
  <div class="btn-group">
    <button type="button" class="btn btn-default btn-xs season" id="jumboSpring">SPRING</button>
    <button type="button" class="btn btn-default btn-xs season" id="jumboSummer">SUMMER</button>
    <button type="button" class="btn btn-default btn-xs season" id="jumboFall">FALL</button>
    <button type="button" class="btn btn-default btn-xs season" id="jumboWinter">WINTER</button>
  </div>
  <div class="well well-sm well-text">
    <h1>{ Bitcamp Group 3 }</h1>
    <p>Make it work! Make it right! Make it fast!</p>
  </div>
</div>
<!-- 메뉴 바  -->
<nav class="container navbar navbar-inverse navbar-default" data-spy="affix" data-offset-top="197">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.htm">{ Bitcamp Group 3 }</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">WEB <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="drag_drop.htm">Drag&Drop</a></li>
            <li><a href="mousehover.htm">MouseHover</a></li>
            <li><a href="GIFfile.htm">GIFfile</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="join.htm">Join</a></li>
        <li><a href="login.htm">Login</a></li>
      </ul>
    </div>
  </div>
</nav>