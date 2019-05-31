package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpDto;

//서비스 클래스
public class EmpOneAction implements Action{

	@Override
	public Actionforward excute(HttpServletRequest request, HttpServletResponse response) {
		
		String empno = request.getParameter("empno");
		System.out.println(empno);
		EmpDao dao = new EmpDao();
		EmpDto resultOne;
		
		resultOne = dao.getEmpList(empno);
		request.setAttribute("result", resultOne);
		
			
		Actionforward forward = new Actionforward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/emp/emplist.jsp");
	
		return forward;
	}
	
}
