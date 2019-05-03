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
import kr.or.bit.service.EmpListAsyncService;
import kr.or.bit.service.EmpListService;
import kr.or.bit.service.EmpModifyService;
import kr.or.bit.service.EmpSelectJobDeptnoService;
import kr.or.bit.service.EmpUpdate_dataService;
import kr.or.bit.service.EmpnoSearchService;
import kr.or.bit.service.FileUploadService;
import kr.or.bit.service.LogOutService;
import kr.or.bit.service.LoginOkService;
import kr.or.bit.service.ViewFileService;

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
    	ActionForward forward = new ActionForward(); 
    	
    	if(url_Command.equals("/Emplist.do")) { //사원 리스트 조회
    		try {
    			action = new EmpListService();
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	else if(url_Command.equals("/EmplistAsync.do")) { //select 전체 비동기 리스트
			action = new EmpListAsyncService();
			forward = action.execute(request, response);
    	}
    	else if(url_Command.equals("/insertForm.do")) { //사원등록폼이동
    		action = new EmpSelectJobDeptnoService();
			forward = action.execute(request, response);
    	} 
    	else if(url_Command.equals("/Empadd.do")) { //사원등록처리 
    		try {
    			action = new EmpAddService();
    			forward = action.execute(request, response);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    	else if(url_Command.equals("/updateForm.do")) { //사원수정폼이동
    		System.out.println("수정이동1");
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Emp/EmpDeUp.jsp");
		}
    	else if(url_Command.equals("/EmpModifyForm.do")) { //사원수정폼 또 이동
    		action = new EmpUpdate_dataService();
			forward = action.execute(request, response);
		}
		else if(url_Command.equals("/EmpModify.do")) { //사원수정처리
			System.out.println("수정처리");
	    	try {
    			action = new EmpModifyService();
    			forward = action.execute(request, response);	
			}catch(Exception e) {
				e.printStackTrace();
			}
    	}
		else if(url_Command.equals("/deleteForm.do")) { // 사원삭제 폼 이동
    		try {
    			forward = new ActionForward();
        		forward.setRedirect(false);
        		forward.setPath("/WEB-INF/Emp/EmpDeUp.jsp");
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}
		else if(url_Command.equals("/EmpDelete.do")) { // 사원삭제처리
    		try {
    			action = new EmpDeleteService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}
		else if(url_Command.equals("/EmpnoSearch.do")) { // 사원번호 조회
    		try {
    			System.out.println("EmpnoSearch.do 진입");
    			action = new EmpnoSearchService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}else if(url_Command.equals("/EmpDeptnoSearch.do")) { // 부서번호 조회
    		try {
    			System.out.println("EmpDeptnoSearch.do 진입");
    			action = new EmpDeptnoSearchService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}  else if(url_Command.equals("/Login.do")) { // 로그인
    		try {
    			System.out.println("/Login.do");
    			forward.setRedirect(false);
    			forward.setPath("/WEB-INF/login/login.jsp");
			}catch(Exception e) {
					e.printStackTrace();
			}
    	} else if(url_Command.equals("/LoginOk.do")) { // 로그인 OK
    		try {
    			action = new LoginOkService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}  else if(url_Command.equals("/Logout.do")) { // 로그아웃
    		try {
    			System.out.println("LogOutService 호출");
    			action = new LogOutService();
    			forward = action.execute(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
    	}  else if(url_Command.equals("/Register.do")) { // 회원등록
    		try {
    			forward.setRedirect(false);
    			forward.setPath("/WEB-INF/login/registerForm.jsp");
			}catch(Exception e) {
					e.printStackTrace();
			}
    	} else if(url_Command.equals("/ImageForm.do")) {
    		try {
    			System.out.println("/ImageForm.do 요청");
    			//action = new EmpDeptnoSelectService(); 
    			//forward = action.execute(request, response);
    			forward.setRedirect(false);
    			forward.setPath("WEB-INF/Emp/ImageForm.jsp");
			}catch(Exception e) {
					e.printStackTrace();
			}
    	} else if(url_Command.equals("/FileUpload.do")) {  // 화일 업로드
    		try {
    			System.out.println("/FileUpload.do 요청");
    			action = new FileUploadService(); 
    			forward = action.execute(request, response);
    			

			}catch(Exception e) {
					e.printStackTrace();
			}
    	} else if(url_Command.equals("/ViewFile.do")) {  // 화일 업로드
    		try {
    			System.out.println("/ViewFile.do 요청");
    			action = new ViewFileService(); 
    			forward = action.execute(request, response);
    			

			}catch(Exception e) {
					e.printStackTrace();
			}
    	} else if(url_Command.equals("/EmpChartService.do")) { //차트보기
            try {
           		forward = new ActionForward();
        		forward.setRedirect(false);
        		forward.setPath("/WEB-INF/Emp/Empchart.jsp");
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
