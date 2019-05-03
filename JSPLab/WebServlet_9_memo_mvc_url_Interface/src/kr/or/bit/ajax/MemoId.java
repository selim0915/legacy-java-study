package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

/*
 요구사항:
 id검증
 (사용자가 입력한 id가 db에 있는지 없는지 확인)
 isCheckById 사용해서 return "false", "true" 을 
 */

@WebServlet("/MemoId")
public class MemoId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemoId() {
    }
    
	private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	System.out.println("전송 방식: "+method);
    	
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	PrintWriter out = response.getWriter();
	
    	String id = request.getParameter("id");
    	
    	//MVC패턴
    	try {
    		//요청받기, 판단 (업무 로직 실행)
    		memodao dao = new memodao();
    		String memoid = dao.isCheckById(id);
    		out.print(memoid);
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}
}
