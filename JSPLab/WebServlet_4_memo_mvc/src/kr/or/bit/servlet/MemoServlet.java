package kr.or.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;

@WebServlet("/MemoServlet")
public class MemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemoServlet() {
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	System.out.println("전송 방식: "+method);
    	
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	String email = request.getParameter("email");
    	String content = request.getParameter("content");
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	try {
    		memodao dao = new memodao();
    		int n = dao.insertMemo(id, email, content);
    		
    		if(n > 0) {
    			out.print("<script>");
    			out.print("alert('등록성공');");
    			out.print("location.href='memo.html';");
    			out.print("</script>");
    		} else {
    			out.print("<script>");
    			out.print("alert('등록실패');");
    			out.print("location.href='memo.html';");
    			out.print("</script>");
    		}
    		
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
