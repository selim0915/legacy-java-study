package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.EmpAddService;
import kr.or.bit.service.EmpDeleteService;
import kr.or.bit.service.EmpDeptnoSearchService;
import kr.or.bit.service.EmpModifyService;
import kr.or.bit.service.EmpSearchService;
import kr.or.bit.service.EmpnoSearchService;

@WebServlet("*.do")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmpController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action = null;
    	ActionForward forward = null; 
    	
		if(url_Command.equals("/selectForm.do")) { //전체조회
			action = new EmpSearchService();
			forward = action.execute(request, response);
    	}else if(url_Command.equals("/insertForm.do")) { //사원등록폼이동
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Emp/EmpInsert.jsp");
    	} else if(url_Command.equals("/Empadd.do")) { //사원등록처리
    		try {
    			action = new EmpAddService();
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else if(url_Command.equals("/updateForm.do")) { //사원수정폼이동
    		System.out.println("수정이동1");
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Emp/EmpDeUp.jsp");
		}else if(url_Command.equals("/EmpModifyForm.do")) { //사원수정폼 또 이동
			System.out.println("수정이동2");
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Emp/EmpUpdate.jsp");
		}else if(url_Command.equals("/EmpModify.do")) { //사원수정처리
			System.out.println("수정처리");
	    	try {
    			action = new EmpModifyService();
    			forward = action.execute(request, response);	
			}catch(Exception e) {
				e.printStackTrace();
			}
    	}else if(url_Command.equals("/deleteForm.do")) { // 사원삭제 폼 이동
    		try {
    			forward = new ActionForward();
        		forward.setRedirect(false);
        		forward.setPath("/WEB-INF/Emp/EmpDeUp.jsp");
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}else if(url_Command.equals("/EmpDelete.do")) { // 사원삭제처리
    		try {
    			action = new EmpDeleteService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}else if(url_Command.equals("/EmpnoSearch.do")) { //사번조회
    		try {
    			action = new EmpnoSearchService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}else if(url_Command.equals("/EmpDeptnoSearch.emp")) { //부서조회
    		try {
    			action = new EmpDeptnoSearchService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
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
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
