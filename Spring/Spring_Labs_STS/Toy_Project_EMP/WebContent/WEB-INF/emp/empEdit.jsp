<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<jsp:include page="/common/Top.jsp"/>
<jsp:include page="/common/sidebar.jsp"/>
<jsp:include page="/common/nav.jsp"/>

<c:set var="emp" value="${requestScope.resultOne}"/>
<!-- 컨텐츠 영역 -->
<h1 class="title">${emp.ename }'s EMP Information</h1>
<div class="card">
  <div class="card-body">
  
    <form action="editok.do" method="post">
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputEmail4">EMPNO</label>
          <input type="number" class="form-control" name="empno" value="${emp.empno}">
        </div>
        <div class="form-group col-md-6">
          <label for="inputPassword4">ENAME</label>
          <input type="text" class="form-control" name="ename" value="${emp.ename}">
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputEmail4">JOB</label>
          <input type="text" class="form-control" name="job" value="${emp.job}">
        </div>
        <div class="form-group col-md-6">
          <label for="inputPassword4">MGR</label>
          <input type="number" class="form-control" name="mgr" value="${emp.mgr}">
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputEmail4">HIREDATE</label>
          <input type="date" class="form-control" name="hiredate" value="${emp.hiredate}">
        </div>
        <div class="form-group col-md-6">
          <label for="inputPassword4">SAL</label>
          <input type="number" class="form-control" name="sal" value="${emp.sal}">
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="inputEmail4">COMM</label>
          <input type="number" class="form-control" name="comm" value="${emp.comm}">
        </div>
        <div class="form-group col-md-6">
          <label for="inputPassword4">DEPTNO</label>
          <input type="number" class="form-control" name="deptno" value="${emp.deptno}">
        </div>
      </div>
      <button type="submit" class="btn btn-primary">Modified</button>
      <button class="btn btn-primary btn-simple" id="backList">Back</button>
    </form>
  </div>
</div>

<jsp:include page="/common/bottom.jsp"/>