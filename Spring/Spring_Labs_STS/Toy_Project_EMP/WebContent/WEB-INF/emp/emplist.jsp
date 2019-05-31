<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<jsp:include page="/common/Top.jsp"/>
<jsp:include page="/common/sidebar.jsp"/>
<jsp:include page="/common/nav.jsp"/>
<!-- 컨텐츠 영역 -->

  <div class="row">
    <div class="col-sm-7">
    	 <h1 class="title">EMP TABLE</h1>
    </div>

    <div class="col-sm-5 text-right">
      	<p>
		    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
		      Add New Member
		    </button>
		</p>
		<div class="collapse" id="collapseExample">
		  <div class="card card-body" id="addListForm">
		  <div id="hasEmpno">
            <input type="text" placeholder="EMPNO" class="form-control" id="empnoN" name="empnoN" data-toggle="tooltip" data-placement="left" title="Enter 'empno'">
          </div>  
            <input type="text" placeholder="ENAME" class="form-control" id="enameN" name="enameN" data-toggle="tooltip" data-placement="left" title="Enter 'ename'">
            <input type="text" placeholder="JOB" class="form-control" id="jobN" name="jobN" data-toggle="tooltip" data-placement="left" title="Enter 'job'">
            <input type="number" placeholder="MGR" class="form-control" id="mgrN" name="mgrN" data-toggle="tooltip" data-placement="left" title="Enter 'mgr'">
            <input type="date" placeholder="HIREDATE" class="form-control" id="hiredateN" name="hiredateN" data-toggle="tooltip" data-placement="left" title="Enter 'hiredate' or Select 'hiredate'">
            <input type="number" placeholder="SAL" class="form-control" id="salN" name="salN" data-toggle="tooltip" data-placement="left" title="Enter 'sal'">
            <input type="number" placeholder="COMM" class="form-control" id="commN" name="commN" data-toggle="tooltip" data-placement="left" title="Enter 'comm'">
            <input type="number" placeholder="DEPTNO" class="form-control" id="deptnoN" name="deptnoN" data-toggle="tooltip" data-placement="left" title="Enter 'deptno'">        
   			<button class="btn btn-default disabled" type="submit" id="newMember" name="newMember">NEW MEMBER</button>
		  </div>
		</div>
    </div>
  


  </div><!--row end  -->
  
  
<div class="row">  
	<div class="col-sm-3">
	   <input type="text" class="form-control" id="empListSearch" name="empListSearch" placeholder="Enter empno or deptno.">
	</div>

	<div class="col-sm-8">
		<nav aria-label="...">
		  <ul class="pagination justify-content-end">
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item active">
		      <span class="page-link">
		        2
		        <span class="sr-only">(current)</span>
		      </span>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		  </ul>
		</nav>
	</div>
	<div class="col-sm-1">
		<select class="form-control" id="exampleFormControlSelect1">
	      <option>5</option>
	      <option>10</option>
	      <option>15</option>
	      <option>30</option>
	      <option>ALL</option>
	    </select>
	</div>

</div>

<div class="row">
<div class="col-sm-12">
<table class="table" id="emplist_table">    
	<thead>
        <tr>
            <th class="text-center">Index</th>
            <th class="text-center">EMPNO</th>
            <th class="text-center">ENAME</th>
            <th class="text-center">JOB</th>
            <th class="text-center">MGR</th>
            <th class="text-center">HIREDATE</th>
            <th class="text-center">SAL</th>
            <th class="text-center">COMM</th>
            <th class="text-center">DEPTNO</th>
            <th class="text-center">SETTING</th>        
        </tr>
    </thead>
    <tbody id="empAddList">
    <c:set var="resultList" value="${requestScope.result}"/>
	<c:forEach var="emp" items="${resultList}" varStatus="status">
		  <tr>
            <td class="text-center">${status.index+1}</td>
            <td class="text-center">${emp.empno}</td>
            <td class="text-center">${emp.ename}</td>
            <td class="text-center">${emp.job}</td>
            <td class="text-center">${emp.mgr}</td>
            <td class="text-center">${emp.hiredate}</td>
            <td class="text-center">${emp.sal}</td>
            <td class="text-center">${emp.comm}</td>
            <td class="text-center">${emp.deptno}</td>
            <td class="td-actions text-center">
                <button type="button" rel="tooltip" class="btn btn-info btn-sm btn-icon" name="${emp.empno}" title="${emp.ename}'s 프로필 사진등록">
                    <i class="far fa-address-card"></i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-success btn-sm btn-icon" onclick='location.href="edit.do?empno=${emp.empno}"' name="${emp.empno}" id="${emp.empno}" title="${emp.ename}'s 정보수정">
                    <i class="fas fa-user-cog"></i>
                </button> 
                <button type="button" rel="tooltip" class="btn btn-danger btn-sm btn-icon" onclick='location.href="delete.do?empno=${emp.empno}"' name="${emp.empno}" id="${emp.empno}" title="${emp.ename}'s 삭제하기">
                    <i class="fas fa-user-slash"></i>
                </button></td></tr>
	</c:forEach>
	
    </tbody>
</table>
</div>
</div>
<jsp:include page="/common/bottom.jsp"/>