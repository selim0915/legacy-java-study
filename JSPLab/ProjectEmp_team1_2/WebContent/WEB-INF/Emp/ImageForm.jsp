<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function check(){
			var form = document.file;
			var ext = form.filename.value;
			console.log(form);
			
			var result = ext.substring(ext.lastIndexOf(".")+1);
			console.log(result);
			
 			if(result == "jpg" || result=="png" || result=="jpeg" ||result=="bmp" || result=="gif"){
				console.log("이미지파일 맞음");
				form.action="FileUpload.do";
				document.getElementById('file').submit();
			}else{
				console.log("이미지파일 아님");
				alert('이미지 파일이 아닙니다.');
			}
		}
	</script>
</head>
<body>

	<!-- nav -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	

	<div class="container">
		<form method="post" name="file" id="file" enctype="multipart/form-data">
			사원번호 : <input type="text" class="form-control" name="empno" value="${param.empno}" readonly><br>
			파일 : <input type="file" class="form-control" name="filename" id="filename"><br>
			<input type="button" class="form-control"  id="picsubmit" value="업로드" onclick="check()">
		</form>	
	</div>


	
</body>
</html>