package kr.or.bit.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.Actionforward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpDto;

//서비스 클래스
public class EmpListAction implements Action{

	@Override
	public Actionforward excute(HttpServletRequest request, HttpServletResponse response) {
		
		String empno = request.getParameter("empno");
		EmpDao dao = new EmpDao();
		List<EmpDto> resultList;
		
		
		EmpDto resultOne;
		if(empno == null) {
			resultList = dao.getEmpList();
			request.setAttribute("result", resultList);
			Actionforward forward = new Actionforward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/emp/emplist.jsp");
			return forward;
		}else {
			resultOne = dao.getEmpList(empno);
			request.setAttribute("resultOne", resultOne);
			Actionforward forward = new Actionforward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/emp/empEdit.jsp");
		
			return forward;
		}
			
	
	}
	
}
