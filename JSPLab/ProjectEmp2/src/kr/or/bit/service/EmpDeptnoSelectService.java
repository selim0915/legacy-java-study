package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpDeptnoSelectService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Empdao empdao = null;
		List<Emp> emplist = null;
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		
		try {
  		  	empdao = new Empdao();
  		  	emplist = empdao.getDeptnoList(deptno);
  		  	request.setAttribute("emplist",emplist);
		  		  
  		  	 forward = new ActionForward();
  			 forward.setRedirect(false); //forward 방식
  			 forward.setPath("/WEB-INF/Emp/emplist.jsp");

		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}

}
