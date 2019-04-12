<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setCookie(name, value, expiredays){
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + ";path=/; expires=" + todayDate+";"
	}
	
	function cookie_end(){
		if(document.form_pop.Chk.checked){
			setCookie("poppop", "no" ,1);
		}
		self.close();
	}
</script>
</head>
<body>
<form name="form_pop" method="post">
        <h3>팝업창 보기 싫으면 체크하고 닫으세요.</h3>
        <hr>
        <input type="checkbox" name="Chk">하루동안 이창 열지 않기
        <input type="button" value="Close" onclick="cookie_end()">
    </form>
</body>
</html>