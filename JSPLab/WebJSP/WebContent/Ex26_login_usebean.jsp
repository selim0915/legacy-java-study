<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
<form action="Ex26_loginok.jsp" method="post">
사번 <input type="text" name="txtempno"> <br>
이름 <input type="text" name="txtename"> <br>
<input type="submit" value="전송하기">
</form>
Ex26_loginok.jsp?txtempno=1000&txtename=woo 
-->

<form action="Ex26_loginok.jsp" method="post">
	사번 <input type="text" name="empno"> <br>
	이름 <input type="text" name="ename"> <br>
	<input type="submit" value="전송하기">
</form>
<!-- 
**
만약 넘어가는 파라미터의 이름이 객체에 memberfield명과 동일하다면?

작성할 때부터 name을 객체의 이름(memberfield)와 같게 해준다.
Ex26_loginok.jsp?empno=1000&ename=woo

 -->
</body>
</html>