package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpnoSearchService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Empdao empdao = null;
		Emp emp = null;
		int empno = Integer.parseInt(request.getParameter("empno"));
		System.out.println(empno);
		
		try {
  		  	empdao = new Empdao();
  		    emp = empdao.getEmpnoList(empno);
  		  	request.setAttribute("emplist",emp);
		  		  
  		  	 forward = new ActionForward();
  			 forward.setRedirect(false); //forward 방식
  			 forward.setPath("/WEB-INF/Emp/Empnolist.jsp");

		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}

}
