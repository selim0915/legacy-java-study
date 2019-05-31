<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="/common/Top.jsp"/>
<jsp:include page="/common/sidebar.jsp"/>
<jsp:include page="/common/nav.jsp"/>


<!-- 컨텐츠 영역 -->
<div class="row">
<h1 class="title">TOTAL NUBMER OF EMPLOYEES BY YEAR</h1>
</div>
<br>
<div class="row">
	<div class="col-9">
	<canvas id="lineChartExample"></canvas>
	</div>
	<div class="col-3">
	<table class="table" id="emplist_table">    
		<thead>
	        <tr>
	            <th class="text-center">HIREDATE</th>
	            <th class="text-center">EMPLOYEE</th>      
	        </tr>
	    </thead>
	    <tbody>
	    <tr>
	    <c:set var="resultList" value="${requestScope.result}"/>
		<c:forEach var="emp" items="${resultList}">
			  
	          <tr>
	            <td class="text-center">${emp.hiredate}</td>
	            <td class="text-center">${emp.employee}</td>
	          </tr>
		</c:forEach>
		</tr>		
	   </tbody>
	</table>
	</div>

</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/chart.js"></script>
<jsp:include page="/common/bottom.jsp"/>