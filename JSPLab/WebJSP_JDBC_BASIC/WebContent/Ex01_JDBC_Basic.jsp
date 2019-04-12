<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{border: 1px solid black; border-collapse: collapse;}
		
		tr{border: 1px solid blue; background-color: white; color: black}
		
		td{border: 1px solid red; }
		
	</style>
</head>
<body>
<!-- 
JDBC수업때 가장 먼저 한것
1. 드라이버 참조(WEB > WebContent > WEB-INF > lib > ojdbc6.jar)
2. 드라이버를 메모리에 로딩 : class.forName("드라이버 클래스명");
3. DB연결 (연결문자열 만들어서.. : 서버ip,port,id,pw)
4. JAVA JDBC API 사용하여 (interface사용)
api.. connection, statement, prepareStatement, resultset
 -->
 
 <table>
 	<tr>
 		<th>사번</th>
 		<th>이름</th>
 		<th>급여</th>
 		<th>직종</th>
 	</tr>
 	<%
 		//DB연결
		Class.forName("oracle.jdbc.OracleDriver");
 		Connection conn=null;
 		Statement stmt = null;
 		ResultSet rs =null;
 	
		System.out.println("오라클 드라이버 로딩");
		
		//getConnect : Connection구현한 객체의 주소값을 리턴한다.
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "1004");
		System.out.println(conn.isClosed() + "정상 (false)"); //연결 닫혔니? 
				
		stmt = conn.createStatement();
		String sql ="select empno, ename, sal, job from emp";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString("ename") %></td> <!-- ()안에 컬럼명, index 가능 -->
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString("job") %></td>
		</tr>
	<%
		}
		
		if(rs!=null){
			try{
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try{
				stmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try{
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
 	%>
 	
 </table>
 
 
</body>
</html>









