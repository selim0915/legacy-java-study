<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jQuery/jquery.xml2json.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$.get('socitys.xml', function(xml){
		 var json = $.xml2json(xml);
		 alert(json.message);
		});
});
</script>
</head>
<body>

</body>
</html>