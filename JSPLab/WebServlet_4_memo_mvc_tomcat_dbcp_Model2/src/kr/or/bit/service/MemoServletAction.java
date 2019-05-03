package kr.or.bit.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;

public class MemoServletAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward =null;
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String id = request.getParameter("id");
	    	String email = request.getParameter("email");
	    	String content = request.getParameter("content");
	    	
	    	response.setContentType("text/html; charset=UTF-8");
	    	PrintWriter out = response.getWriter();
	    	
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
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/MemoList.do");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
		return forward;
	}

}
