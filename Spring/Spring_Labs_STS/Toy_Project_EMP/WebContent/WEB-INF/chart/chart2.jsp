<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="/common/Top.jsp"/>
<jsp:include page="/common/sidebar.jsp"/>
<jsp:include page="/common/nav.jsp"/>


<!-- 컨텐츠 영역 -->
<div class="row">
<h1 class="title">SALARY BY EMPLOYEE</h1>
</div>
<br>
<div class="row">
	<canvas id="lineChartExample2"></canvas>
</div>
<br>

<div class="row">
	<p>
	  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	    VIEW TABLE
	  </button>
	</p>
	<div class="collapse" id="collapseExample">
	  <div class="card card-body">
	    	<table class="table" id="emplist_table">    
			<thead>
		        <tr>
		            <th class="text-center">ENAME</th>
		            <th class="text-center">SALRALY</th>      
		        </tr>
		    </thead>
		    <tbody>
		    <tr>
		    <c:set var="resultList" value="${requestScope.result}"/>
			<c:forEach var="emp" items="${resultList}">
				  
		          <tr>
		            <td class="text-center">${emp.ename}</td>
		            <td class="text-center">${emp.sal}</td>
		          </tr>
			</c:forEach>
			</tr>		
		   </tbody>
		</table>
	</div>
	  </div>
</div>





<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/chart2.js"></script>
<jsp:include page="/common/bottom.jsp"/>