<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="kr.or.bit.dao.Empdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	try {
		Empdao dao = new Empdao();
		Map <Integer, String> deptMap = dao.selectDeptList();
		System.out.println("deptMap Map" +deptMap);
		
		List<Integer> deptno = null;
		List<String> dname = null;
		
		Set<Integer> set = deptMap.keySet();
		
		Iterator<Integer> it = set.iterator();
		while(it.hasNext()) {
			int a=it.next();
			deptno.add(a);
			System.out.println("a: "+a);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} */
%>