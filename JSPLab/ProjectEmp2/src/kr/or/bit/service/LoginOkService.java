package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminlistDao;
import kr.or.bit.dto.AdminList;

public class LoginOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		try {
			
		 	request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			System.out.println("id : " + id);
			System.out.println("pwd : " + pwd);

			AdminList admin = null;
			AdminlistDao dao = new AdminlistDao();
			admin = dao.getAdminlist(id);
			
			System.out.println(admin);
			
			if(admin.getUserid() != null) { // 회원인 경우
				System.out.println("회원인 경우");
				if(pwd.equalsIgnoreCase(admin.getPwd())) { // 비밀번호가 맞는 경우
					//System.out.println("비밀번호가 맞는 경우");
					
					HttpSession session = request.getSession(); // servlet마다
					//session.setAttribute("userid", id);
					session.setAttribute("admindto", admin);
					forward.setRedirect(true);
					forward.setPath("index.jsp");
					//forward.setPath("/WEB-INF/login/loginok.jsp");
					
				} else { // 비밀번호가 틀린 경우
					System.out.println("비밀번호가 틀린 경우");
					
					forward.setRedirect(false);
					forward.setPath("/WEB-INF/login/login.jsp");	
					
				}
			} else { // 회원이 아닌 경우
				System.out.println("회원이 아닌 경우");
				
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/login/registerForm.jsp");
			}
		} catch (Exception e) {	
			e.printStackTrace();
		}
		return forward;
	}
}
