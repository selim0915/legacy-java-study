<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <body>
<div class="wrapper ">
  <div class="sidebar" data-color="purple" data-background-color="white">
    <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
    <div class="logo">
      <a href="https://blog.naver.com/ajdkfl6445" class="simple-text logo-mini">
        MJ
      </a>

      <a href="https://blog.naver.com/ajdkfl6445" class="simple-text logo-normal">
       Master Jung
      </a>
    </div>

    <div class="sidebar-wrapper">
      <ul class="nav">
        <li class="nav-item active  ">
            <a class="nav-link" href="emplist.do">
                <i class="fas fa-chalkboard"></i>
                <p>EMP TABLE</p>
            </a>
        </li>

         <!-- your sidebar here -->
         
         <li class="nav-item active  ">
            <a class="nav-link" href="emphiredatetable.do">
                <i class="fas fa-chart-line"></i>
                <p>Dashboard1</p>
            </a>
        </li>
        
        <li class="nav-item active  ">
            <a class="nav-link" href="empsaltable.do">
                <i class="fas fa-chart-bar"></i>
                <p>Dashboard2</p>
            </a>
        </li>
        
      </ul>
    </div>
  </div>
  
  