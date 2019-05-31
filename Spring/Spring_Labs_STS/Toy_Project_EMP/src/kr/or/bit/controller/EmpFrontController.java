package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.service.EmpHiredateTableAction;
import kr.or.bit.service.EmpDeleteAction;
import kr.or.bit.service.EmpEditAction;
import kr.or.bit.service.EmpListAction;
import kr.or.bit.service.EmpSalTableAction;

@WebServlet({"*.do" })
public class EmpFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EmpFrontController() {super();}
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Actionforward forward = null;
    	Action action = null;
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String uri_Command = requestURI.substring(contextPath.length());
    	
    	System.out.println("requestURI: " + requestURI);
    	System.out.println("contextPath: " + contextPath);
    	System.out.println("uri_Command : " + uri_Command);
    	
    	if(uri_Command.equals("/index.do")) {
    		forward = new Actionforward();
    		forward.setRedirect(false);
    		forward.setPath("/index.jsp");
    		
    	}else if(uri_Command.equals("/emplist.do")) {
    		action = new EmpListAction();
    		forward = action.excute(request, response);

    	}else if(uri_Command.equals("/edit.do")) {
    		action = new EmpListAction();
    		forward = action.excute(request, response);
    	
    	}else if(uri_Command.contentEquals("/editok.do")) {
    		action = new EmpEditAction();
    		forward = action.excute(request, response);
    	
    	}else if(uri_Command.equals("/delete.do")) {
    		action = new EmpDeleteAction();
    		forward = action.excute(request, response);
    		
    	}else if(uri_Command.equals("/emphiredatetable.do")) {
    		action = new EmpHiredateTableAction();
    		forward = action.excute(request, response);
    		
    	}else if(uri_Command.equals("/empsaltable.do")) {
    		action = new EmpSalTableAction();
    		forward = action.excute(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
