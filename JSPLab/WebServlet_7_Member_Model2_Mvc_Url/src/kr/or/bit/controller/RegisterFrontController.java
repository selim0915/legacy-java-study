package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

//url 방식 : @WebServlet("/*.do") 
//주소가 고정되면 안된다.
//*.do -> a.do, b.do, aaaa.do

//cmd 방식 : @WebServlet("/Register.do")
//주소뒤에 파라미터를 붙인다.
//Register.do?cmd=register
//Register.do?cmd=registerlist

@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterFrontController() {

    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	//1. 요청받기
    	//String command = request.getParameter("cmd");
    	//Url방식은 cmd 파라미터가 필요없고, 주소값으로 받는다.
    	
    	//주소값
    	//register.do
    	//registerok.do
    	//registerlist.do
    	
    	//주소요청의 판단 근거(함수)
    	String requestURI = request.getRequestURI();
    	//getRequestURI() => WebServlet_7_Member_Model2_Mvc_Url/Register.do
    	
    	String contextPath = request.getContextPath();
    	//getContextPath() => WebServlet_7_Member_Model2_Mvc_Url
    	
    	String url_Command = requestURI.substring(contextPath.length());
    	//url_Command => Register.do !
    	
    	System.out.println("requestURI: "+requestURI);
    	System.out.println("contextPath: "+contextPath);
    	System.out.println("url_Command: "+url_Command);
    	
    	
    	//2. 요청판단처리
    	String viewpage ="";
    	if(url_Command.equals("/Register.do")) { //회원가입페이지 전달
    		viewpage = "/WEB-INF/Register/Register.jsp";
    	}else if(url_Command.equals("/ok.do")) { //회원가입 처리
    		int id = Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		//controller가 데이터를 받아서 service객체를 만들어서 처리하거나,
    		//controller가 바로 dao dto 통해처리 한다.
    		MvcRegister dto = new MvcRegister();
    		dto.setId(id);
    		dto.setPwd(pwd);
    		dto.setEmail(email);
    		
    		MvcRegisterDao dao = new MvcRegisterDao();
    		int result = dao.writeOk(dto); //함수실행
    		
    		String resultdata="";
    		if(result > 0) {
    			resultdata = "welcome to bit" +dto.getId() + "님";
    		} else {
    			resultdata = "Inset Fail retry";
    		}
    		
    		//3. 결과 저장하기
    		request.setAttribute("data", resultdata);
    		viewpage = "/WEB-INF/Register/Register_welcome.jsp";
    	}
    		//4. 결과를 뷰에 지정하기
    		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    		
    		//5. 뷰 보내기
    		dis.forward(request, response);
    		
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "doGet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "doPost");
	}

}
