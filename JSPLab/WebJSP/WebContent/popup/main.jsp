<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 팝업 쿠키 생성</title>
<script type="text/javascript">
    window.onload=function(){
        Popup();
    }
    
    function Popup(){
        <%
        Cookie[] cookies = request.getCookies();
        boolean showbox = true;
        if(cookies != null){
            for(int i = 0 ; i < cookies.length ; i++){
                if(cookies[i].getName().equals("poppop") && cookies[i].getValue().equals("no")){
                    showbox = false;
                    break;
                }
            }
        }
        
        if(showbox){
        %>
            window.open("popup.jsp","팝업","width=500px, height=300px");
        <%
        }
        %>
    }
</script>
</head>
<body>
    팝업창을 띄우지 않기 위해서 체크를 해주세요.<br>
    꼭이요!!
    <hr>
    <img src="im01.jpg">
</body>
</html>