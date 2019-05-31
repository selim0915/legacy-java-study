package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.dao.EmpDao;

public class EmpDeleteAction implements Action{

	@Override
	public Actionforward excute(HttpServletRequest request, HttpServletResponse response) {
		String empno = request.getParameter("empno");
		
		EmpDao dao = new EmpDao();
		dao.updateFakeEmp(empno);
		
		Actionforward forward = new Actionforward();
		
		forward.setRedirect(true);
		forward.setPath("emplist.do");
		
		return forward;
	}

}
