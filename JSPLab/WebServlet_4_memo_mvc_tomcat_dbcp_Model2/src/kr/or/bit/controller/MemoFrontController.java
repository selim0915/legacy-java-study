package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;
import kr.or.bit.service.MemoListAction;
import kr.or.bit.service.MemoServletAction;

@WebServlet("*.do")
public class MemoFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemoFrontController() {

    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	System.out.println("요청방식: "+method);
    	
    	//URL방식
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	
    	ActionForward forward = null; //redirect 와 path 정보갖는 클래스
    	Action action = null;
    	
    	System.out.println("requestURI : " + requestURI);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("url_Command : " + url_Command);
    	
    	
    	//2. 요청 판단 처리 
    	String viewpage="";
    	if(url_Command.equals("/MemoList.do")) { //회원가입 페이지 전달(업무)
    		action = new MemoListAction(); //다형성
    	    forward =action.execute(request, response);
    		//UI제공
    		//forward = new ActionForward();
    		//forward.setRedirect(false);
    		//forward.setPath("/WEB-INF/memo/memolist.jsp");
     	
    	}else if(url_Command.equals("/MemoServlet.do")){ //회원가입 처리 (업무)
    		action = new MemoServletAction(); //다형성
    	    forward =action.execute(request, response);
    	    
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
    }
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "doGet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "doPost");
	}

}
