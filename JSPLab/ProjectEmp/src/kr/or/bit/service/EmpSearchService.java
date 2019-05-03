package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpSearchService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	    ActionForward forward = null;
	    Empdao dao =null;
	    List<Emp> emplist=null;
	    
	    try {
	      dao = new Empdao();
	      emplist = dao.getEmpAllList();
	      
	      request.setAttribute("emplist", emplist);
	      
	      forward = new ActionForward();
	      forward.setRedirect(false);
	      forward.setPath("/WEB-INF/Emp/EmpAllSearch.jsp");
	    } catch (Exception e) {
	      e.printStackTrace();
	    } 
	    
	    return forward;
	}

}
